package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.ViewPath;
import dao.member.MemberDAO;
import service.admin.AdminService;
import service.admin.HotpleService;
import service.member.MemberService;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.common.DayVO;
import vo.common.FormVO;
import vo.common.HoursVO;
import vo.hotple.BranchVO;
import vo.hotple.H_CateVO;
import vo.hotple.HotpleVO;
import vo.hotple.MenuVO;

@Configuration
@PropertySource(value= {"classpath:config/globals.properties"})

@Controller
public class HotpleController {

	private HotpleService hotpleService;
	private AdminService adminService;
	private MemberService memberService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	public HotpleController(HotpleService hotpleService,
			AdminService adminService,
			MemberService memberService) {
		this.hotpleService = hotpleService;
		this.adminService = adminService;
		this.memberService = memberService;
	}
	
	// 맛집 입력 폼
	@RequestMapping("/admin/hotple/insertForm")
	public String insertForm(Model model) {
		List<H_CateVO> h_cate = hotpleService.h_cate();
		List<Addr1VO> addr1 = hotpleService.addr1();
		List<DayVO> day = hotpleService.day();

		model.addAttribute("h_cate", h_cate);
		model.addAttribute("addr1", addr1);
		model.addAttribute("day", day);

		return ViewPath.ADHOTPLE + "insertHotple.jsp";
	}

	// 도시 선택 시 하위 항목 보이기
	@RequestMapping("/admin/hotple/area")
	@ResponseBody
	public List<Addr2VO> addr2(int addr1_seq) {
		List<Addr2VO> addr2 = hotpleService.addr2(addr1_seq);
		return addr2;
	}
	
	// 맛집 중복 여부(사업자번호)
	@RequestMapping("/admin/hotple/sameCheck")
	@ResponseBody
	public String sameCheck(String h_busi) {
		String check = "false";
		int su = hotpleService.sameHotple(h_busi);
		if(su == 0) {
			check = "true";
		}
		return check;
	}
	
	// 맛집 인서트
	@RequestMapping("/admin/hotple/insert")
	public String insertForm(FormVO fvo, HotpleVO hvo, HttpServletRequest request) {
		fvo.setCate_seq(2);
		fvo.setWay(fvo.getWay().replaceAll("\r\n", "<br>"));
		fvo.setTel(fvo.getTel().replaceAll("-", ""));
		
		int su = 0; String msg = "맛집 등록"; String url = "";
		
		int f_seq = hotpleService.nowF_seq();
		String path = insertMain(fvo, f_seq);
		
		if(path != null) {	// 사진이 잘 저장된 경우에만 진행
			fvo.setMain_img(path);
			fvo.setF_seq(f_seq);
			
			su = hotpleService.insertForm(fvo);
			
			if (su != 0) {	// 기본정보가 잘 저장된 경우
				String subPath = insertPhotos(hvo, fvo.getCate_seq(), f_seq);
				int h_seq = hotpleService.newSeq();
				hvo.setH_seq(h_seq);
				if(subPath != null) {
					hvo.setH_img(subPath);
				}
				
				su = insertHotple(hvo, f_seq, request);
				
				if(su != 0) {	// hotple 테이블 저장된 경우
					su = runtime(f_seq, request);
					
					if(su == 0) {	// 시간 저장 실패 시 -> hotple, form 삭제
						adminService.deleteForm(f_seq);
						// 자동으로 삭제 (cascade)
					}
					
				}else {	// hotple 저장 실패 시 -> form 테이블 삭제
					adminService.deleteForm(f_seq);
				}
			}else {	// insert 성공 못할 경우 사진 삭제
				File failPhoto = new File(path);
				deleteFolder(failPhoto);
			}
			
			if (su != 0) {
				url = "/admin/hotple/menuForm?f_seq="+f_seq;
				String msgAdd = "메뉴 등록";
				request.setAttribute("msgAdd", msgAdd);
			} 
		}
			
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.setAttribute("su", su);
		return ViewPath.ADHOTPLE + "reResult.jsp";
	}
	
