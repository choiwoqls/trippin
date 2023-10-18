package controller.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.ViewPath;
import service.addr.AddrService;
import service.login.LoginService;
import service.member.MemberService;
import service.member.ScheService;
import service.slog.SlogService;
import vo.member.NoticelistVO;
import vo.sche.PlanVO;
import vo.slog.Day_SlogVO;
import vo.slog.Place_SlogVO;
import vo.slog.SlogVO;
import vo.slog.Slog_AddVO;
import vo.slog.Slog_CmtVO;
import vo.slog.Slog_Cmt_LikeVO;
import vo.slog.Slog_LikeVO;

@Controller
public class SlogController {
		
	private SlogService slogService;
	private ScheService scheService;	
	private MemberService memberService;
	private AddrService addrService;
	private LoginService loginService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	
	public SlogController(SlogService slogService, 
							ScheService scheService, 
							MemberService memberService, 
							AddrService addrService,
							LoginService loginService) {
		this.slogService=slogService;
		this.scheService=scheService;
		this.memberService=memberService;
		this.addrService=addrService;
		this.loginService = loginService;
	}
	
	@RequestMapping("slog/saveCheck")
	public String newSlog(int s_seq, HttpServletRequest request, Model model) {
		
		boolean loginCheck = false;
		
		int m_seq = -1;
		if(request.getSession().getAttribute("login") != null) {
					m_seq = (int)request.getSession().getAttribute("login");
					loginCheck = true;
		}
		
		SlogVO svo = new SlogVO();
		svo.setM_seq(m_seq);
		svo.setS_seq(s_seq);
		svo = slogService.checkSlog(svo);
		
		boolean saveCheck = false;
		boolean slogCheck = false;
		
		int slog_seq = -1;
		
		if(svo != null) {
			slogCheck = true;			//이미 여행기가 작성된 경우
			slog_seq = svo.getSlog_seq();
			if(svo.getStatus() == 3) {
				saveCheck = true;				//게시글이 아닐 때
			}
		}
		 
		
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("slog_seq", slog_seq);
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("saveCheck", saveCheck);
		model.addAttribute("slogCheck", slogCheck);
		model.addAttribute("loginCheck", loginCheck);
		
		return ViewPath.SLOG + "saveCheck.jsp";
	}
	