	// form테이블 메인 이미지 저장
	public String insertMain(FormVO vo, int f_seq) {
		String realPath = "/Form/"+vo.getCate_seq() + "/" +  f_seq + "/Main/";
		String savePath = FILEPATH + realPath;
		
		MultipartFile photo = vo.getPhoto();
		String filename = null;
		
		if(!photo.isEmpty()) {
			File file = new File(savePath);
			if(file.exists()) deleteFolder(file);
			
			filename = photo.getOriginalFilename();
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			else {
				String firstName = filename.substring(0, filename.lastIndexOf("."));
				String extension = filename.substring(filename.lastIndexOf("."));
				int count = 1;
				
				while(saveFile.exists()) {
					filename = String.format("%s%d%s", firstName+"_", count, extension);
					saveFile = new File(savePath, filename);
					count++;
				}
			}
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}else {
			realPath = null;
		}
		return realPath;
	}
	
	// hotple 다중 이미지 저장
	public String insertPhotos(HotpleVO hvo, int cate_seq, int f_seq) {
		String realPath = "/Form/"+ cate_seq + "/" + f_seq + "/Sub/";
		String savePath = FILEPATH + realPath;
		
		MultipartFile[] photos = hvo.getPhotos();
		String filename = null;
		
		for(MultipartFile photo: photos) {
			if(!photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File saveFile = new File(savePath, filename);
				
				if(!saveFile.exists()) {
					saveFile.mkdirs();
				}else {
					String firstName = filename.substring(0, filename.lastIndexOf("."));
					String extension = filename.substring(filename.lastIndexOf("."));
					int count = 1;
					
					while(saveFile.exists()) {
						filename = String.format("%s%d%s", firstName+"_", count, extension);
						saveFile = new File(savePath, filename);
						count++;
					}
				}
				
				try {
					photo.transferTo(saveFile);
				}catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}else {
				realPath = null;
			}
		}
		return realPath;
	}
	
	// 폴더 내부 사진 삭제 + 폴더 삭제
	private void deleteFolder(File file) {
		if(file.isDirectory()) {
			File[] files = file.listFiles();
			if(files != null) {
				for(File f:files) {
					deleteFolder(f);
				}
			}
		}
		file.delete();
	}
	
	// hotple 인서트
	public int insertHotple(HotpleVO vo, int f_seq, HttpServletRequest request){
		vo.setH_runtime(vo.getH_runtime().replaceAll("\r\n", "<br>"));
		vo.setF_seq(f_seq);
		return hotpleService.insertHotple(vo);
	}
	
	// h_hours 인서트
	public int runtime(int f_seq, HttpServletRequest request) {
		int su = 0;
		
		for (int i = 1; i <= 7; i++) {
			String[] times = request.getParameterValues("time" + i);
			String hours_cate = request.getParameter("hours_cate_seq_" + i);
			HoursVO hvo = new HoursVO();
			hvo.setF_seq(f_seq);
			hvo.setDay_seq(i);
			
			if (hours_cate != null) {
				hvo.setHours_cate_seq(3); 
				hvo.setHours_seq(hotpleService.hours_seq());
				su = hotpleService.insertTime(hvo);
			} else {
				for (int j = 0; j < times.length; j++) {
					hvo.setTime(times[j]);
					if (j % 2 == 0) {
						hvo.setHours_cate_seq(1);
					} else {
						hvo.setHours_cate_seq(2);
					}
					hvo.setHours_seq(hotpleService.hours_seq());
					su = hotpleService.insertTime(hvo);
				}
			}
		}
		return su;
	}
	
	// 메뉴 입력 폼
	@RequestMapping("/admin/hotple/menuForm")
	public String menuForm() {
		return ViewPath.ADHOTPLE + "insertMenu.jsp";
	}
	
	// 메뉴 입력(리스트, 사진 메소드로 분리)
	@RequestMapping("/admin/hotple/insertMenu")
	public String insertMenu(int f_seq, MultipartHttpServletRequest request) {
		int su = menuIn(f_seq, request);
		
		String msg = "메뉴 등록";
		String url = "/admin/main";
		
		request.setAttribute("su", su);
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return ViewPath.ADHOTPLE + "result.jsp";
	}
	
	// 메뉴 리스트 받아서 인서트
	public int menuIn(int f_seq, MultipartHttpServletRequest request) {
		String[] names = request.getParameterValues("name");
		String[] infos = request.getParameterValues("info");
		String[] prices = request.getParameterValues("price");
		String[] details = request.getParameterValues("price_detail");
		
		int seq = hotpleService.nowMenu();
		List<String> pathList = menuPhoto(request, f_seq, seq);
		
		MenuVO vo = new MenuVO();
		vo.setF_seq(f_seq);
		int su = 0;
		
		for(int i=0; i<names.length; i++) {
			vo.setName(names[i]);
			vo.setInfo(infos[i]);
			vo.setPrice(prices[i]);
			vo.setPrice_detail(details[i]);
			vo.setMenu_img(pathList.get(i));
			
			su = hotpleService.insertMenu(vo);
		}
		
		if(su == 0) {	// 테이블 insert 실패할 경우 사진 삭제
			for(String path:pathList) {
				File failPhoto = new File(path);
				deleteFolder(failPhoto);
			}
		}
		return su;
	}
	