	@RequestMapping("/slog/saveSlog")
	public String saveSlog(int s_seq, int slog_seq, int m_seq, String slogCheck, Model model) {
		
		boolean slck = Boolean.parseBoolean(slogCheck);
		
		String url = "";
		String msg = "";
		
		if(!slck) {
			Map<String, Object> sInfo = scheService.scheInfo(s_seq);
			int day = Integer.parseInt(String.valueOf(sInfo.get("DAY")));
			SlogVO svo = new SlogVO();
			String addrlist = "";
			List<Map<String, Object>> clist = scheService.selectCity(s_seq);
			int su = 0;
			for(Map<String, Object>map : clist) {
				su++;
				String addr = String.valueOf(map.get("ADDR1_SEQ"));
				if(su != 1) {
					addrlist += ",";
				}
				addrlist += addr;
			}
			int slog_seq1 = slogService.slogSeq();
			svo.setSlog_seq(slog_seq1);
			svo.setAddrlist(addrlist);
			svo.setNugu_seq((String)sInfo.get("NUGU_SEQ"));
			svo.setStyle_seq((String)sInfo.get("STYLE_SEQ"));
			svo.setM_seq(m_seq);
			svo.setTitle("");
			svo.setIntro("");
			svo.setImg("");
			Map<String, Object> dmvo = memberService.fromScheToSlog(s_seq);
			String month = String.valueOf(dmvo.get("MONTH"));
			String night = String.valueOf(dmvo.get("NIGHT"));
			svo.setMonth(month);
			svo.setNight(night);
			int loca_cnt = scheService.planCnt(s_seq);
			svo.setLoca_cnt(loca_cnt);
			svo.setScore(0);
			svo.setStatus(3);
			svo.setS_seq(s_seq);
			boolean dsck = true;
			if(slogService.newSlog(svo)) {
				for(int i = 0; i < day; i++) {
					int day_slog_seq = slogService.day_slogSeq();
					Day_SlogVO dvo = new Day_SlogVO();
					dvo.setSlog_seq(slog_seq1);
					dvo.setDay_slog_seq(day_slog_seq);
					dvo.setDay_no(i+1);
					dvo.setContent("");
					Map<String, Object> dset = new HashMap<String, Object>();
					dset.put("su", i);
					dset.put("s_seq", s_seq);
					Map<String, Object> dateM = scheService.schedy(dset);
					String date = String.valueOf(dateM.get("DAY"))+"/"+String.valueOf(dateM.get("DY"));
					dvo.setSdate(date);
					String ydate = String.valueOf(dateM.get("YDATE"));
					dvo.setYdate(ydate);
					//insert day_slog
					if(!slogService.newDaySlog(dvo)) {
						System.out.println("day_slog 테이블 생성 day"+i+1+"번째 오류");
						dsck = false;
						break;
					}
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("s_seq", s_seq);
					map.put("day_no", i+1);
					List<Map<String, Object>> plan = scheService.slogPlan(map);
					if(!plan.isEmpty()) {
						int num = 0;
						for(Map<String, Object> set : plan) {
							num++;
							int cno = Integer.parseInt(String.valueOf(set.get("CATE_SEQ")));
							int fno = Integer.parseInt(String.valueOf(set.get("F_SEQ")));
							Place_SlogVO pvo = new Place_SlogVO();
							pvo.setSlog_seq(slog_seq1);
							pvo.setDay_slog_seq(day_slog_seq);
							pvo.setStars(0);
							pvo.setContent("");
							pvo.setImg("");
							pvo.setDay_no(i+1);
							pvo.setNum(num);
							int place = cno;
							int board_no = fno;
							if(fno == 0 ) {
								place = 3;
								if(cno == 0) {
									place = 4;
								}
							}
							pvo.setPlace(place);
							pvo.setBoard_no(board_no);
							pvo.setMemo("");
							System.out.println(String.valueOf(set.get("MEMO")));
							if(String.valueOf(set.get("MEMO"))!="null") {
								pvo.setMemo(String.valueOf(set.get("MEMO")));
							}
							if(!slogService.newPlaceSlog(pvo)) {
								System.out.println("place_slog 테이블 생성 day : "+i+1+", num : " +num+"번째 오류");
								dsck = false;
								break;
							}
						}
					}
				}
				if(dsck) {
					//데이터 세팅 완료
					msg = "여행기를 남겨 보세요";
					url = "/trippin/slog/newSlog";
					model.addAttribute("slog_seq", slog_seq1);
				}else {
					//데이터 세팅 실패 
					slogService.delSlog(slog_seq1);
					msg = "데이터 세팅 오류 ,,";
					url = "/trippin/schedule/plan/planHome";
				}
			}else {
				//slog 테이블 insert 실패
				msg = "slog 입력 오류 ,,";
				url = "/trippin/schedule/plan/planHome";
			}
		}else {
			SlogVO vo = new SlogVO();
			vo.setSlog_seq(slog_seq);
			vo.setStatus(3);
			slogService.changeStatus(vo);
			msg = "여행기를 남겨 보세요";
			url = "/trippin/slog/newSlog";
			model.addAttribute("slog_seq", slog_seq);
		}
		
		
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return ViewPath.SLOG + "result.jsp";
	}
	
	@RequestMapping("/slog/newSlog")
	public String newSlog(int slog_seq, int s_seq, Model model) {		
		
		Map<String, Object> slog = slogService.slogInfo(slog_seq);
		
		List<Map<String, Object>> day_slog = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> map : slogService.daySlogList(slog_seq)) {
			int day_slog_seq = Integer.parseInt(String.valueOf(map.get("DAY_SLOG_SEQ")));
			List<Map<String, Object>> place_slog = slogService.placeSlogList(day_slog_seq);
			map.put("place_slog", place_slog);
			day_slog.add(map);
		}
		int days = day_slog.size();
		
		slog.put("day_slog", day_slog);
		slog.put("days",days);
		
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("slog", slog);
		
		return ViewPath.SLOG + "newSlog.jsp";
	}
	
	@RequestMapping(value="/slog/update", produces="application/text;charset=utf8")
	@ResponseBody
	public String update(@RequestParam("type")String type, @RequestParam("item")String item, @RequestParam("seq")int seq) {
		
		SlogVO svo = new SlogVO();
		Day_SlogVO dvo = new Day_SlogVO();
		
		String result ="";
		
		switch(type) {
		case "s_title":
			svo.setSlog_seq(seq);
			svo.setTitle(item);
			result = slogService.reSlogTitle(svo);			
			break;
		case "s_intro":
			svo.setSlog_seq(seq);
			svo.setIntro(item);
			result = slogService.reSlogIntro(svo);
			break;
		case "d_content" :
			dvo.setDay_slog_seq(seq);
			dvo.setContent(item);
			result = slogService.reDaySlogContent(dvo);
			break;
		}
			
		return result;
	}
	
	@RequestMapping("/slog/updatePlace")
	public String updatePlace(Place_SlogVO vo,  Model model, HttpServletRequest request) {
		
		int m_seq = -1;
		if(request.getSession().getAttribute("login") != null) {
			m_seq = (int)request.getSession().getAttribute("login");
		}

		
		vo.setPlace_slog_seq(vo.getPlace_slog_seq());
		vo.setSlog_seq(vo.getSlog_seq());
		vo.setDay_slog_seq(vo.getDay_slog_seq());
		vo.setStars(vo.getStars());
		vo.setContent(vo.getContent());

		String savePath = FILEPATH + "/Slog/"+m_seq+"/"+vo.getSlog_seq()+"/"+vo.getDay_slog_seq()+"/"+vo.getPlace_slog_seq();
		String realPath = "/Slog/"+m_seq+"/"+vo.getSlog_seq()+"/"+vo.getDay_slog_seq()+"/"+vo.getPlace_slog_seq();
		List<MultipartFile> flist = vo.getFiles();
		String filename = null;
		
		vo.setImg(this.fileSave(flist, realPath, savePath, filename));
		
		String msg = "";
		String url = "/trippin/slog/newSlog";
		
		if(slogService.rePlaceSlog(vo)) {
			msg = "저장성공";
		}else{
			msg = "저장실패";
		}
		int s_seq = slogService.selectS_seq(vo.getPlace_slog_seq());
		
		
		model.addAttribute("slog_seq", vo.getSlog_seq());
		model.addAttribute("s_seq", s_seq);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		return ViewPath.SLOG + "result.jsp";
	}
	
	@RequestMapping("/slog/slogImg")
	public String slogImg(Model model, SlogVO vo, HttpServletRequest request) {
		
		int m_seq = -1;
		if(request.getSession().getAttribute("login") != null) {
					m_seq = (int)request.getSession().getAttribute("login");
		}
		
		vo.setSlog_seq(vo.getSlog_seq());
		vo.setS_seq(vo.getS_seq());
		
		String savePath = FILEPATH + "/Slog/"+m_seq+"/"+vo.getSlog_seq()+"/Main/";
		String realPath = "/Slog/"+m_seq+"/"+vo.getSlog_seq()+"/Main/";
		List<MultipartFile> flist = vo.getFiles();
		String filename = null;
		
		vo.setImg(this.fileSave(flist, realPath, savePath, filename));
		
		String msg = "";
		String url = "/trippin/slog/newSlog";
		
		if(slogService.reSlogImg(vo)) {
			msg = "사진 수정";
		}else {
			msg = "사진 수정 에러,,";			
		}
		
		model.addAttribute("slog_seq", vo.getSlog_seq());
		model.addAttribute("s_seq", vo.getS_seq());
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);		
		
		return ViewPath.SLOG + "result.jsp";
	}
	
	
	@RequestMapping("/slog/reSlog")
	public String reSlog(int slog_seq, int s_seq, int m_seq ,Model model, HttpServletRequest request) {
		
		slogService.delSlog(slog_seq);
		
		String msg = "";
		String url = "";

		Map<String, Object> sInfo = scheService.scheInfo(s_seq);
		int day = Integer.parseInt(String.valueOf(sInfo.get("DAY")));
		SlogVO svo = new SlogVO();
		String addrlist = "";
		List<Map<String, Object>> clist = scheService.selectCity(s_seq);
		int su = 0;
		for(Map<String, Object>map : clist) {
			su++;
			String addr = String.valueOf(map.get("ADDR1_SEQ"));
			if(su != 1) {
				addrlist += ",";
			}
			addrlist += addr;
		}
		int slog_seq1 = slogService.slogSeq();
		svo.setSlog_seq(slog_seq1);
		svo.setAddrlist(addrlist);
		svo.setNugu_seq((String)sInfo.get("NUGU_SEQ"));
		svo.setStyle_seq((String)sInfo.get("STYLE_SEQ"));
		svo.setM_seq(m_seq);
		svo.setTitle("");
		svo.setIntro("");
		svo.setImg("");
		Map<String, Object> dmvo = memberService.fromScheToSlog(s_seq);
		String month = String.valueOf(dmvo.get("MONTH"));
		String night = String.valueOf(dmvo.get("NIGHT"));
		svo.setMonth(month);
		svo.setNight(night);
		int loca_cnt = scheService.planCnt(s_seq);
		svo.setLoca_cnt(loca_cnt);
		svo.setScore(0);
		svo.setStatus(3);
		svo.setS_seq(s_seq);
		boolean dsck = true;
		if(slogService.newSlog(svo)) {
			for(int i = 0; i < day; i++) {
				int day_slog_seq = slogService.day_slogSeq();
				Day_SlogVO dvo = new Day_SlogVO();
				dvo.setSlog_seq(slog_seq1);
				dvo.setDay_slog_seq(day_slog_seq);
				dvo.setDay_no(i+1);
				dvo.setContent("");
				Map<String, Object> dset = new HashMap<String, Object>();
				dset.put("su", i);
				dset.put("s_seq", s_seq);
				Map<String, Object> dateM = scheService.schedy(dset);
				String date = String.valueOf(dateM.get("DAY"))+"/"+String.valueOf(dateM.get("DY"));
				dvo.setSdate(date);
				String ydate = String.valueOf(dateM.get("YDATE"));
				dvo.setYdate(ydate);
				//insert day_slog
				if(!slogService.newDaySlog(dvo)) {
					System.out.println("day_slog 테이블 생성 day"+i+1+"번째 오류");
					dsck = false;
					break;
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("s_seq", s_seq);
				map.put("day_no", i+1);
				List<Map<String, Object>> plan = scheService.slogPlan(map);
				if(!plan.isEmpty()) {
					int num = 0;
					for(Map<String, Object> set : plan) {
						num++;
						int cno = Integer.parseInt(String.valueOf(set.get("CATE_SEQ")));
						int fno = Integer.parseInt(String.valueOf(set.get("F_SEQ")));
						if(cno <= 3) {
							Place_SlogVO pvo = new Place_SlogVO();
							pvo.setSlog_seq(slog_seq1);
							pvo.setDay_slog_seq(day_slog_seq);
							pvo.setStars(0);
							pvo.setContent("");
							pvo.setImg("");
							pvo.setDay_no(i+1);
							pvo.setNum(num);
							int place = cno;
							int board_no = fno;
							if(fno == 0 ) {
								place = 4;
								if(cno == 0) {
									place = 5;
								}
							}
							pvo.setPlace(place);
							pvo.setBoard_no(board_no);
							pvo.setMemo("");
							
							if(!slogService.newPlaceSlog(pvo)) {
								System.out.println("place_slog 테이블 생성 day : "+i+1+", num : " +num+"번째 오류");
								dsck = false;
								break;
							}					
						}
					}
				}
			}
			if(dsck) {
				//데이터 세팅 완료
				msg = "여행기 새로 불러오기 성공";
				url = "/trippin/slog/newSlog";
				model.addAttribute("slog_seq", slog_seq1);
			}else {
				//데이터 세팅 실패 
				slogService.delSlog(slog_seq1);
				msg = "데이터 세팅 오류 ,,";
				url = "/trippin/schedule/plan/planHome";
			}
		}else {
			//slog 테이블 insert 실패
			msg = "slog 입력 오류 ,,";
			url = "/trippin/schedule/plan/planHome";
		}
		
		
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return ViewPath.SLOG + "result.jsp";
	}
	
	
	public String fileSave(List<MultipartFile> files, String realPath, String savePath, String filename) {
		
		String result = "";
		
		File f = new File(savePath);
		File[] f1 = f.listFiles();
		if(f1 != null) {
			if(f1.length != 0) {
				for(File ff : f1) {
					if(ff.isFile()) {
						ff.delete();
					}
				}
			}			
		}
		
		if(files != null && files.size() != 0) {
			for(MultipartFile file : files) {
				filename = file.getOriginalFilename();
				if(!filename.equals("")) {
					File saveFile = new File(savePath, filename);
					System.out.println(saveFile.toString());
					if(!saveFile.exists()) {
						saveFile.mkdirs();
					}else {
						long time = System.currentTimeMillis();
						filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time, filename.substring(filename.lastIndexOf(".")));
						saveFile = new File(savePath, filename);
					}			
					try {
						file.transferTo(saveFile);
					}catch(IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					result = realPath;
				}
			}
		}
		return result;
	}
	
	@RequestMapping("/slog/postSlog")
	public String postSlog(@RequestParam("slog_seq")int slog_seq, HttpServletRequest request, Model model) {
		
		///////////희지////////////
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		int su = memberService.slogPoint("slog", slog_seq);
		if(su != 0) {
			memberService.afterPoint(m_seq);
		}
		/////////////////////////
		
		this.postSlog(slog_seq);
		
		model.addAttribute("msg","게시 완료!");
		model.addAttribute("url", "/trippin/slog/slogDetail");
		model.addAttribute("slog_seq", slog_seq);
		
		return ViewPath.SLOG + "result.jsp";
	}
	
	public void postSlog(int slog_seq) {
		SlogVO vo = new SlogVO();
		vo.setSlog_seq(slog_seq);
		vo.setStatus(0);
		slogService.changeStatus(vo);
	}
	
	@RequestMapping("/slog/slogDetail")
	public String slogDetail(@RequestParam("slog_seq")int slog_seq, Model model, HttpServletRequest request) {
		
		boolean logincheck = false;
		
		if(request.getSession().getAttribute("login")!= null) {
			logincheck = true;
		}
		
		Map<String, Object> slog = slogService.slogInfoPlus(slog_seq);
		List<Map<String, Object>> slog_day = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> p : slogService.daySlogList(slog_seq)) {
			int day_slog_seq = Integer.parseInt(String.valueOf(p.get("DAY_SLOG_SEQ")));
			List<Map<String, Object>> slog_place = slogService.placeSlogList(day_slog_seq);
			String name = "";
			String wi = "";
			String kyung = "";
			boolean su = false;
			if(slog_place != null) {
				su = true;
				for(Map<String, Object> map : slog_place) {
					wi += String.valueOf(map.get("WI"))+",";
					kyung += String.valueOf(map.get("KYUNG"))+",";
					name += String.valueOf(map.get("NAME"))+",";
				}				
			}
			p.put("CHECK", su);
			p.put("NLIST", name);
			p.put("WLIST", wi);
			p.put("KLIST", kyung);
			p.put("SLOG_PLACE", slog_place);
			slog_day.add(p);
		}
		
		slog.put("SLOG_DAY", slog_day);
		
		List<Map<String, Object>> cmtList = slogService.slogCmtList(slog_seq);
		slog.put("CMT_LIST", cmtList);
		
		String cate = "";
		
		String a = String .valueOf(slog.get("ADDRLIST"));
		
		String addr = "";
		
		if(a.contains(",")) {
			String[] alist = a.split(",");
			int[] addrlist = Stream.of(alist).mapToInt(Integer::parseInt).toArray();
			for(int i : addrlist) {
				if(i == 0) {
					addr += "#국내";
				}else {
					addr += "#" +addrService.addr_name(i);					
				}
			}
		}else {
			int ano = Integer.parseInt(a);
			addr += "#" + addrService.addr_name(ano);
		}
		
		cate += addr;
		
		String start = "#"+String.valueOf(slog.get("MONTH"))+ "월 출발";
		
		cate += start;
		
		String night = "";
		
		int day = Integer.parseInt(String.valueOf(slog.get("NIGHT")));
		
		night += "#"+day+"박"+(day+1)+"일";
		
		cate += night;
		
		String s = String.valueOf(slog.get("STYLE_SEQ"));
		
		String style = "";
		
		if(s.contains(",")) {
			String[] slist = s.split(",");
			int [] styleList = Stream.of(slist).mapToInt(Integer::parseInt).toArray();
			for(int i : styleList) {
				style +="#"+slogService.selectWhat(i);
			}
		}else {
			int nno = Integer.parseInt(s);
			style += "#"+slogService.selectWhat(nno);
		}
		
		cate += style;
		
		String n = String.valueOf(slog.get("NUGU_SEQ"));
		
		String nugu = "";
		
		if(n.contains(",")) {
			String[] nlist = n.split(",");
			int [] nuguList = Stream.of(nlist).mapToInt(Integer::parseInt).toArray();
			for(int i : nuguList) {
				nugu +="#"+slogService.selectWho(i);
			}
		}else {
			int nno = Integer.parseInt(n);
			nugu += "#"+slogService.selectWho(nno);
		}
		
		cate += nugu;
		
		slog.put("CATE", cate);
		
		
		model.addAttribute("lgcheck", logincheck);
		model.addAttribute("slog", slog);
		
		return ViewPath.SLOG + "slogDetail.jsp";
	}
	
	@RequestMapping("/slog/chooseSche")
	public String chooseSche(HttpServletRequest request, Model model, @RequestParam("day_slog_seq") int day_slog_seq, @RequestParam("slog_seq") int slog_seq) {
		
		System.out.println(day_slog_seq);
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		List<Map<String, Object>> list = scheService.mScheList(m_seq);
		
		
		model.addAttribute("list", list);
		model.addAttribute("day_slog_seq", day_slog_seq);
		model.addAttribute("slog_seq", slog_seq);
		
		return ViewPath.SLOG + "chooseSche.jsp";
		
	}
	
	@RequestMapping("/slog/copyPlan")
	public String copyPlan(int s_seq, int day_no, int day_slog_seq, int slog_seq, Model model, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		List<Map<String, Object>> place = slogService.placeSlogList(day_slog_seq);
		PlanVO vo = new PlanVO();
		vo.setDay_no(day_no);
		vo.setS_seq(s_seq);
		scheService.delDayPlan(vo);
		
		String msg = "일정 반영 성공";
		
		for(Map<String, Object> map : place) {
			boolean fcheck = false;
			PlanVO plan = new PlanVO();
			plan.setS_seq(s_seq);
			plan.setDay_no(day_no);
			int num = scheService.planLastNum(plan);
			plan.setNum(num);
			int fno = Integer.parseInt(String.valueOf(map.get("BOARD_NO")));			
			if(fno != 0) {
				fcheck = true;
				plan.setF_seq(fno);				
			}
			if(String.valueOf(map.get("MEMO")) != "null") {
				plan.setMemo(String.valueOf(map.get("MEMO")));
			}else {
				plan.setMemo("");
			}
			plan.setTime("");
			if(fcheck) {
				if(!scheService.newPlan(plan)) {
					msg = "일정 반영 실패";
					break;
				}				
			}else {
				if(!scheService.newMemo(plan)) {
					msg = "메모 복사 실패";
					break;
				}
			}
			//slog_add 테이블 작업 ,, 
			Slog_AddVO slogAdd = new Slog_AddVO(slog_seq, m_seq);
			if(!slogService.slogAddCheck(slogAdd)) {
				if(!slogService.newSlogAdd(slogAdd)) {
					msg = "여행담기 오류";
				}
			}
			
			//일정 담기 최종 성공
			///////////희지////////////
			int su = memberService.slogPlusPoint("slog_add", slog_seq);
			if(su != 0) {
				memberService.afterPoint(m_seq);
			}
			//////////////////////////
		}
		
		model.addAttribute("msg", msg);
		
		return ViewPath.SLOG + "close.jsp";
	}
	
	@RequestMapping("/slog/slogCourse")
	public String slogCourse(@RequestParam("slog_seq")int slog_seq, Model model, HttpServletRequest request) {
		
		boolean logincheck = false;
				
		if(request.getSession().getAttribute("login")!= null) {
			logincheck = true;
		}
		
		Map<String, Object> slog = slogService.slogInfoPlus(slog_seq);
		List<Map<String, Object>> slog_day = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> p : slogService.daySlogList(slog_seq)) {
			int day_slog_seq = Integer.parseInt(String.valueOf(p.get("DAY_SLOG_SEQ")));
			List<Map<String, Object>> slog_place = slogService.placeSlogList(day_slog_seq);
			String name = "";
			String wi = "";
			String kyung = "";
			
			boolean su = false;
			if(slog_place != null) {
				su = true;
				for(Map<String, Object> map : slog_place) {
					wi += String.valueOf(map.get("WI"))+",";
					kyung += String.valueOf(map.get("KYUNG"))+",";
					name += String.valueOf(map.get("NAME"))+",";
				}				
			}
			
			p.put("CHECK", su);
			p.put("NLIST", name);
			p.put("WLIST", wi);
			p.put("KLIST", kyung);
			p.put("SLOG_PLACE", slog_place);
			slog_day.add(p);
		}
		
		slog.put("SLOG_DAY", slog_day);
		
		model.addAttribute("slog", slog);
		model.addAttribute("logincheck", logincheck);
		
		return ViewPath.SLOG + "slogCourse.jsp";
	}
	
	@RequestMapping("/slog/slogList")
	public String slogList(Model model) {
		
		List<Map<String, Object>> slogList = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> map : slogService.slogList()) {
			String cate = this.slogCate(map);
			map.put("CATE", cate);
			
			int night = Integer.parseInt(String.valueOf(map.get("NIGHT")));
			
			String nd = night + "박"+(night+1) +"일";
			
			map.put("ND", nd);
			
			slogList.add(map);
			
		}
		
		model.addAttribute("slogList", slogList);
		
		return ViewPath.SLOG + "slogList.jsp";
	}
	
	@RequestMapping(value="/slog/slogLike", produces="application/text;charset=utf8")
	@ResponseBody
	public String slogLike(@RequestParam("slog_seq")int slog_seq, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		Slog_LikeVO vo = new Slog_LikeVO();
		vo.setSlog_seq(slog_seq);
		vo.setM_seq(m_seq);
		
		String result = "";
		
		if(slogService.checkSLike(vo)!=null) {
			//삭제
			if(slogService.deleteSLike(vo)) {
				result = "성공";
				//여행기 좋아요 취소
			}else {
				result = "실패";				
			}	
		}else {
			//생성
			if(slogService.insert(vo)) {
				result = "성공";			
				//여행기 좋아요 
				///////////희지////////////
				this.slLikeNotice(slog_seq);
				
				int su = memberService.slogPlusPoint("slog_like", slog_seq);
				if(su != 0) {
					memberService.afterPoint(m_seq);
				}
				////////////////////////////
				
			}else {
				result = "실패";								
			}	
		}
		return result;
	}
	
	@RequestMapping(value="/slog/slogCmt", produces="application/text;charset=utf8")
	@ResponseBody
	public String slogCmt(@RequestParam("slog_seq")int slog_seq, @RequestParam("content")String content, HttpServletRequest request) {
		
		Integer m_seq = (Integer) request.getSession().getAttribute("login");
		String result = "";
		
//		if(댓글) {
//			
//			
//		}else { 대댓글
//			
		
//		}
		
		System.out.println("slog_seq:"+slog_seq);
		
		//그냥 댓글
		Slog_CmtVO vo = new Slog_CmtVO();
		vo.setSlog_seq(slog_seq);
		vo.setM_seq(m_seq);
		vo.setContent(content);
		vo.setDepth(0);
		vo.setStatus(0);
		vo.setScore(0);
		vo.setM_seq2(0);
		if(slogService.newSlogCmt(vo)) {
			result = "성공";
			
			/////////////희지///////////////
			// 댓글이든 답글이든 하나로 처리 가능함
			this.slCmtNotice(vo);
			//////////////////////////////
			
		}else {
			result = "실패";
		}
		
		//대댓글 
		
		return result;
	}
	
	@RequestMapping(value="/slog/slogCmtLike", produces="application/text;charset=utf8")
	@ResponseBody
	public String slogCmtLike(@RequestParam("slog_cmt_seq")int slog_cmt_seq, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}

		Slog_Cmt_LikeVO vo = new Slog_Cmt_LikeVO();
		
		vo.setSlog_cmt_seq(slog_cmt_seq);
		vo.setM_seq(m_seq);
		
		String result = "";
		
		if(slogService.checkScLike(vo)!=null) {
			int slog_cmt_like_seq = slogService.checkScLike(vo);
			//삭제
			if(slogService.delScLike(slog_cmt_like_seq)) {
				result = "성공";
				//여행기 댓글 좋아요 취소
			}else {
				result = "실패";				
			}	
		}else {
			//생성
			if(slogService.newScLike(vo)) {
				result = "성공";			
				//여행기 댓글 좋아요 
				//////////////희지///////////////
				this.slCmtLikeNotice(vo);
				///////////////////////////////
			}else {
				result = "실패";								
			}	
		}
		return result;
	}
	