	// 메뉴 사진 폴더, 파일 저장
	public List<String> menuPhoto(MultipartHttpServletRequest request, int f_seq, int seq) {
		
		List<String> pathList = new ArrayList<String>();
		List<MultipartFile> photos = request.getFiles("photo");
		
		for(int i=0; i<photos.size(); i++) {
			String realPath = "/Form/2/"+f_seq+"/Menu/";
			realPath += (seq + i)+"/";
			String savePath = FILEPATH + realPath;
			String filename = null;
			
			if(!photos.get(i).isEmpty()) {
				filename = photos.get(i).getOriginalFilename();
				File saveFile = new File(savePath, filename);
				
				saveFile.mkdirs();
				
				try {
					photos.get(i).transferTo(saveFile);
				}catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				pathList.add(realPath);
			}
		}
		return pathList;
	}
	
	// 맛집 정보 수정 폼
	@RequestMapping("/admin/hotple/updateForm")
	public String updateForm(Model model, int f_seq) {
		List<H_CateVO> h_cate = hotpleService.h_cate();
		List<Addr1VO> addr1 = hotpleService.addr1();
		List<DayVO> day = hotpleService.day();
		
		FormVO fvo = hotpleService.formOne(f_seq);
		HotpleVO hvo = hotpleService.hotpleOne(f_seq);
		hvo.setH_runtime(hvo.getH_runtime().replace("<br>", "\r\n"));
		List<HoursVO> hlist = hotpleService.hoursOne(f_seq);

		model.addAttribute("h_cate", h_cate);
		model.addAttribute("addr1", addr1);
		model.addAttribute("day", day);
		
		model.addAttribute("fvo", fvo);
		model.addAttribute("hvo", hvo);
		model.addAttribute("hlist", hlist);
		
		return ViewPath.ADHOTPLE + "updateHotple.jsp";
	}
	
	// 맛집 업데이트
	@RequestMapping("/admin/hotple/update")
	public String update(FormVO fvo, HotpleVO hvo, int f_seq, HttpServletRequest request) {
		fvo.setCate_seq(2);
		fvo.setF_seq(f_seq);
		fvo.setTel(fvo.getTel().replaceAll("-", ""));
		fvo.setWay(fvo.getWay().replaceAll("\r\n", "<br>"));
		int su = hotpleService.update(fvo);
		
		if(su != 0) {
			insertMain(fvo, f_seq);
			insertPhotos(hvo, fvo.getCate_seq(), f_seq);
			
			hvo.setF_seq(f_seq);
			hvo.setH_runtime(hvo.getH_runtime().replaceAll("\r\n", "<br>"));
			su = hotpleService.updateHotple(hvo);
			
			if(su!=0) {
				su = updateRuntime(f_seq, request);
			}
		}
		
		request.setAttribute("su", su);
		request.setAttribute("msg", "맛집 수정");
		request.setAttribute("msgAdd", "메뉴 수정");
		request.setAttribute("url", "/admin/hotple/mUpdateForm?f_seq="+f_seq);
		return ViewPath.ADHOTPLE + "reResult.jsp";
	}
	
	// 운영 시간 수정
	public int updateRuntime(int f_seq, HttpServletRequest request) {
		int su = 0;
		
		for(int i=1; i<=7; i++) {
			String[] times = request.getParameterValues("time" + i);
			String hours_cate = request.getParameter("hours_cate_seq_" + i);
			
			HoursVO vo = new HoursVO();
			vo.setF_seq(f_seq);
			vo.setDay_seq(i);
			
			if(times == null && hours_cate==null) {
				su = 1;
			}else if(times == null && hours_cate!=null){
				su = hotpleService.hoursDelete(vo);
				if(su != 0) {
					vo.setHours_cate_seq(3);
					vo.setHours_seq(hotpleService.hours_seq());
					su = hotpleService.insertTime(vo);
				}
			}else {
				su = hotpleService.hoursDelete(vo);
				if(su != 0) {
					for(int j=0; j<times.length; j++) {
						vo.setTime(times[j]);
						if(j % 2==0) {
							vo.setHours_cate_seq(1);
						}else {
							vo.setHours_cate_seq(2);
						}
						vo.setHours_seq(hotpleService.hours_seq());
						su = hotpleService.insertTime(vo);
					}
				}
			}
		}
		return su;
	}
	