public String slogCate(Map<String, Object> slog) {
		
		String cate = "";
		
		String a = String .valueOf(slog.get("ADDRLIST"));
		
		String addr = "";
		
		if(a.contains(",")) {
			String[] alist = a.split(",");
			int[] addrlist = Stream.of(alist).mapToInt(Integer::parseInt).toArray();
			for(int i : addrlist) {
				if(i == 0) {
					addr += "#국내";
				}else {
					addr += "#" +addrService.addr_name(i);					
				}
			}
		}else {
			int ano = Integer.parseInt(a);
			addr += "#" + addrService.addr_name(ano);
		}
		
		cate += addr;
		
		String start = "#"+String.valueOf(slog.get("MONTH"))+ "월 출발";
		
		cate += start;
		
		String night = "";
		
		int day = Integer.parseInt(String.valueOf(slog.get("NIGHT")));
		
		night += "#"+day+"박"+(day+1)+"일";
		
		cate += night;
		
		String s = String.valueOf(slog.get("STYLE_SEQ"));
		
		String style = "";
		
		if(s.contains(",")) {
			String[] slist = s.split(",");
			int [] styleList = Stream.of(slist).mapToInt(Integer::parseInt).toArray();
			for(int i : styleList) {
				style +="#"+slogService.selectWhat(i);
			}
		}else {
			int nno = Integer.parseInt(s);
			style += "#"+slogService.selectWhat(nno);
		}
		
		cate += style;
		
		String n = String.valueOf(slog.get("NUGU_SEQ"));
		
		String nugu = "";
		
		if(n.contains(",")) {
			String[] nlist = n.split(",");
			int [] nuguList = Stream.of(nlist).mapToInt(Integer::parseInt).toArray();
			for(int i : nuguList) {
				nugu +="#"+slogService.selectWho(i);
			}
		}else {
			int nno = Integer.parseInt(n);
			nugu += "#"+slogService.selectWho(nno);
		}
		
		cate += nugu;
		
		return cate;
		
	}
	
	@RequestMapping("/slog/delSlog")
	public String delSlog(int slog_seq, Model model) {
		
		slogService.delSlog(slog_seq);
		
		
		model.addAttribute("msg", "삭제 성공");
		model.addAttribute("url", "/trippin/slog/slogList");
		
		
		return ViewPath.SLOG + "result.jsp";
	}
	
	//희지***************************************************
	// 여행기 좋아요 알림 10
	public void slLikeNotice(int slog_seq) {
		SlogVO vo = memberService.slogSome(slog_seq);
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setM_seq(vo.getM_seq());
		nvo.setContent(vo.getTitle());
		nvo.setNotice_seq(10);
		nvo.setUrl_in(slog_seq + "");
		
		if(memberService.sameNotice(nvo) == 0) {
			memberService.noticeInsert(nvo);
		}
	}
	
	// 여행기 댓글 좋아요 알림 9
	public void slCmtLikeNotice(Slog_Cmt_LikeVO vo) {
		Slog_CmtVO scvo = memberService.scmtSome(vo.getSlog_cmt_seq());
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setNotice_seq(9);
		nvo.setUrl_in(scvo.getSlog_seq() + "");
		
		if(scvo.getDepth() == 0) {	// 댓글인 경우
			nvo.setM_seq(scvo.getM_seq());
			nvo.setContent("댓글");
		}else {	// 답글인 경우
			nvo.setM_seq(scvo.getM_seq2());
			nvo.setContent("답글");
		}
		
		if(memberService.sameNotice(nvo) == 0) {
			memberService.noticeInsert(nvo);
		}
	}
	
	// 여행기 댓글 알림 12
	public void slCmtNotice(Slog_CmtVO vo) {
		NoticelistVO nvo = new NoticelistVO();
		
		String nick = loginService.getM_nickname(vo.getM_seq());
		String content = nick + "/" + vo.getContent();
		nvo.setUrl_in(vo.getSlog_seq()+"");
		nvo.setNotice_seq(12);
		
		if(vo.getDepth() == 0) {	// 댓글인 경우
			nvo.setContent(content + "/댓글"); 
			nvo.setM_seq(vo.getM_seq());
		}else {	// 답글인 경우
			nvo.setContent(content + "/답글"); 
			nvo.setM_seq(vo.getM_seq2());
		}
		
		memberService.noticeInsert(nvo);
	}
	
	
}