	// 맛집 메뉴 수정 폼
	@RequestMapping("/admin/hotple/mUpdateForm")
	public String mUpdateForm(int f_seq, Model model) {
		List<MenuVO> mlist = hotpleService.oneMenu(f_seq);
		model.addAttribute("mlist", mlist);
		return ViewPath.ADHOTPLE + "updateMenu.jsp";
	}
	
	// 맛집 메뉴 수정
	@RequestMapping("/admin/hotple/updateMenu")
	public String menuUpdate(int f_seq, MultipartHttpServletRequest request) {
		String[] names = request.getParameterValues("name");
		String[] infos = request.getParameterValues("info");
		String[] prices = request.getParameterValues("price");
		String[] details = request.getParameterValues("price_detail");
		String[] updateSeq = request.getParameterValues("menu_seq");
		
		List<MultipartFile> photos = request.getFiles("file");
		int su = 0;
		String realPath = "";
		
		// 기존 있던 메뉴를 지웠다면 데이터 삭제 및 폴더 삭제
		List<Integer> seqList = hotpleService.seqList(f_seq);
		List<Integer> newseqList = new ArrayList<Integer>();
		// 새로 받아온 시퀀스 들에서 null값을 제외한 리스트 만들기
		for(String seq: updateSeq) {
			if(seq != null && !seq.isEmpty()) {
				newseqList.add(Integer.parseInt(seq));
			}
		}
		
		// 기존 시퀀스 하나씩 새로 받아온 시퀀스에 포함되는지 확인 후 없으면 삭제
		for(int j=0; j<seqList.size(); j++) {
			int menu_seq = seqList.get(j);
			if(!newseqList.contains(menu_seq)) {
				realPath = hotpleService.imgPath(menu_seq);
				su = hotpleService.deleteMenu(menu_seq);
				if(su!=0) {
					File f = new File(FILEPATH + realPath);
					deleteFolder(f);
				}
			}
		}
		
		int seq = hotpleService.nowMenu();
		
		for(int i=0; i<names.length; i++) {
			MenuVO vo = new MenuVO();
			vo.setF_seq(f_seq);
			vo.setName(names[i]);
			vo.setPrice(prices[i]);
			vo.setInfo(infos[i]);
			vo.setPrice_detail(details[i]);
			
			realPath = "/Form/2/"+f_seq+"/Menu/"+(seq+i);
			String savePath = FILEPATH + realPath;
			String filename = null;
			if(Integer.parseInt(updateSeq[i]) != 0) {
				vo.setMenu_seq(Integer.parseInt(updateSeq[i]));
				su = hotpleService.menuUpdate(vo);
			}else {
				if(!photos.get(i).isEmpty()) {
					filename = photos.get(i).getOriginalFilename();
					File saveFile = new File(savePath, filename);
					saveFile.mkdirs();
					
					try {
						photos.get(i).transferTo(saveFile);
					}catch(IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					vo.setMenu_img(realPath);
				}
				
				vo.setMenu_seq(seq+i);
				su = hotpleService.insertMenu(vo);
			}
		}
		
		request.setAttribute("su", su);
		request.setAttribute("url", "/admin/hotple/one?f_seq="+f_seq);
		request.setAttribute("msg","메뉴 수정");
		return ViewPath.ADHOTPLE + "result.jsp";
	}
	
	   // 관리자가 보는 맛집 상세
	   @RequestMapping("/admin/hotple/one")
	   public String hotpleOne(int f_seq, Model model, String filter) {
	      Map<String, Object> hotple = hotpleService.selectHotple(f_seq);
	      
		    //추천순, 최신순 필터
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("f_seq", f_seq);
	        if(filter != null && filter.equals("")) {
	        	filter = null;
	        	map.put("filter", filter);
	        }else {
	        	map.put("filter", filter);
	        }
	      
	      if((Integer)(hotple.get("savg")) != null) {
	         double savg = ((int)hotple.get("savg"))*1.4*10;
	         model.addAttribute("savg", savg);
	      }else {
	         model.addAttribute("savg", 0);
	      }
	      
	      // 이용팁 09-04
	      List<Map<String, Object>> tlist = adminService.oneTip(f_seq);
	      if(tlist.isEmpty()) tlist = null;
	      model.addAttribute("tlist", tlist);
	      
	      // 영업시간
	      List<DayVO> dayList = hotpleService.day();
	      List<HoursVO> oneHour = hotpleService.oneHour(f_seq);
	      if(oneHour.isEmpty()) oneHour = null;
	      
	      // 오늘 영업시간이 가장 최근으로 올라오도록
	      Calendar cal = Calendar.getInstance();
	      int dayofWeek = cal.get(Calendar.DAY_OF_WEEK);
	      
	      String today = "";
	      for(int i = 0; i < 7; i++) {
	         int day = (dayList.get(i).getDay_seq() + 1) % 7;
	         if(day == 0) {
	            day = 7;
	         }
	         dayList.get(i).setDay_seq(day);
	      
	         if(dayofWeek == dayList.get(i).getDay_seq()) {
	            today = dayList.get(i).getDay_name();
	         }
	      }
	      
	      File f_main = new File(FILEPATH + hotple.get("MAIN_IMG"));
	      String main = f_main.list()[0];
	      
	      File f_sub = new File(FILEPATH + hotple.get("H_IMG"));
	      
	      if(f_sub != null) {
	         String[] sub = f_sub.list();
	         model.addAttribute("sub", sub);
	      }
	      
	      int cnt = hotpleService.main(f_seq);
	      if(cnt == 0) {
	         List<Integer> list = hotpleService.subList();
	         if(!list.isEmpty()) {
	            for(int i=0; i<list.size(); i++) {
	               if(list.get(i)!=null && list.get(i) == f_seq) {
	                  cnt = 1;
	               }
	            }
	         }
	      }
	      
	      List<MenuVO> mlist = hotpleService.menuOne(f_seq);
	      if(mlist.isEmpty()) { 
	         mlist = null;
	      }else {
	         List<String> mname = new ArrayList<String>();
	         for(int i=0; i<mlist.size(); i++) {
	            File m = new File(FILEPATH + mlist.get(i).getMenu_img());
	            mname.add(m.list()[0]);
	         }
	         model.addAttribute("mname", mname);
	      }
	      
	    //최근여행 여부 따지기 - 현재 년, 월
  		int now_y = cal.get(Calendar.YEAR);
  		int now_m = cal.get(Calendar.MONTH)+1;
  		
  		List<Map<String, Object>> rvlist = memberService.rvlist(map, null, f_seq, now_y, now_m);
  		int rvcnt = memberService.RVcntForOne(f_seq);
	      
  		model.addAttribute("now_y", now_y);
  		model.addAttribute("now_m", now_m);
  		model.addAttribute("rvlist", rvlist);
  		model.addAttribute("rvcnt", rvcnt);
  		
		  model.addAttribute("mlist", mlist);
		  model.addAttribute("cnt", cnt);
		  model.addAttribute("today", today);
		  model.addAttribute("dayofWeek", dayofWeek);
		  model.addAttribute("main", main);
		  model.addAttribute("hours", oneHour);
		  model.addAttribute("day", dayList);
		  model.addAttribute("h", hotple);
		  return ViewPath.ADHOTPLE + "one.jsp";
	   }
	
	// 본점 등록하기
	@RequestMapping("/admin/hotple/registerMain")
	@ResponseBody
	public int registerMain(int f_seq) {
		int su = hotpleService.registerMain(f_seq);
		return su;
	}
	
	// 지점 등록 창 이동
	@RequestMapping("/admin/hotple/registerSub")
	public String registerSub(int f_seq) {
		return ViewPath.ADHOTPLE + "branch.jsp";
	}

	// 본점 등록 리스트 부르기
	@RequestMapping("/admin/hotple/headList")
	@ResponseBody
	public List<Map<String, Object>> headList(String name){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		
		list = hotpleService.headList(map);
		if(list.isEmpty()) list = null;
		return list;
	}
	
	// 본점에 지점 연결(update)
	@RequestMapping("/admin/hotple/register")
	public String register(String f_seq, int main, Model model) {
		BranchVO bvo = hotpleService.branch(main);
		if(bvo.getBranch_no() == null) {
			bvo.setBranch_no(f_seq);
		}else {
			bvo.setBranch_no(bvo.getBranch_no() + "," + f_seq);
		}
		
		int su = hotpleService.register(bvo);
		model.addAttribute("su", su);
		model.addAttribute("msg", "지점 등록");
		return ViewPath.MEMBER + "popResult.jsp";
	}


}
