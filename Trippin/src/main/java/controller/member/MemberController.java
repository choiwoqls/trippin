package controller.member;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Paging_M;
import common.ViewPath;
import service.admin.AdminService;
import service.admin.HotpleService;
import service.admin.MailSendService;
import service.admin.TourService;
import service.login.LoginService;
import service.member.MemberService;
import service.member.ScheService;
import vo.common.Addr1VO;
import vo.common.DayVO;
import vo.common.HoursVO;
import vo.common.JjimVO;
import vo.common.ReviewVO;
import vo.common.Review_CmtVO;
import vo.common.Review_Cmt_LikeVO;
import vo.common.Review_LikeVO;
import vo.hotple.MenuVO;
import vo.member.M_ReportVO;
import vo.member.M_Report_CateVO;
import vo.member.MemberVO;
import vo.member.NewplaceVO;
import vo.member.NoticelistVO;
import vo.member.ReportVO;
import vo.member.Report_CateVO;
import vo.member.RevisionVO;
import vo.member.Revision_CateVO;
import vo.member.S_ReportVO;
import vo.slog.SlogVO;
import vo.slog.Slog_LikeVO;
import vo.ticket.TkjjimVO;

@Controller
public class MemberController {
	
	private TourService tourService;
	private MemberService memberService;
	private HotpleService hotpleService;
	private AdminService adminService;
	private LoginService loginService;
	private ScheService scheService;
	
	@Autowired
	private MailSendService mailSendService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	
	public MemberController(TourService tourService,
							MemberService memberService, 
							HotpleService hotpleService,
							MailSendService mailSendService,
							AdminService adminService,
							LoginService loginService,
							ScheService scheService) {
		this.tourService = tourService;
		this.memberService = memberService;
		this.hotpleService = hotpleService;
		this.mailSendService = mailSendService;
		this.adminService = adminService;
		this.loginService = loginService;
		this.scheService = scheService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		
		if(m_seq != null) {
			request.setAttribute("list", this.myNotice(m_seq));
		}
		
		return ViewPath.INDEX + "index.jsp";
	}
	
	// 이용자가 보는 리스트(관광지 + 맛집)
	@RequestMapping("/member/selectList")
	public String selectList(Model model, @RequestParam("cate_seq") int cate_seq, Integer page) {

		if(page == null) {
			page = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = memberService.count(cate_seq);
		Paging_M paging = new Paging_M(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("cate_seq", cate_seq);
		
		List<Map<String, Object>> list = memberService.selectList(map);
		
		if(list.isEmpty()) {
			list = null;
		}else {
			for(int i = 0; i < list.size(); i++) {
				String intro = (String)list.get(i).get("INTRO");
				String newintro = " " + intro;
				
				if(intro.length() >= 43) {
					list.get(i).put("INTRO", newintro.substring(1, 43) + "...");
				}else {
					list.get(i).put("INTRO", newintro);
				}
				
				String path = FILEPATH + list.get(i).get("MAIN_IMG");
				File f = new File(path);
				String[] files = f.list();
				list.get(i).put("FILE", files[0]);
				
				String avg = String.format("%.1f", (Double.parseDouble((String.valueOf(list.get(i).get("SAVG"))))));
				list.get(i).put("SAVG", avg);
			}
		}
		model.addAttribute("url", "/member/selectList?cate_seq=" + cate_seq);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		return ViewPath.MEMBER + "selectList.jsp";
	}
	
	
	//[현지]***************************************************************************************************
	@RequestMapping("/copyURL")
	public String copyURL() {
		
		return ViewPath.MEMBER + "copyURL.jsp";
	}
	

	public String profileNM(int m_seq) {
		MemberVO vo = memberService.mypage(m_seq);

		String profilePathString = vo.getM_profile();
		Path profilePath = Paths.get(profilePathString);
		
		File profile = new File(FILEPATH + profilePath);
		String[] m_profile = profile.list();
		
		return m_profile[0];
	}
	
	
	public String imgNM(String path) {
		Path profilePath = Paths.get(path);
		
		File file = new File(FILEPATH + profilePath);
		String[] files = file.list();
		
		return files[0];
	}
	
	
	
	@RequestMapping("/member/tour/selectTour")
	public String selectTour(Model model, @RequestParam("f_seq") int f_seq, HttpSession session, String filter) {
		
		//추천순, 최신순 필터
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("f_seq", f_seq);
        if(filter != null && filter.equals("")) {
        	filter = null;
        	map.put("filter", filter);
        }else {
        	map.put("filter", filter);
        }
		
		Integer m_seq = (Integer)session.getAttribute("login");
		
		boolean lgcheck = true;
		
		if(m_seq != null) {
			JjimVO vo = new JjimVO();
			vo.setF_seq(f_seq);
			vo.setM_seq(m_seq);
			
			boolean check = memberService.checkJJIM(vo);
			
			model.addAttribute("lgcheck", lgcheck);
			model.addAttribute("check", check);
		}else {
			lgcheck = false;
			model.addAttribute("lgcheck", lgcheck);
		}
		
		Map<String, Object> tour = tourService.selectTour(f_seq);
		
		if((Integer)(tour.get("savg")) != null) {
			double savg = ((int)tour.get("savg"))*1.4*10;
			
			model.addAttribute("savg", savg);
		}else {
			model.addAttribute("savg", 0);
		}
		
		List<Map<String, Object>> hlist = tourService.selectHours(f_seq) == null ? null : tourService.selectHours(f_seq);
		
		Calendar cal = Calendar.getInstance();
		int dayofWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		List<DayVO> daylist = tourService.day();
		
		String today = "";
		for(int i = 0; i < 7; i++) {
			int day = (daylist.get(i).getDay_seq() + 1) % 7;
			if(day == 0) {
				day = 7;
			}
			daylist.get(i).setDay_seq(day);
		
			if(dayofWeek == daylist.get(i).getDay_seq()) {
				today = daylist.get(i).getDay_name();
			}
		}
		
		String folderPathString = (String)tour.get("MAIN_IMG"); // 원하는 폴더 경로로 변경해주세요
        Path folderPath = Paths.get(folderPathString);
        
        File file = new File(FILEPATH + folderPath);
        
        String[] name = file.list();
        
        model.addAttribute("main_imgNM", name[0]);
        
        //최근여행 여부 따지기 - 현재 년, 월
  		int now_y = cal.get(Calendar.YEAR);
  		int now_m = cal.get(Calendar.MONTH)+1;
        
  		int rvcnt = memberService.RVcntForOne(f_seq);
  		//한 게시물에서 후기 목록 뽑기
  		List<Map<String, Object>> rvlist = memberService.rvlist(map, m_seq, f_seq, now_y, now_m);
  		
  		for (int i = 0; i < rvlist.size(); i++) {
  			
  			//리뷰 쓴 회원 프로필 사진
    		String profilePathString = (String)rvlist.get(i).get("M_PROFILE");
    		Path profilePath = Paths.get(profilePathString);
            
            File profile = new File(FILEPATH + profilePath);
            String[] m_profile = profile.list();
            rvlist.get(i).put("m_profileNM", m_profile[0]);
            
            //리뷰에 올린 사진들 rv_img
            File rvimg = new File(FILEPATH + rvlist.get(i).get("RV_IMG"));
			
		    if(rvimg != null) { 
			    String[] rv_imgNM = rvimg.list();
			  	    rvlist.get(i).put("rv_imgNM", rv_imgNM);
		    }
			
		}
//        List<Map<String, Object>> rvlist = memberService.selectRVList(map) == null ? null : memberService.selectRVList(map);
//        
//        if(rvlist != null) {
//        	for(int i = 0; i < rvlist.size(); i++) {
//        		
//        		//여행 년, 월 구하기
//        		String date = (String)rvlist.get(i).get("VISITDAY") == null ? null : (String)rvlist.get(i).get("VISITDAY");
//        		if(date != null) {
//        			
//        			String[] splitday = date.split("-");
//        			
//        			int year = Integer.parseInt(splitday[0]);
//        			int month = Integer.parseInt(splitday[1]);
//        			
//        			rvlist.get(i).put("year", year);
//        			rvlist.get(i).put("month", month);
//        			
//        			//recent = 1: 최근 여행, 0: 6개월 지난 여행
//        			if(now_y == year && (now_m - month) <= 6) {
//        				rvlist.get(i).put("recent", 1);
//        			}else if(now_y != year && (now_m - month) < 0) {
//        				if(((12 - month) + now_m) <= 6) {
//        					rvlist.get(i).put("recent", 1);
//        				}
//        			}else {
//        				rvlist.get(i).put("recent", 0);
//        			}
//        		}
//        		
//        		rvlist.get(i).put("date", date);
//        		
//        		//리뷰 쓴 회원 프로필 사진
//        		String profilePathString = (String)rvlist.get(i).get("M_PROFILE");
//                Path profilePath = Paths.get(profilePathString);
//                
//                File profile = new File(FILEPATH + profilePath);
//                String[] m_profile = profile.list();
//                
//                rvlist.get(i).put("m_profileNM", m_profile[0]);
//                
//                //리뷰에 올린 사진들 rv_img
//                File rvimg = new File(FILEPATH + rvlist.get(i).get("RV_IMG"));
//				
//			    if(rvimg != null) { 
//				    String[] rv_imgNM = rvimg.list();
//				  	    rvlist.get(i).put("rv_imgNM", rv_imgNM);
//			    }
//                
//			    //리뷰 좋아요 기능
//			    if(m_seq != null) {
//			    	Review_LikeVO rlvo = new Review_LikeVO();
//			    	rlvo.setM_seq(m_seq);
//			    	rlvo.setRv_seq(Integer.parseInt((String.valueOf(rvlist.get(i).get("RV_SEQ")))));
//			    	
//			    	boolean checkRVL = memberService.checkRVL(rlvo);
//			    	
//			    	rvlist.get(i).put("checkRVL", checkRVL);
//			    }
//			    
//			    //리뷰 내용 줄이기
//			    String content = (String)rvlist.get(i).get("CONTENT");
//				String newcontent = " " + content;
//				
//				if(content.length() >= 100) {
//					rvlist.get(i).put("CONTENT", newcontent.substring(1, 100) + "...");
//				}else {
//					rvlist.get(i).put("CONTENT", newcontent);
//				}
//			    
//				//수정, 삭제를 위한 내 게시물 구분
//				int getM_seq = Integer.parseInt(String.valueOf(rvlist.get(i).get("M_SEQ")));
//				boolean check = false;
//				
//				if(m_seq != null && m_seq == getM_seq) {
//					check = true;
//				}
//				rvlist.get(i).put("isMyRV", check);
//        	}
//        }
      
		model.addAttribute("filter", filter);
        model.addAttribute("now_y", now_y);
        model.addAttribute("now_m", now_m);
        model.addAttribute("rvlist", rvlist);
		model.addAttribute("rvcnt", rvcnt);
        model.addAttribute("today", today);
		model.addAttribute("dayofWeek", dayofWeek);
		model.addAttribute("daylist", daylist);
        model.addAttribute("hlist", hlist);
		model.addAttribute("tour", tour);
		return ViewPath.TOUR + "selectTour2.jsp";
	}

	@RequestMapping("/member/tour/term/f_seq/{f_seq}")
	public String term(@PathVariable("f_seq") int f_seq, Model model) {
		
		String term = tourService.selectTerm(f_seq);
		
		model.addAttribute("term", term);
		return ViewPath.TOUR + "term.jsp";
	}
	
	@RequestMapping(value="/member/dojjim", produces="application/text;charset=utf8")
	@ResponseBody
	public String dojjim(int f_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		JjimVO vo = new JjimVO();
		vo.setF_seq(f_seq);
		vo.setM_seq(m_seq);
		int su = memberService.insert(vo);
		
		String msg = "오류!";
		if(su != 0) {
			msg = "찜!";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/nojjim", produces="application/text;charset=utf8")
	@ResponseBody
	public String nojjim(int f_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		JjimVO vo = new JjimVO();
		vo.setF_seq(f_seq);
		vo.setM_seq(m_seq);
		
		int su = memberService.deleteJJIM(vo);
		
		String msg = "오류!";
		if(su != 0) {
			msg = "찜취소!";
		}
		System.out.println(msg);
		return msg;
	}
	
	
	@RequestMapping(value="/member/jjimcnt", produces="application/text;charset=utf8")
	@ResponseBody
	public int jjimcnt(int f_seq, HttpSession session) {
	
		int cnt = memberService.countjjim(f_seq);
	
		return cnt;
	}
	
	
//	@RequestMapping(value="/member/tour/rvFilter")
//	@ResponseBody
//	public List<Map<String, Object>> rvFilter(String filter, int f_seq){
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("f_seq", f_seq);
//		map.put("filter", filter);
//		
//		
//		System.out.println("컨트롤러로 들어온 filter?: "+filter);
//		System.out.println("컨트롤러로 들어온 f_seq?: "+f_seq);
//		List<Map<String, Object>> rvFilterList = memberService.selectRVList(map);
//		
//		if(rvFilterList.size() == 0) {
//			rvFilterList = null;
//		}
//		
//		return rvFilterList;
//	}
	
	
	
	
	
	
	
	
	@RequestMapping("/member/newplace/searchAddr")
	public String searchAddr(Model model, HttpSession session) {
		
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}
		
		
		return ViewPath.MEMBER + "/newplace/searchAddr.jsp";
	}
	
	
	@RequestMapping("/member/newplace/insertForm")
	public String insertForm(Model model, HttpServletRequest request) {
		
		String addr = request.getParameter("addr");
		
		model.addAttribute("addr", addr);
		return ViewPath.MEMBER + "/newplace/insertNewplace.jsp";
	}
	
	
	@RequestMapping("/member/newplace/npCheck")
	public String npinsertCheck(Model model, HttpSession session, HttpServletRequest request, NewplaceVO vo) {
		
		
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}
		
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		int kind = Integer.parseInt(request.getParameter("kind"));
		String reason = request.getParameter("reason");
		String info = request.getParameter("info");
		String services = request.getParameter("services");
		String extra = request.getParameter("extra");
		String email = request.getParameter("email");
		int email_status = Integer.parseInt(request.getParameter("email_status"));
		
		
		int np_seq = memberService.selectNP_seq();
		vo.setNewplace_seq(np_seq);
		vo.setM_seq(m_seq);
		vo.setName(name);
		vo.setAddr(addr);
		vo.setKind(kind);
		vo.setReason(reason);
		vo.setInfo(info);
		vo.setServices(services);
		vo.setExtra(extra);
		vo.setEmail(email);
		vo.setEmail_status(email_status);
		vo.setStatus(0);
		
	
		String realPath = "/Newplace/img/" + np_seq;
		String realPath2 = "/Newplace/info_img/" + np_seq;
		
		String savePath = FILEPATH + "/Newplace/img/" + np_seq;
		String savePath2 = FILEPATH + "/Newplace/info_img/" + np_seq;
		
		
		List<MultipartFile> files = vo.getFiles();
		List<MultipartFile> files2 = vo.getFiles2();
		String filename = null;
		String filename2 = null;
		
		
		if(files != null && files.size() != 0) {
			for(MultipartFile file : files) {
				filename = file.getOriginalFilename();
				if(!filename.equals("")) {
					File saveFile = new File(savePath, filename);
					
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
					vo.setImg(realPath);
				}
			}
		}else {
			vo.setImg(null);
		}
		if(files2 != null && files2.size() != 0) {
			for(MultipartFile file2 : files2) {
				filename2 = file2.getOriginalFilename();
				if(!filename2.equals("")) {
					File saveFile2 = new File(savePath2, filename2);
					
					if(!saveFile2.exists()) {
						saveFile2.mkdirs();
					}else {
						long time = System.currentTimeMillis();
						filename2 = String.format("%s%d%s", filename2.substring(0, filename2.lastIndexOf(".")), time, filename2.substring(filename2.lastIndexOf(".")));
						saveFile2 = new File(savePath2, filename2);
					}
					
					try {
						file2.transferTo(saveFile2);
					}catch(IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					vo.setInfo_img(realPath2);
				}
			}
		}
		int su = memberService.insert(vo);
		
		String msg = null;
		String url = null;
		
		if(su != 0) {
			msg = "새로운 장소를 알려주셔서 감사합니다.\\n장소 등록 검토는 최대 2주가 소요됩니다.\\n장소가 등록되면 여행 포인트를 드려요.\\n(5~10점)";
			url = "";
		}else {
			msg = "새로운 장소 등록에 실패하였습니다.";
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	
	//mypage
	@RequestMapping("/member/mypage")
	public String mypage(Model model, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}
		
		MemberVO mvo = memberService.mypage(m_seq);
		
		String profilePathString = mvo.getM_profile();
        Path profilePath = Paths.get(profilePathString);
        
        File profile = new File(FILEPATH + profilePath);
        String[] m_profile = profile.list();
        
        List<Map<String, Object>> myCoupon = memberService.myCoupon(m_seq);
        int cCNT = myCoupon.size();
		
        model.addAttribute("cCNT", cCNT);
        model.addAttribute("m_profileNM", m_profile[0]);
		model.addAttribute("mvo", mvo);
		
		return ViewPath.MEMBER + "mypage/mypage.jsp";
	}
	
	@RequestMapping("/member/myCoupon")
	public String myCoupon(@RequestParam("m_seq") int m_seq, Model model) {
		
		List<Map<String, Object>> myCoupon = memberService.myCoupon(m_seq);
		
		for (int i = 0; i < myCoupon.size(); i++) {
			String msg = "";
			int status = Integer.parseInt(String.valueOf(myCoupon.get(i).get("STATUS")));
			if(status == 0){
				msg = "미사용";
			}else if(status == 1) {
				msg = "사용완료";
			}else {
				msg = "만료";
			}
			myCoupon.get(i).put("msg", msg);
		}
		
		model.addAttribute("myCoupon", myCoupon);
		return ViewPath.MEMBER + "mypage/myCoupon.jsp";
	}
	
	
	//review
	@RequestMapping("/member/review/write")
	public String writeRV(@RequestParam("f_seq") int f_seq, Model model, HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		Map<String, Object> map = memberService.selectForm(f_seq);
		
		String folderPathString = (String)map.get("MAIN_IMG"); // 원하는 폴더 경로로 변경해주세요
        Path folderPath = Paths.get(folderPathString);
        
        File file2 = new File(FILEPATH + folderPath);
        
        String[] name = file2.list();
        
		
		if(m_seq != null) {
			JjimVO vo = new JjimVO();
			vo.setF_seq(f_seq);
			vo.setM_seq(m_seq);
			
			boolean check = memberService.checkJJIM(vo);
			
			model.addAttribute("check", check);
		}
		
        model.addAttribute("main_imgNM", name[0]);
		model.addAttribute("map", map);
		return ViewPath.MEMBER + "review/writeForm.jsp";
	}
	
	
	@RequestMapping("/member/review/insertCheck")
	public String insertRV(HttpServletRequest request, ReviewVO rvo) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		
		int rv_seq = memberService.nowRV_Seq();
		int f_seq = Integer.parseInt(request.getParameter("f_seq"));
		
		List<MultipartFile> files = rvo.getFiles();
		
		String realPath = "/Review/" + f_seq + "/" + rv_seq + "/";
		String savePath = FILEPATH + "/Review/" + f_seq + "/" + rv_seq + "/";
		String filename = null;
		
		
		if(files != null && files.size() != 0) {
			for(MultipartFile file : files) {
				filename = file.getOriginalFilename();
				if(!filename.equals("")) {
					File saveFile = new File(savePath, filename);
					
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
					rvo.setRv_img(realPath);
				}
			}
		}
		rvo.setRv_seq(rv_seq);
		rvo.setF_seq(f_seq);
		rvo.setM_seq(m_seq);
		
		int su = memberService.insert(rvo);
		String msg = "리뷰 등록";
		String url = "";
		
		if(su != 0) {
			//////////희지//////////////
			su = memberService.reviewPoint("review", rv_seq);
			if(su != 0) {
				memberService.afterPoint(m_seq);
			}
			//////////////////////////
			
			url = "/member/review/selectRV?rv_seq="+rv_seq;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("su", su);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping("/member/review/selectRV")
	public String selectRV(@RequestParam("rv_seq") int rv_seq, Model model, HttpSession session) {
		
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Map<String, Object> rv = memberService.selectRV(rv_seq);
		
//		int m_seqInRV = memberService.getM_seq(rv_seq);
		int m_seqInRV = Integer.parseInt(String.valueOf(rv.get("M_SEQ")));
		boolean isMyRV = false;
		
		if(m_seq != null && m_seq == m_seqInRV) {
			isMyRV = true;
		}
		
		//장소 메인 사진	
		String folderPathString = (String)rv.get("MAIN_IMG");
        Path folderPath = Paths.get(folderPathString);
        
        File file = new File(FILEPATH + folderPath);
        if(file.list() == null) {
        	model.addAttribute("main_imgNM", "default.img");
        }else {
        	String[] main = file.list();
        	model.addAttribute("main_imgNM", main[0]);
        }
        
        
        //회원 프로필 사진
        String folderPathString2 = (String)rv.get("M_PROFILE");
        Path folderPath2 = Paths.get(folderPathString2);
        
        File file2 = new File(FILEPATH + folderPath2);
        
        String[] profile = file2.list();
		
        
        //리뷰 사진들
        String folderPathString3 = (String)rv.get("RV_IMG") == null ? null : (String)rv.get("RV_IMG");
        if(folderPathString3 != null) {
        	Path folderPath3 = Paths.get(folderPathString3);
        	
        	File file3 = new File(FILEPATH + folderPath3);
        	
        	String[] rv_img = file3.list();
        	model.addAttribute("rv_img", rv_img);
        }
        model.addAttribute("path", folderPathString3);
        
        
        //리뷰 좋아요, 찜
        boolean lgcheck = true;
        if(m_seq != null) {
	    	Review_LikeVO rlvo = new Review_LikeVO();
	    	rlvo.setM_seq(m_seq);
	    	rlvo.setRv_seq(Integer.parseInt((String.valueOf(rv.get("RV_SEQ")))));
	    	
	    	boolean checkRVL = memberService.checkRVL(rlvo);
	    
	    	model.addAttribute("checkRVL", checkRVL);
	    	
	    	
	    	JjimVO vo = new JjimVO();
			vo.setF_seq(Integer.parseInt((String.valueOf(rv.get("F_SEQ")))));
			vo.setM_seq(m_seq);
			
			boolean check = memberService.checkJJIM(vo);
			
			model.addAttribute("lgcheck", lgcheck);
			model.addAttribute("check", check);
        }else {
			lgcheck = false;
			model.addAttribute("lgcheck", lgcheck);
		}	
        
        //여행 년, 월 구하기
        String date = (String)rv.get("VISITDAY") == null ? null : (String)rv.get("VISITDAY");
        if(date != null) {
        	
        	String[] splitday = date.split("-");
        	
        	model.addAttribute("year", splitday[0]);
        	model.addAttribute("month", splitday[1]);
        }
        model.addAttribute("date", date);
        
        //최근여행 여부 따지기
  		Calendar month = Calendar.getInstance();
  		
  		int now_y = month.get(Calendar.YEAR);
  		int now_m = month.get(Calendar.MONTH)+1;
  		
        
  		//좋아요 누른 회원 목록
  		List<Map<String, Object>> rvl_mlist = memberService.RVL_Mlist(rv_seq) == null ? null: memberService.RVL_Mlist(rv_seq);
  	
  		if(rvl_mlist != null) {
  			for (int i = 0; i < rvl_mlist.size(); i++) {
  				String profilePathString = (String)rvl_mlist.get(i).get("M_PROFILE");
  				Path profilePath = Paths.get(profilePathString);
  				
  				File m_profile = new File(FILEPATH + profilePath);
  		        String[] rvl_mlistNM = m_profile.list();
  		        
  		        rvl_mlist.get(i).put("rvl_mlistNM", rvl_mlistNM[0]);
			}
  		}
  		
  		
  		//리뷰 댓글
  		List<Map<String, Object>> rclist = memberService.selectRClist(rv_seq) == null ? null : memberService.selectRClist(rv_seq);
  		
  		if(rclist != null) {
  			for (int i = 0; i < rclist.size(); i++) {
  				
  				//댓글 쓴 회원들 프로필 사진 파일명
  				String rc_mlistString = (String)rclist.get(i).get("M_PROFILE");
  				Path rc_mlistPath = Paths.get(rc_mlistString);
  				
  				File rcfile = new File(FILEPATH + rc_mlistPath);
  				
  				String[] rc_mlist = rcfile.list();
  				
  				rclist.get(i).put("rc_mlistNM", rc_mlist[0]);
  				
  				//리뷰 댓글 좋아요
  				if(m_seq != null) {
  					Review_Cmt_LikeVO rclvo = new Review_Cmt_LikeVO();
  					rclvo.setM_seq(m_seq);
  					rclvo.setRv_cmt_seq((Integer.parseInt(String.valueOf(rclist.get(i).get("RV_CMT_SEQ")))));
  					
  					boolean checkRCL = memberService.checkRCL(rclvo);
  					
  					rclist.get(i).put("checkRCL", checkRCL);
  					
  					rclist.get(i).put("lgcheck", lgcheck);
  					
  				}else {
  					lgcheck = false;
  					rclist.get(i).put("lgcheck", lgcheck);
  				}
  				
  				//내가 쓴 댓글인지 판별
  				int getM_seq = Integer.parseInt(String.valueOf(rclist.get(i).get("M_SEQ")));
  				boolean isMyCmt = false;
  				if(m_seq != null && m_seq == getM_seq) {
  					isMyCmt = true;
  				}
  				rclist.get(i).put("isMyCmt", isMyCmt);
  			}
  		}
  		
  		
  		model.addAttribute("isMyRV", isMyRV);
        model.addAttribute("rclist", rclist);
  		model.addAttribute("rvl_mlist", rvl_mlist);
  		model.addAttribute("now_y", now_y);
  		model.addAttribute("now_m", now_m);
        model.addAttribute("m_profileNM", profile[0]);
		model.addAttribute("rv", rv);
		return ViewPath.MEMBER + "review/selectRV.jsp";
	}
	
	
	@RequestMapping(value="/member/dolike", produces="application/text;charset=utf8")
	@ResponseBody
	public String dolike(int rv_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Review_LikeVO vo = new Review_LikeVO();
		vo.setRv_seq(rv_seq);
		vo.setM_seq(m_seq);
		int su = memberService.insert(vo);
		
		String msg = "좋아요 오류!";
		if(su != 0) {
			msg = "좋아요";
			
			////////////희지////////////////
			rvNotice(rv_seq);	// 좋아요 알림
			
			su = memberService.rvLikePoint("review_like", rv_seq);
			if(su != 0) {
				memberService.afterPoint(m_seq);
			}
			///////////////////////////////
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/nolike", produces="application/text;charset=utf8")
	@ResponseBody
	public String nolike(int rv_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Review_LikeVO vo = new Review_LikeVO();
		vo.setRv_seq(rv_seq);
		vo.setM_seq(m_seq);
		
		int su = memberService.deleteRVL(vo);
		
		String msg = "안좋아요 오류!";
		if(su != 0) {
			msg = "안좋아요";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/countRVL", produces="application/text;charset=utf8")
	@ResponseBody
	public int countRVL(int rv_seq, HttpSession session) {
		
		int cnt = memberService.countRVL(rv_seq);
		
		return cnt;
	}
	
	
	@RequestMapping("/member/review/rvl_mlist")
	public String rvl_mlist(@RequestParam("rv_seq") int rv_seq, Model model) {
		
		int countRVL = memberService.countRVL(rv_seq);
		
		//좋아요 누른 회원 목록
  		List<Map<String, Object>> rvl_mlist = memberService.RVL_Mlist(rv_seq) == null ? null: memberService.RVL_Mlist(rv_seq);
  	
  		if(rvl_mlist != null) {
  			for (int i = 0; i < rvl_mlist.size(); i++) {
  				String profilePathString = (String)rvl_mlist.get(i).get("M_PROFILE");
  				Path profilePath = Paths.get(profilePathString);
  				
  				File m_profile = new File(FILEPATH + profilePath);
  		        String[] rvl_mlistNM = m_profile.list();
  		        
  		        rvl_mlist.get(i).put("rvl_mlistNM", rvl_mlistNM[0]);
			}
  			
  		}
		
		
		model.addAttribute("countRVL", countRVL);
		model.addAttribute("rvl_mlist", rvl_mlist);
		return ViewPath.MEMBER + "review/rvl_mlist.jsp";
	}
	
	
	@RequestMapping("/member/review/insertCMT")
	public String insertCMT(@RequestParam("rv_seq") int rv_seq, HttpServletRequest request, Review_CmtVO cvo) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		
		int rv_cmt_seq = memberService.nowRv_cmt_seq();
		int cmt_no = rv_cmt_seq;
		
		Review_CmtVO vo = new Review_CmtVO();
		vo.setRv_cmt_seq(rv_cmt_seq);
		vo.setRv_seq(rv_seq);
		vo.setM_seq(m_seq);
		
		if(cvo.getCmt_no() == 0) {
			vo.setCmt_no(cmt_no);
		}else {
			vo.setCmt_no(cvo.getCmt_no());
		}
		if(cvo.getM_seq2() == 0) {
			vo.setM_seq2(0);
			vo.setContent(cvo.getContent());
		}else {
			vo.setM_seq2(cvo.getM_seq2());
		}
		if(cvo.getDepth() == 0) {
			vo.setDepth(0);
		}else {
			vo.setDepth(1);
		}
		
		String tag = request.getParameter("tag");
		if(tag.equals("0")) {
			vo.setContent(cvo.getContent());
		}else {
			String tagname = "<span><a style='text-decoration: none; color:#2987F0;' href='/trippin/member/memberinfo?m_seq=" + cvo.getM_seq2() + "'><b>" + tag+ "</b></a></span>";
			
			vo.setContent(tagname+cvo.getContent());
		}
		
		
		int su = memberService.insert(vo);
		
		String url = "";
		String msg = "";
		
		if(su != 0) {
			url = "/member/review/selectRV?rv_seq="+rv_seq;
			msg = "댓글 등록";
			
			////////////////희지////////////////
			this.rvCmtNotice(vo);
			/////////////////////////////////
		}else {
			msg = "댓글 등록";
		}
		
		
		 request.setAttribute("url", url);
		 request.setAttribute("msg", msg);
		 request.setAttribute("su", su);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping("/member/review/updateCMT")
	public String updateCMT(@RequestParam("rv_cmt_seq") int rv_cmt_seq, HttpServletRequest request, Review_CmtVO vo) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		Review_CmtVO rvo = new Review_CmtVO();
		rvo.setM_seq(m_seq);
		rvo.setRv_cmt_seq(rv_cmt_seq);
		rvo.setContent(vo.getContent());
		
		
		String tag = request.getParameter("tag");
		System.out.println("tag?: "+tag);
		if(tag.equals("0")) {
			rvo.setContent(vo.getContent());
		}else {
			String tagname = "<span><a style='text-decoration: none; color:#2987F0;' href='/trippin/member/memberinfo?m_seq=" + vo.getM_seq2() + "'><b>" + tag+ "</b></a></span>";
			
			rvo.setContent(tagname+vo.getContent());
		}
		
		
		
		int su = memberService.updateRC(rvo);
		
		String msg = "리뷰 댓글 수정";
		String url = "";
		if(su != 0) {
			url = "/member/review/selectRV?rv_seq="+vo.getRv_seq();
		}
		
		request.setAttribute("su", su);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping("/member/review/deleteCMT")
	public String deleteCMT(@RequestParam("rv_cmt_seq") int rv_cmt_seq, @RequestParam("rv_seq") int rv_seq, HttpServletRequest request) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		
		//삭제: report_status = 2 로 업데이트 함
		int su = memberService.deleteRC(rv_cmt_seq);
		
		String url = "/member/review/selectRV?rv_seq=" + rv_seq;
		String msg = "리뷰 댓글 삭제";
		
		if(su != 0) {
			
		}
		
		request.setAttribute("su", su);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping(value="/member/dorclike", produces="application/text;charset=utf8")
	@ResponseBody
	public String dorclike(int rv_cmt_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Review_Cmt_LikeVO vo = new Review_Cmt_LikeVO();
		vo.setRv_cmt_seq(rv_cmt_seq);
		vo.setM_seq(m_seq);

		int su = memberService.insert(vo);
		
		String msg = "댓글 좋아요 오류";
		if(su != 0) {
			msg = "댓글 좋아요";
			
			////////////희지///////////
			cmtNotice(vo);
			/////////////////////////
		}
		return msg;
		
	}
	
	
	@RequestMapping(value="/member/norclike", produces="application/text;charset=utf8")
	@ResponseBody
	public String norclike(int rv_cmt_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Review_Cmt_LikeVO vo = new Review_Cmt_LikeVO();
		vo.setRv_cmt_seq(rv_cmt_seq);
		vo.setM_seq(m_seq);
		
		int su = memberService.deleteRCL(vo);
		
		String msg = "댓글 안좋아요 오류!";
		if(su != 0) {
			msg = "댓글 안좋아요";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/countRCL", produces="application/text;charset=utf8")
	@ResponseBody
	public int countRCL(int rv_cmt_seq, HttpSession session) {
		
		int cnt = memberService.countRCL(rv_cmt_seq);
		
		return cnt;
	}
	
	
	@RequestMapping("/member/review/rcl_mlist")
	public String rcl_mlist(@RequestParam("rv_cmt_seq") int rv_cmt_seq, Model model) {
		
		int countRCL = memberService.countRCL(rv_cmt_seq);
		
		List<Map<String , Object>> list = memberService.RCL_Mlist(rv_cmt_seq) == null ? null : memberService.RCL_Mlist(rv_cmt_seq);
		
		for (int i = 0; i < list.size(); i++) {
			String profilePathString = (String)list.get(i).get("M_PROFILE");
				Path profilePath = Paths.get(profilePathString);
				
				File m_profile = new File(FILEPATH + profilePath);
		        String[] rcl_mlistNM = m_profile.list();
		        
		        list.get(i).put("rcl_mlistNM", rcl_mlistNM[0]);
		}
		
		
		model.addAttribute("countRCL", countRCL);
		model.addAttribute("list", list);
		return ViewPath.MEMBER + "review/rcl_mlist.jsp";
	}
	
	
	@RequestMapping("/member/rievew/deleteRV")
	public String deleteRV(@RequestParam("rv_seq") int rv_seq, Model model, HttpServletRequest request) {
		
		Integer m_seq = (Integer) request.getSession().getAttribute("login");
		
		int su = adminService.deleteRV(rv_seq);

		/////////////////희지////////////////
		if(su != 0) {
			su = memberService.reviewPoint("review", rv_seq);
			if(su != 0) {
				memberService.afterPoint(m_seq);
			}
		}
		///////////////////////////////////
		
		String msg = "리뷰 삭제";
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		return ViewPath.MEMBER + "review/result.jsp";
	}
	
	
	@RequestMapping("/member/review/updateRV")
	public String updateRV(@RequestParam("rv_seq") int rv_seq, Model model) {
		
		Map<String, Object> rv = memberService.selectRV(rv_seq);
		String content = ((String)rv.get("CONTENT")).replaceAll("<br>", "\r\n");
		
		rv.put("newContent", content);
		//form의 메인이미지
		String path = (String)rv.get("MAIN_IMG");
		Path mainPath = Paths.get(path);
		
		File main_img = new File(FILEPATH + mainPath);
		String[] main_imgNM = main_img.list();
		
		
		//review의 이미지들
		String rv_path = (String)rv.get("RV_IMG") == null? null: (String)rv.get("RV_IMG");
		
		if(rv_path != null) {
			Path rvPath = Paths.get(rv_path);
			
			File rv_img = new File(FILEPATH + rvPath);
			String[] rv_imgNM = rv_img.list();
			
			model.addAttribute("rv_imgNM", rv_imgNM);
		}
		
		
		model.addAttribute("main_imgNM", main_imgNM[0]);
		model.addAttribute("rv", rv);
		return ViewPath.MEMBER + "review/updateForm.jsp";
	}
	
	
	@RequestMapping("/member/review/updateCheck")
	public String updateRVCheck(ReviewVO rvo, Model model, HttpServletRequest request) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		int rv_seq = rvo.getRv_seq();
		int f_seq = Integer.parseInt(request.getParameter("f_seq"));
		
		List<MultipartFile> files = rvo.getFiles();
		
		String filename = null;
		
		ReviewVO vo = new ReviewVO();
		
		String upRealPath = "/Review/" + f_seq + "/" + rv_seq + "/";
		String upSavePath = FILEPATH + "/Review/" + f_seq + "/" + rv_seq + "/";
		
		
		if(files != null && files.size() != 0) {
			for(MultipartFile file : files) {
				filename = file.getOriginalFilename();
				if(!filename.equals("")) {
					File saveFile = new File(upSavePath, filename);
					
					if(!saveFile.exists()) {
						saveFile.mkdirs();
					}else {
						long time = System.currentTimeMillis();
						filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time, filename.substring(filename.lastIndexOf(".")));
						saveFile = new File(upSavePath, filename);
					}
					
					try {
						file.transferTo(saveFile);
					}catch(IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					vo.setRv_img(upRealPath);
				}
			}
		}
		
		
		String rv_img = memberService.selectRVImg(rvo.getRv_seq()) == null ? null : memberService.selectRVImg(rvo.getRv_seq());
		
		if(rv_img != null) {
			
			Path rvPath = Paths.get(rv_img);
			
			File savePath1 = new File(FILEPATH + rvPath);
			String savePath = ""+savePath1;
			
			if(files != null && files.size() != 0) {
				File folder = new File(savePath);
				
				if(folder != null && folder.length() != 0) {
					
					if(folder.listFiles().length == 0) {
						folder.delete();
						vo.setRv_img(null);
					}else {
						for(MultipartFile file : files) {
							filename = file.getOriginalFilename();
							if(!filename.equals("")) {
								File saveFile = new File(savePath, filename);
								
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
								vo.setRv_img(rv_img);
							}else {
								vo.setRv_img(rv_img);
							}
						}
					}
				}
			}
		}
		
		vo.setStars(rvo.getStars());
		vo.setVisitday(rvo.getVisitday());
		vo.setContent(rvo.getContent().replaceAll("\r\n", "<br>"));
		vo.setRv_seq(rvo.getRv_seq());
		
		
		int su = memberService.updateRV(vo);
		
		String msg = "리뷰 수정";
		String url = "";
		
		if(su != 0) {
			url = "/member/review/selectRV?rv_seq="+rvo.getRv_seq();
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping(value="/member/review/deleteImg", produces = "application/text;charset=utf8")
	@ResponseBody
	public String deleteImg(String file, int rv_seq) {
		
		String rv_img = memberService.selectRVImg(rv_seq);
		
		String msg = "fail";
		if(rv_img != null) {
			Path rvPath = Paths.get(rv_img);
			
			File savePath = new File(FILEPATH + rvPath);
			String savePath2 = ""+savePath;
			String[] rv_imgNM = savePath.list();
			
			for(int i = 0; i < rv_imgNM.length; i++) {
				
				File folder = new File(savePath2);
				
				if(folder != null) {
					
					if(folder.listFiles() != null) {
						for(File f : folder.listFiles()) {
							if(f.getName().equals(file)) {
								f.delete();
								msg = "deleteImg";
							}
						}
					}
				}
			}
		}
		return msg;
	}
	
	
	
	@RequestMapping("/member/memberinfo")
	public String memberinfo(@RequestParam("m_seq") int m_seq, Model model, HttpSession session) {
		
		Integer my_m_seq = (Integer)session.getAttribute("login");
		
		//나의 m_info인지 아닌지 판단
		boolean isMyInfo = false;
		if(my_m_seq != null && my_m_seq == m_seq) {
			isMyInfo = true;
		}
		
		boolean lgcheck = true;
		if(my_m_seq != null) {
			model.addAttribute("lgcheck", lgcheck);
		}else {
			lgcheck = false;
			model.addAttribute("lgcheck", lgcheck);
		}
		
		Map<String, Object> map = memberService.m_info(m_seq);
		
		//리뷰 신고글 개수
		int rpCnt = memberService.rpCnt(m_seq);
		//총 리뷰 개수에서 신고 개수 빼기
		map.put("rvCnt", Integer.parseInt(String.valueOf(map.get("MRV_CNT"))) - rpCnt); 
		
		//여행기 신고글 개수
		int slog_rpCnt = memberService.slog_rpCnt(m_seq);
		//총 여행기 개수에서 신고 개수 빼기
		map.put("slogCnt", Integer.parseInt(String.valueOf(map.get("MSLOG_CNT"))) - slog_rpCnt);
		
		
		
		//회원 프로필 사진
		String profilePathString = (String)map.get("M_PROFILE");
		Path profilePath = Paths.get(profilePathString);
		
		File profile = new File(FILEPATH + profilePath);
		String[] m_profile = profile.list();
		
		
		//회원의 리뷰 장소 지역명 리스트
		List<Map<String, Object>> rv_a1list = memberService.rv_a1list(m_seq);
		
		//회원의 여행기 장소 지역명 리스트
		SlogVO vo = new SlogVO();
		vo.setM_seq(m_seq);
		vo.setStatus(0);	//신고 받지 않은 목록만 뽑음
		
		List<Addr1VO> slog_a1list = memberService.slog_a1list(vo);
		
		List<Map<String, Object>> m_RVlist = memberService.m_RVlist(m_seq) == null? null : memberService.m_RVlist(m_seq);
		
		if(m_RVlist != null) {
			for (int i = 0; i < m_RVlist.size(); i++) {
				
				
				//게시글 별 장소의 메인 이미지
				String main = (String)m_RVlist.get(i).get("MAIN_IMG");
				Path mainPath = Paths.get(main);
				
				File mainimg = new File(FILEPATH + mainPath);
				
				if(mainimg.list() == null) {
					m_RVlist.get(i).put("main_imgNM", "default.img");
					
				}else {
					String[] main_img = mainimg.list();
					if(main_img.length == 0) {
						m_RVlist.get(i).put("main_imgNM", "default.img");
					}else {
						m_RVlist.get(i).put("main_imgNM", main_img[0]);
					}
				}
				
				
				//본문 내용 줄이기
				String content = (String)m_RVlist.get(i).get("CONTENT");
				String newContent = " " + content;
				
				if(content.length() >= 200) {
					m_RVlist.get(i).put("newContent", newContent.substring(1, 200) + "...");
				}else {
					m_RVlist.get(i).put("newContent", newContent);
				}
				
				
				//리뷰 사진
				File rvimg = new File(FILEPATH + m_RVlist.get(i).get("RV_IMG"));
				
				if(rvimg != null) { 
					String[] rv_imgNM = rvimg.list();
					m_RVlist.get(i).put("rv_imgNM", rv_imgNM);
				}
				
				
				//여행 년, 월 구하기
				String date = (String)m_RVlist.get(i).get("VISITDAY") == null ? null : (String)m_RVlist.get(i).get("VISITDAY");
				
				if(date != null) {
					String[] splitday = date.split("-");
					
					m_RVlist.get(i).put("year", splitday[0]);
					m_RVlist.get(i).put("month", splitday[1]);
				}
				
				m_RVlist.get(i).put("date", date);
				
				
				//리뷰 좋아요 기능
				if(my_m_seq != null) {
					Review_LikeVO rlvo = new Review_LikeVO();
					rlvo.setM_seq(my_m_seq);
					rlvo.setRv_seq(Integer.parseInt((String.valueOf(m_RVlist.get(i).get("RV_SEQ")))));
					
					boolean checkRVL = memberService.checkRVL(rlvo);
					
					m_RVlist.get(i).put("checkRVL", checkRVL);
				}
				
				
				//수정, 삭제를 위한 내 게시물 구분
//				int rv_seq = Integer.parseInt(String.valueOf(m_RVlist.get(i).get("RV_SEQ")));
				
//				int getM_seq = memberService.getM_seq(rv_seq);
				int getM_seq = Integer.parseInt(String.valueOf(m_RVlist.get(i).get("M_SEQ")));
				boolean check = false;
				
				if(my_m_seq != null && my_m_seq == getM_seq) {
					check = true;
				}
				m_RVlist.get(i).put("isMyRV", check);
				
			}
		}
		
		//최근여행 여부 따지기
		Calendar month = Calendar.getInstance();
		
		int now_y = month.get(Calendar.YEAR);
		int now_m = month.get(Calendar.MONTH)+1;
		
		
		
		
		model.addAttribute("isMyInfo", isMyInfo);
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("now_y", now_y);
		model.addAttribute("now_m", now_m);
		model.addAttribute("m_RVlist", m_RVlist);
		model.addAttribute("rv_a1list", rv_a1list);
		model.addAttribute("slog_a1list", slog_a1list);
		model.addAttribute("m_profileNM", m_profile[0]);
		model.addAttribute("map", map);
		return ViewPath.MEMBER + "m_info/m_info.jsp";
	}
	

	
	@RequestMapping("/member/m_s_info")
	public String m_s_info(@RequestParam("m_seq") int m_seq, Model model, HttpSession session) {
		
		Integer my_m_seq = (Integer)session.getAttribute("login");
		
		
		//나의 m_info인지 아닌지 판단
		boolean isMyInfo = false;
		if(my_m_seq != null && my_m_seq == m_seq) {
			isMyInfo = true;
		}
		
		
		boolean lgcheck = true;
		if(my_m_seq != null) {
			model.addAttribute("lgcheck", lgcheck);
		}else {
			lgcheck = false;
			model.addAttribute("lgcheck", lgcheck);
		}
		

		Map<String, Object> map = memberService.m_info(m_seq);
		
		//리뷰 신고글 개수
		int rpCnt = memberService.rpCnt(m_seq);
		//총 리뷰 개수에서 신고 개수 빼기
		map.put("rvCnt", Integer.parseInt(String.valueOf(map.get("MRV_CNT"))) - rpCnt); 
		
		//여행기 신고글 개수
		int slog_rpCnt = memberService.slog_rpCnt(m_seq);
		//총 여행기 개수에서 신고 개수 빼기
		map.put("slogCnt", Integer.parseInt(String.valueOf(map.get("MSLOG_CNT"))) - slog_rpCnt);
		
		
		
		//회원 프로필 사진
		String profilePathString = (String)map.get("M_PROFILE");
		Path profilePath = Paths.get(profilePathString);
		
		File profile = new File(FILEPATH + profilePath);
		String[] m_profile = profile.list();
		
		
		//회원의 리뷰 장소 지역명 리스트
		List<Map<String, Object>> rv_a1list = memberService.rv_a1list(m_seq);
		
		//회원의 여행기 장소 지역명 리스트
		SlogVO vo = new SlogVO();
		vo.setM_seq(m_seq);
		vo.setStatus(0);	//신고 받지 않은 목록만 뽑음
		
		List<Addr1VO> slog_a1list = memberService.slog_a1list(vo);
		
		
		//회원의 여행기 리스트
		List<Map<String, Object>> m_SlogList = memberService.m_SlogList(m_seq) == null ? null : memberService.m_SlogList(m_seq);
		
		if(m_SlogList != null) {
			
			for (int i = 0; i < m_SlogList.size(); i++) {
				
				//신고받아 숨김 또는 삭제 상태는 보이지 않도록 처리
				int status = (Integer.parseInt(String.valueOf(m_SlogList.get(i).get("STATUS"))));
				if(status != 0) {
					m_SlogList.remove(i);
				}
				
				
				//여행기에 올린 사진들 img
				File img = new File(FILEPATH + m_SlogList.get(i).get("IMG"));
				
				if(img != null) { 
					String[] imgNM = img.list();
					m_SlogList.get(i).put("imgNM", imgNM);
				}
				
				//내용 줄이기
				String intro = (String)m_SlogList.get(i).get("INTRO");
				String newIntro = " " + intro;
				
				if(intro != null) {
					if(intro.length() >= 50) {
						m_SlogList.get(i).put("newIntro", newIntro.substring(1, 50) + "...");
					}
					m_SlogList.get(i).put("newIntro", newIntro);
				}
				
				
				
				
				//여행지 지역명 리스트
				String addrlist = (String)m_SlogList.get(i).get("ADDRLIST");
				
				if(addrlist.contains(",")) {
					
					String[] addr1_seq = addrlist.split(",");
					
					
					//해쉬태그용 지역명 리스트
					List<String> addr1 = new ArrayList<String>();
					
					for (int j = 0; j < addr1_seq.length; j++) {
						addr1.add(j, "#"+memberService.addr1_name(Integer.parseInt(addr1_seq[j]))+" ");
					}
					m_SlogList.get(i).put("addr1name_list", addr1);
					
				}else {
					int addr1_seq = Integer.parseInt(addrlist);
					
					//해쉬태그용 지역명 리스트
					List<String> addr1 = new ArrayList<String>();
					addr1.add(0, "#"+memberService.addr1_name(addr1_seq)+" ");
					
					m_SlogList.get(i).put("addr1name_list", addr1);
				}
				
				
				//누구와 리스트 
				String nugulist = (String)m_SlogList.get(i).get("NUGU_SEQ");
				
				if(nugulist.contains(",")) {
					String[] nugu_seq = nugulist.split(",");
					
					List<String> who = new ArrayList<String>();
					for (int j = 0; j < nugu_seq.length; j++) {
						who.add(j, "#"+memberService.selectWho(Integer.parseInt(nugu_seq[j]))+" ");
					}
					m_SlogList.get(i).put("nugulist", who);
				}else {
					int nugu_seq = Integer.parseInt(nugulist);
					List<String> who = new ArrayList<String>();
					who.add(0, "#"+memberService.selectWho(nugu_seq)+" ");
					
					m_SlogList.get(i).put("nugulist", who);
				}
				
				
				//여행 스타일 리스트
				String stylelist = (String)m_SlogList.get(i).get("STYLE_SEQ");
				
				if(stylelist.contains(",")) {
					String[] style_seq = stylelist.split(",");
					
					List<String> what = new ArrayList<String>();
					for (int j = 0; j < style_seq.length; j++) {
						what.add(j, "#"+memberService.selectWhat(Integer.parseInt(style_seq[j]))+" ");
					}
					m_SlogList.get(i).put("stylelist", what);
				}else {
					int style_seq = Integer.parseInt(stylelist);
					List<String> what = new ArrayList<String>();
					what.add(0, "#"+memberService.selectWhat(style_seq)+" ");
					
					m_SlogList.get(i).put("stylelist", what);
				}
				
				
				//출발 월
				String mon = (String)m_SlogList.get(i).get("MONTH");
				String new_mon = "#" + mon + "월출발 ";
				m_SlogList.get(i).put("month", new_mon);
				
				//몇박며칠
				String night = (String)m_SlogList.get(i).get("NIGHT");
				int day = Integer.parseInt(night) + 1;
				
				String period = "#" + night + "박" + day + "일 ";
				
				m_SlogList.get(i).put("period", period);
				
				
				
				//여행기 좋아요
				if(my_m_seq != null) {
					Slog_LikeVO slvo = new Slog_LikeVO();
					slvo.setM_seq(my_m_seq);
					slvo.setSlog_seq(Integer.parseInt((String.valueOf(m_SlogList.get(i).get("SLOG_SEQ")))));
					
					boolean checkSLike = memberService.checkSLike(slvo);
					
					m_SlogList.get(i).put("checkSLike", checkSLike);
				}
			}
		}
		

		model.addAttribute("isMyInfo", isMyInfo);
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("m_SlogList", m_SlogList);
		model.addAttribute("rv_a1list", rv_a1list);
		model.addAttribute("slog_a1list", slog_a1list);
		model.addAttribute("m_profileNM", m_profile[0]);
		model.addAttribute("map", map);
		return ViewPath.MEMBER + "m_info/m_s_info.jsp";
	}
	
	
	
	@RequestMapping(value="/member/doSlogLike", produces = "application/text;charset=utf8")
	@ResponseBody
	public String doSlogLike(int slog_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Slog_LikeVO vo = new Slog_LikeVO();
		vo.setM_seq(m_seq);
		vo.setSlog_seq(slog_seq);
		
		int su = memberService.insert(vo);
		
		String msg = "여행기 좋아요 오류";
		if(su != 0) {
			msg = "여행기 좋아요";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/noSlogLike", produces = "application/text;charset=utf8")
	@ResponseBody
	public String noSlogLike(int slog_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		Slog_LikeVO vo = new Slog_LikeVO();
		vo.setM_seq(m_seq);
		vo.setSlog_seq(slog_seq);
		
		int su = memberService.deleteSLike(vo);
		
		String msg = "여행기 안좋아요 오류";
		if(su != 0) {
			msg = "여행기 안좋아요";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/countSLike", produces="application/text;charset=utf8")
	@ResponseBody
	public int countSLike(int slog_seq, HttpSession session) {
		
		int cnt = memberService.countSLike(slog_seq);
		
		return cnt;
	}
	
	
	
	@RequestMapping("/member/mScheList")
	public String mScheList(HttpSession session, Model model) {
		
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		Map<String, Object> map = memberService.m_info(m_seq);
		
		//리뷰 신고글 개수
		int rpCnt = memberService.rpCnt(m_seq);
		//총 리뷰 개수에서 신고 개수 빼기
		map.put("rvCnt", Integer.parseInt(String.valueOf(map.get("MRV_CNT"))) - rpCnt); 
		
		//여행기 신고글 개수
		int slog_rpCnt = memberService.slog_rpCnt(m_seq);
		//총 여행기 개수에서 신고 개수 빼기
		map.put("slogCnt", Integer.parseInt(String.valueOf(map.get("MSLOG_CNT"))) - slog_rpCnt);
		
		String profileNM = profileNM(m_seq);
		
		List<Map<String, Object>> list = scheService.mScheList(m_seq);
		List<Map<String, Object>> llist = scheService.lastSche(m_seq);
		
		model.addAttribute("map", map);
		model.addAttribute("m_profileNM", profileNM);
		model.addAttribute("llist", llist);
		model.addAttribute("list", list);
		return ViewPath.MEMBER + "m_info/mScheList.jsp";
	}
	
	
	@RequestMapping("/member/editProfile")
	public String editProfile(@RequestParam("m_seq") int m_seq, Model model) {
		
		MemberVO vo = memberService.mypage(m_seq);
		
		String pf = profileNM(m_seq);
		
		
		model.addAttribute("m_profileNM", pf);
		model.addAttribute("vo", vo);
		return ViewPath.MEMBER + "m_info/editProfile.jsp";
	}
	
	
	@RequestMapping("/member/editProfile/confirm")
	public String confirm(@RequestParam("m_seq") int m_seq, Model model) {
		
		String m_email = memberService.selectM_email(m_seq);
		
		model.addAttribute("m_email", m_email);
		return ViewPath.MEMBER + "m_info/confirmEmail.jsp";
	}
	
	
	@RequestMapping("/member/editProfile/rePw")
	public String rePw(@RequestParam("m_seq") int m_seq, Model model) {
		
		MemberVO vo = memberService.mypage(m_seq);
		String m_email = vo.getM_email();
		
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("m_email", m_email);
		return ViewPath.MEMBER + "m_info/rePw.jsp";
	}
	
	
	@RequestMapping(value="/member/editProfile/sendEmail", produces="application/text;charset=utf8")
	@ResponseBody
	public String sendPwEmail(@RequestParam("m_email") String m_email, @RequestParam("m_seq") int m_seq, Model model) {
		
		return mailSendService.rePw(m_email, m_seq);
	}
	
	
	@RequestMapping("/member/editProfile/inputNewPw")
	public String inputNewPw(@RequestParam("m_seq") int m_seq, Model model) {
		
		MemberVO vo = memberService.mypage(m_seq);
		String m_email = vo.getM_email();
		
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("m_email", m_email);
		return ViewPath.MEMBER + "m_info/inputNewPw.jsp";
	}
	
	
	@RequestMapping("/member/editProfile/updatePw")
	public String updatePw(MemberVO vo, Model model) {
		
		int su = memberService.updatePw(vo);
		
		String msg = "";
		
		if(su != 0) {
			msg = "비밀번호 변경이 완료되었습니다.\\n원래 창으로 돌아가 진행해주세요.";
		}else {
			msg = "비밀번호 변경에 실패하였습니다.";
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		return ViewPath.MEMBER + "m_info/result.jsp";
	}
	
	
	@RequestMapping("/member/editProfile/updateM_info")
	public String updateM_info(MemberVO vo, Model model, HttpSession session) {
		
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		MemberVO mvo = new MemberVO();
		
		String realPath = "/Member/" + vo.getM_seq() +"/";
		String savePath = FILEPATH + realPath;
		
		MultipartFile photo = vo.getPhoto();
		
		String filename = "";
		
		String msg = "";
		String url = "";
		
		if(photo != null && !photo.isEmpty()) {
			File folder = new File(savePath);
			
			if(folder != null) {
				if(folder.listFiles() != null) {
					for(File f : folder.listFiles()) {
						f.delete();
					}
				}
			}
			
			filename = photo.getOriginalFilename();
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time, filename.substring(filename.lastIndexOf(".")));
				saveFile = new File(savePath, filename);
			}
			try {
				photo.transferTo(saveFile);
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			mvo.setM_profile(realPath);
		}else {
			mvo.setM_profile(realPath);
		}
		
		mvo.setM_nickname(vo.getM_nickname());
		mvo.setM_tel(vo.getM_tel());
		mvo.setM_seq(vo.getM_seq());
		
		
		int su = memberService.updateProfile(mvo);
		
		if(su != 0) {
			msg = "정보 수정";
			url = "/member/editProfile?m_seq="+vo.getM_seq();
		}else {
			msg = "정보 수정";
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	
	@RequestMapping("/member/mypage/mycode")
	public String mycode(@RequestParam("m_seq") int m_seq, Model model) {
		MemberVO mvo = memberService.mypage(m_seq);
		
		String pf = profileNM(m_seq);
		
		model.addAttribute("m_profileNM", pf);
		model.addAttribute("mvo", mvo);
		return ViewPath.MEMBER + "mypage/mycode.jsp";
	}
	
	
	@RequestMapping("/member/mypage/recom_code")
	public String recom_code(@RequestParam("m_seq") int m_seq, Model model) {
		MemberVO mvo = memberService.mypage(m_seq);
		String pf = profileNM(m_seq);
		
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("m_profileNM", pf);
		return ViewPath.MEMBER + "mypage/recom_code.jsp";
	}
	
	
//	@RequestMapping(value="/member/mypage/checkCode", produces="application/text;charset=utf8")
//	@ResponseBody
//	public String checkCode(String m_code) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("m_code", m_code);
//		
//		int m_seq2 = memberService.selectM_seq2(map);
//		
//		String msg = "";
//		
//		if(m_seq2 == 0) {
//			msg = "none";
//		}else {
//			msg = "exist";
//		}
//		return msg;
//	}
	
	
	@RequestMapping("/member/mypage/inputCode")
	public String inputCode(@RequestParam("recom_code") String recom_code, Model model, HttpServletRequest request) {
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		String msg = "";
		String url = "";
		
		MemberVO mvo = memberService.mypage(m_seq);
		
		if(mvo.getRecom_code() != null) {
			msg = "추천코드는 한번만 입력가능합니다.";
			url = "/member/mypage";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return ViewPath.MEMBER + "mypage/result.jsp";
		}
		
		int m_seq2 = memberService.selectM_seq2(recom_code);
		if(mvo.getM_code().equals(recom_code) || m_seq2 == 0) {
			msg = "추천코드를 확인해주세요.";
			url = "/member/mypage";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return ViewPath.MEMBER + "mypage/result.jsp";
		}
		
		MemberVO vo = new MemberVO();
		vo.setM_seq(m_seq);
		vo.setRecom_code(recom_code);
		
		int su = memberService.inputRecom_code(vo);
		
		if(su != 0) {
			msg = "추천코드 입력";
			url = "/member/mypage";
			
			////////////희지//////////////////////
			su = memberService.memberPoint("member", m_seq2, request);
			if(su != 0) {
				System.out.println("여기 들어와야 함");
				memberService.afterPoint(m_seq);
				memberService.afterPoint(m_seq2);
			}
			////////////////////////////////////
			
		}else {
			msg = "추천코드 입력";
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping("/member/selectTKlist")
	public String tkList(Model model, Integer page) {
		
		
		if(page == null) {
			page = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int cnt = memberService.tkCNT();
		Paging_M paging = new Paging_M(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<Map<String, Object>> tkList = memberService.tkList(map);
		for (int i = 0; i < tkList.size(); i++) {
			String no = (String)tkList.get(i).get("TICKET_CATE_NO");
			List<String> names = new ArrayList<String>();
			
			if(no.contains(",")) {
				String[] nos = no.split(",");
				
				for (int j = 0; j < nos.length; j++) {
					int cate_seq = Integer.parseInt(nos[j]);
					if(cate_seq != 0) {
						names.add(j, memberService.tkcateName(cate_seq));
					}
				}
				tkList.get(i).put("cateNM", names.get(0));
			}else {
				int cate_seq = Integer.parseInt(no);
				names.add(0, memberService.tkcateName(cate_seq));
				tkList.get(i).put("cateNM", names.get(0));
			}
			
		}
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("tkList", tkList);
		return ViewPath.TICKET + "list.jsp";
	}
	
	
	@RequestMapping("/member/ticket/selectTK")
	public String selectTK(@RequestParam("ticket_seq") int ticket_seq, HttpSession session, Model model) {
		
		Integer m_seq = (Integer)session.getAttribute("login");
		
		boolean lgcheck = true;
		
		if(m_seq != null) {
			TkjjimVO vo = new TkjjimVO();
			vo.setTicket_seq(ticket_seq);
			vo.setM_seq(m_seq);
			
			boolean check = memberService.checkTKJJIM(vo);
			
			model.addAttribute("lgcheck", lgcheck);
			model.addAttribute("check", check);
		}else {
			lgcheck = false;
			model.addAttribute("lgcheck", lgcheck);
		}
		
		
		Map<String, Object> tk = memberService.selectTK_m(ticket_seq);
		List<String> cates = memberService.TcateNames(ticket_seq);
		List<Map<String , Object>> ccp = memberService.selectCCP(ticket_seq);
		
		String nm = imgNM((String)tk.get("T_PARTNER_IMG"));
		
		model.addAttribute("nm", nm);
		model.addAttribute("tk", tk);
		model.addAttribute("cates", cates);
		model.addAttribute("ccp", ccp);
		return ViewPath.TICKET + "selectTK.jsp";
	}
	
	
	@RequestMapping(value="/member/doTKjjim", produces="application/text;charset=utf8")
	@ResponseBody
	public String doTKjjim(int ticket_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		TkjjimVO vo = new TkjjimVO();
		vo.setTicket_seq(ticket_seq);
		vo.setM_seq(m_seq);
		
		int su = memberService.insert(vo);
		
		String msg = "오류!";
		if(su != 0) {
			msg = "찜!";
		}
		return msg;
	}
	
	
	@RequestMapping(value="/member/noTKjjim", produces="application/text;charset=utf8")
	@ResponseBody
	public String noTKjjim(int ticket_seq, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		
		TkjjimVO vo = new TkjjimVO();
		vo.setTicket_seq(ticket_seq);
		vo.setM_seq(m_seq);
		
		
		int su = memberService.deleteJJIM(vo);
		
		String msg = "오류!";
		if(su != 0) {
			msg = "찜취소!";
		}
		System.out.println(msg);
		return msg;
	}
	
	
	@RequestMapping(value="/member/tkjjimcnt", produces="application/text;charset=utf8")
	@ResponseBody
	public int tkjjimcnt(int ticket_seq, HttpSession session) {
	
		int cnt = memberService.countTKjjim(ticket_seq);
	
		return cnt;
	}
	

	
	//[희지]***************************************************************************************************
	
	// 나의 알림창
	public List<Map<String, Object>> myNotice(int m_seq) {
		List<Map<String, Object>> list = memberService.myNotice(m_seq);
		if(list.isEmpty()) {
			list = null;
		}else {
			for(int i=0; i<list.size(); i++) {
				// 30일 넘어간 경우와 아닌 경우 나누기(~일 전, ~달 전)
				int day = Integer.parseInt(list.get(i).get("DAY").toString());
				if(day > 30) {
					list.get(i).put("WHAT", 1);
				}else {
					list.get(i).put("WHAT", 0);
				}
				
				String content = list.get(i).get("NOTICE_CONTENT").toString();
				if(list.get(i).get("CONTENT") != null) {
					String[] data1 = list.get(i).get("CONTENT").toString().split("/");
					if(data1.length == 1) {
						content = String.format(content, data1[0]);
					}else if(data1.length == 2) {
						content = String.format(content, data1[0], data1[1]);
					}else if(data1.length == 3) {
						content = String.format(content, data1[0], data1[1], data1[2]);
					}
				}
				list.get(i).put("DATA", content);
				
				String url = "";
				if(list.get(i).get("URL_IN") != null) {
					url = list.get(i).get("URL").toString();
					String[] data2 = list.get(i).get("URL_IN").toString().split(",");
					if(data2.length == 1) {
						url = String.format(url, data2[0]);
					}else if(data2.length == 2) {
						url = String.format(url, data2[0], data2[1]);
					}
				}
				list.get(i).put("PATH", url);
			}
		}
		return list;
	}
	
	// 사진 뷰페이지에서 보이기
	@RequestMapping(value="/common/getImg" , method=RequestMethod.GET)
	  public void getImg( 
	    @RequestParam(value="path") String path,
	    @RequestParam(value="file") String file,
	    HttpServletResponse response) throws Exception{

	    String DIR = FILEPATH + path;
	    String filePath = DIR+ file;

	    getImage(filePath,response);
	}
	
	// 사진 뷰페이지에서 보이기
	private void getImage(String filePath, HttpServletResponse response) throws IOException{
		File file = new File(filePath);
		
		if(!file.isFile()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.flush();
			return;
		}
		
		FileInputStream fis = null;
		
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try {
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			String type = "";
			String ext = FilenameUtils.getExtension(file.getName());
			if (ext != null && !"".equals(ext)) {
				if ("jpg".equals(ext.toLowerCase())) {
					type = "image/jpeg";
				} else {
					type = "image/" + ext.toLowerCase();
				}
	
			} else {
				System.err.println("Image fileType is null.");
			}
	
			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());
	
			bStream.writeTo(response.getOutputStream());
	
			response.getOutputStream().flush();
			response.getOutputStream().close();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bStream != null) {
				try {
					bStream.close();
				} catch (Exception est) {
					est.printStackTrace();
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (Exception ei) {
					ei.printStackTrace();
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception efis) {
					efis.printStackTrace();
				}
			}
		}
	}
	
	// 이용자 용 핫플 하나 상세
	@RequestMapping("/member/hotple/selectHotple")
	public String selectHotple(@RequestParam("f_seq") int f_seq, HttpServletRequest request, String filter) {
		
		//추천순, 최신순 필터
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("f_seq", f_seq);
        if(filter != null && filter.equals("")) {
        	filter = null;
        	map.put("filter", filter);
        }else {
        	map.put("filter", filter);
        }
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		
		// 기존 찜 체크 여부 확인
		boolean lgcheck = true;
		if(m_seq != null) {
			JjimVO vo = new JjimVO();
			vo.setF_seq(f_seq);
			vo.setM_seq(m_seq);
			
			boolean check = memberService.checkJJIM(vo);
			
			request.setAttribute("lgcheck", lgcheck);
			request.setAttribute("check", check);
		}else {
			lgcheck = false;
			request.setAttribute("lgcheck", lgcheck);
		}
		
		Map<String, Object> hotple = hotpleService.selectHotple(f_seq);
		
		if((Integer)(hotple.get("savg")) != null) {
			double savg = ((int)hotple.get("savg"))*1.4*10;
			request.setAttribute("savg", savg);
		}else {
			request.setAttribute("savg", 0);
		}
		
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
			request.setAttribute("sub", sub);
			request.setAttribute("length", sub.length+1);
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
			request.setAttribute("mname", mname);
		}
		
		//최근여행 여부 따지기 - 현재 년, 월
  		int now_y = cal.get(Calendar.YEAR);
  		int now_m = cal.get(Calendar.MONTH)+1;
		
		//한 게시물에서 후기 목록 뽑기
  		List<Map<String, Object>> rvlist = memberService.rvlist(map, m_seq, f_seq, now_y, now_m);
  		int rvcnt = memberService.RVcntForOne(f_seq);
      
		request.setAttribute("now_y", now_y);
		request.setAttribute("now_m", now_m);
		request.setAttribute("rvlist", rvlist);
		request.setAttribute("rvcnt", rvcnt);
		
		request.setAttribute("mlist", mlist);
		request.setAttribute("main", main);
		request.setAttribute("hours", oneHour);
		request.setAttribute("today", today);
		request.setAttribute("dayofWeek", dayofWeek);
		request.setAttribute("day", dayList);
		request.setAttribute("h", hotple);
		return ViewPath.HOTPLE + "selectHotple.jsp";
	}
	
	// 한 게시물 리뷰 목록 뽑기
//	public List<Map<String, Object>> rvlist(Map<String, Object> map, Integer m_seq, int f_seq, int now_y, int now_m){
//		List<Map<String, Object>> rvlist = memberService.selectRVList(map) == null ? null : memberService.selectRVList(map);
//		
//        if(rvlist != null) {
//        	for(int i = 0; i < rvlist.size(); i++) {
//        		
//        		//여행 년, 월 구하기
//        		String date = (String)rvlist.get(i).get("VISITDAY") == null ? null : (String)rvlist.get(i).get("VISITDAY");
//        		if(date != null) {
//        			
//        			String[] splitday = date.split("-");
//        			
//        			int year = Integer.parseInt(splitday[0]);
//        			int month = Integer.parseInt(splitday[1]);
//        			
//        			rvlist.get(i).put("year", year);
//        			rvlist.get(i).put("month", month);
//        			
//        			//recent = 1: 최근 여행, 0: 6개월 지난 여행
//        			if(now_y == year && (now_m - month) <= 6) {
//        				rvlist.get(i).put("recent", 1);
//        			}else if(now_y != year && (now_m - month) < 0) {
//        				if(((12 - month) + now_m) <= 6) {
//        					rvlist.get(i).put("recent", 1);
//        				}
//        			}else {
//        				rvlist.get(i).put("recent", 0);
//        			}
//        		}
//        		
//        		rvlist.get(i).put("date", date);
//        		
//        		//리뷰 쓴 회원 프로필 사진
//        		String profilePathString = (String)rvlist.get(i).get("M_PROFILE");
//                Path profilePath = Paths.get(profilePathString);
//                
//                File profile = new File(FILEPATH + profilePath);
//                String[] m_profile = profile.list();
//                
//                //rvlist.get(i).put("m_profileNM", m_profile[0]);
//                
//                //리뷰에 올린 사진들 rv_img
//                File rvimg = new File(FILEPATH + rvlist.get(i).get("RV_IMG"));
//				
//			    if(rvimg != null) { 
//				    String[] rv_imgNM = rvimg.list();
//				  	    rvlist.get(i).put("rv_imgNM", rv_imgNM);
//			    }
//                
//			    //리뷰 좋아요 기능
//			    if(m_seq != null) {
//			    	Review_LikeVO rlvo = new Review_LikeVO();
//			    	rlvo.setM_seq(m_seq);
//			    	rlvo.setRv_seq(Integer.parseInt((String.valueOf(rvlist.get(i).get("RV_SEQ")))));
//			    	
//			    	boolean checkRVL = memberService.checkRVL(rlvo);
//			    	
//			    	rvlist.get(i).put("checkRVL", checkRVL);
//			    }
//			    
//			    
//			    //리뷰 내용 줄이기
//			    String content = (String)rvlist.get(i).get("CONTENT");
//				String newcontent = " " + content;
//				
//				if(content.length() >= 100) {
//					rvlist.get(i).put("CONTENT", newcontent.substring(1, 100) + "...");
//				}else {
//					rvlist.get(i).put("CONTENT", newcontent);
//				}
//			    
//				//수정, 삭제를 위한 내 게시물 구분
//				int rv_seq = Integer.parseInt(String.valueOf(rvlist.get(i).get("RV_SEQ")));
//				int getM_seq = Integer.parseInt(String.valueOf(rvlist.get(i).get("M_SEQ")));
//				boolean check = false;
//				
//				if(m_seq != null && m_seq == getM_seq) {
//					check = true;
//				}
//				rvlist.get(i).put("isMyRV", check);
//        	}
//        }
//		return rvlist;
//	}
	
	// 신고 폼 이동
	@RequestMapping("/member/report/{who}")
	public String reviForm(@PathVariable("who")String who, HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		if(who.equals("review")) {
			List<Report_CateVO> list = memberService.r_cateList();
			request.setAttribute("list", list);
			return ViewPath.REPORT + "review.jsp";
		}else {
			List<M_Report_CateVO> mlist = memberService.mr_cateList();
			request.setAttribute("list", mlist);
			return ViewPath.REPORT + "member.jsp";
		}
	}
	
	// 리뷰 신고하기
	@RequestMapping("/member/report/rv_insert")
	public String rv_report(ReportVO  vo, HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		vo.setM_seq(m_seq);
		vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
		
		int su = memberService.r_insert(vo);
		
		request.setAttribute("su", su);
		request.setAttribute("msg", "신고 등록");
		return ViewPath.MEMBER + "popResult.jsp";
	}
	
	// 회원 신고하기
	@RequestMapping("/member/report/m_insert")
	public String m_report(M_ReportVO vo, HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		vo.setM_seq(m_seq);
		vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
		
		int su = memberService.mr_insert(vo);
		
		request.setAttribute("su", su);
		request.setAttribute("msg", "신고 등록");
		return ViewPath.MEMBER + "popResult.jsp";
	}
	
	// 본, 지점 목록 보이기
	@RequestMapping("/member/hotple/branch")
	public String branch(int f_seq, Model model) {
		List<Map<String, Object>> list = memberService.branches(f_seq);
		if(list.isEmpty()) {
			list = null;
		}else {
			for(int i = 0; i < list.size(); i++) {
				String intro = (String)list.get(i).get("INTRO");
				String newintro = " " + intro;
				
				if(intro.length() >= 43) {
					list.get(i).put("INTRO", newintro.substring(1, 43) + "...");
				}else {
					list.get(i).put("INTRO", newintro);
				}
				
				String path = FILEPATH + list.get(i).get("MAIN_IMG");
				File f = new File(path);
				String[] files = f.list();
				list.get(i).put("FILE", files[0]);
			}
		}
		model.addAttribute("list",list);
		return ViewPath.HOTPLE + "branch.jsp";
	}
	
	// 리뷰 좋아요 시 알림주기
	public void rvNotice(int rv_seq) {
		Map<String, Object> map = memberService.findReview(rv_seq);
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setM_seq(Integer.parseInt(map.get("M_SEQ").toString()));
		nvo.setNotice_seq(7);
		nvo.setContent(map.get("NAME").toString());
		nvo.setUrl_in(rv_seq + "");
		
		if(memberService.sameNotice(nvo) == 0) {
			memberService.noticeInsert(nvo);
		}
	}
	
	// 댓글 좋아요 시 알림주기
	public void cmtNotice(Review_Cmt_LikeVO vo) {
		Review_CmtVO rvo = memberService.rv_seq(vo);
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setNotice_seq(8);
		nvo.setUrl_in(rvo.getRv_seq()+"");
		
		if(rvo.getDepth() == 0) {	// 댓글인 경우
			nvo.setM_seq(rvo.getM_seq());
			nvo.setContent("댓글");
		}else {	// 답글인 경우
			nvo.setM_seq(rvo.getM_seq2());
			nvo.setContent("답글");
		}

		if(memberService.sameNotice(nvo) == 0) {
			memberService.noticeInsert(nvo);
		}
	}
	
	// 알림창 읽음 처리
	@RequestMapping("/member/notice/readThis")
	@ResponseBody
	public boolean readThis(@RequestBody Map<String, Object> map) {
		int seq = Integer.parseInt(map.get("seq").toString());
		boolean check = memberService.readThis(seq);
		return check;
	}
	
	// 신규 쿠폰팩 홍보? 창 (트리핀 그대로 가져옴)
	@RequestMapping("/member/notice/coupon")
	public String couponNotice() {
		return ViewPath.NOTICE + "couponNotice.jsp";
	}
	
	// 댓글이나 답글 쓴 경우 알림                                                                                                                                                                                                                                                                                                                                                                                    
	public void rvCmtNotice(Review_CmtVO vo) {
		NoticelistVO nvo = new NoticelistVO();
		
		System.out.println(vo.getM_seq());
		
		String nick = loginService.getM_nickname(vo.getM_seq());
		String content =  nick + "/" + vo.getContent();
		nvo.setUrl_in(vo.getRv_seq() + "");
		nvo.setNotice_seq(11);
		
		// 댓글인 경우
		if(vo.getDepth() == 0) {
			nvo.setM_seq(memberService.whoRv(vo.getRv_seq()));
			nvo.setContent(content + "/댓글");
		}else {
			// 답글인 경우
			nvo.setM_seq(vo.getM_seq2());
			nvo.setContent(content + "/답글");
		}
		
		System.out.println(nvo);
		System.out.println(nvo.getContent());
		memberService.noticeInsert(nvo);
	}
	
	// 나의 캐시내역
	@RequestMapping("/member/benefit/cash")
	public String myCash(HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		int soonEnd = memberService.soonEnd(m_seq);	//  소멸 예정 캐시
		
		List<Map<String, Object>> list = memberService.mycash(m_seq);
		if(list.isEmpty()) list = null;
		
		int canUse = memberService.canUse(m_seq);
		
		request.setAttribute("list", list);
		request.setAttribute("soonEnd", soonEnd);
		request.setAttribute("canUse", canUse);
		return ViewPath.BENEFIT + "cash.jsp";
	}
	
	// 나의 포인트 내역
	@RequestMapping("/member/benefit/point")
	public String myPoint(HttpServletRequest request) {
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		List<Map<String, Object>> list = memberService.mypoint(m_seq);
		if(list.isEmpty()) {
			list = null;
		}else {
			for(int i=0; i<list.size(); i++) {
				// 30일 넘어간 경우와 아닌 경우 나누기(~일 전, ~달 전)
				int day = Integer.parseInt(list.get(i).get("DAY").toString());
				if(day > 30) {
					list.get(i).put("WHAT", 1);
				}else {
					list.get(i).put("WHAT", 0);
				}
				
				String content = list.get(i).get("P_CONTENT").toString();;
				if(list.get(i).get("CONTENT_IN")!=null) {
					String[] data = list.get(i).get("CONTENT_IN").toString().split(",");
					if(data.length == 1) {
						content = String.format(content, data[0]);
					}else if(data.length == 2){
						content = String.format(content, data[0], data[1]);
					}
				}
				list.get(i).put("DATA", content);
				
				String url = "";
				if(list.get(i).get("URL_IN")!=null) {
					url = list.get(i).get("P_URL").toString();
					String[] data2 = list.get(i).get("URL_IN").toString().split(",");
					if(data2.length == 1) {
						url = String.format(url, data2[0]);
					}else if(data2.length == 3) {
						url = String.format(url, data2[0], data2[1], data2[2]);
					}
				}
				list.get(i).put("PATH", url);
			}
		}
		
		request.setAttribute("list", list);
		return ViewPath.BENEFIT + "point.jsp";
	}
	
	// 맛집 기간별 운영 시간
	@RequestMapping("/member/hotple/runInfo")
	public String h_runInfo(int f_seq, Model model) {
		String term = hotpleService.h_runInfo(f_seq);
		
		model.addAttribute("term", term);
		return ViewPath.HOTPLE + "term.jsp";
	}
	
	//[새미]*****************************************************************************************************
	//정보 수정 제안
	@RequestMapping("/member/revision/form")
	public String revForm(int f_seq, Model model) {
		
		List<Revision_CateVO> revCateList = memberService.revisionCateList();
		
		model.addAttribute("revCateList", revCateList);
		model.addAttribute("f_seq", f_seq);
		
		return ViewPath.MEMBER +"revision/revform.jsp";
		
	}
		
	@RequestMapping("/member/revision/write")
	public String revWrite(Model model ,RevisionVO revo,HttpServletRequest request) {
		
		
		
		Integer m_seq = (Integer)request.getSession().getAttribute("login");
		
		if(m_seq == null) {
			return ViewPath.LOGIN+"goLogin";
		}
		
	
		revo.setContent(revo.getContent().replaceAll("<br>", "\r\n"));
		
		int revision_seq = memberService.revSeqOne();
		
		
		revo.setM_seq(m_seq);
		revo.setRevision_seq(revision_seq);
		
		String path = RevisionPhotos(revo, revision_seq);
		revo.setRevision_img(path);
		
		////////////////희지/////////////////////
		int su= memberService.revInsert(revo);
		if(su != 0) {
			su = memberService.revisionPoint("revision", revo, request);
			if(su != 0) {
				memberService.afterPoint(m_seq);
			}
		}
		//////////////////////////////////////
		
		model.addAttribute("msg","정보수정제안");
		model.addAttribute("su",su);
		
		
		return ViewPath.MEMBER +"revision/result.jsp";
		
	}
	
	
	// 정보수정제안 다중 사진 저장
	public String RevisionPhotos(RevisionVO revo, int revision_seq) {

		String realPath = "/Revision/" + revision_seq+"/";
		String savePath = FILEPATH + realPath;

		MultipartFile[] photos = revo.getPhotos();

		String filename = null;

		for (MultipartFile photo : photos) {
			if (!photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File saveFile = new File(savePath, filename);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					String firstName = filename.substring(0, filename.lastIndexOf("."));
					String extension = filename.substring(filename.lastIndexOf("."));
					int count = 1;

					while (saveFile.exists()) {
						filename = String.format("%s%d%s", firstName + "_", count, extension);
						saveFile = new File(savePath, filename);
						count++;
					}
				}
				try {
					photo.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				realPath = null;
			}
		}

		return realPath;

	}
	

	//여행기 신고 insert
	@RequestMapping("/member/report/slogReport")
	public String slReport(HttpServletRequest request) {
		
		//임시로 값 넣어줌(합친 후 (넘겨 받을 값) 수정 필요)
		int kind =0;
		
		int board_no=1; //board_no로 값 받기 (여행기 or 여행기 댓글 시퀀스)
		
	
		Integer login =(Integer)request.getSession().getAttribute("login");
		
		if(login == null) {
			return ViewPath.LOGIN+"goLogin.jsp";
		}
		
		List<Report_CateVO> rclist = adminService.reviewReportCateselect();
		
		request.setAttribute("rclist",rclist );
		request.setAttribute("board_no",board_no); 
		request.setAttribute("kind",kind); 
		
		
		return ViewPath.MEMBER+"report/slog.jsp";
	}
	
	@RequestMapping("/member/sreport/s_insert")
	public String sr_insert(HttpServletRequest request) {
		
		int report_cate_seq = Integer.parseInt(request.getParameter("report_cate_seq"));
		//System.out.println(report_cate_seq);
		Integer kind = Integer.parseInt(request.getParameter("kind"));
		//System.out.println(kind);
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String email = (String) request.getParameter("email");
		String content = (String) request.getParameter("content");
		content = content.replaceAll("\r\n", "<br>");
		
		int s_report_seq = memberService.srSeq();
		int su= 0;
	
		Integer m_seq =(Integer)request.getSession().getAttribute("login");
		
		if(m_seq == null) {
			return ViewPath.LOGIN+"goLogin.jsp";
		}
		
		S_ReportVO srvo = new S_ReportVO();
		
		srvo.setS_report_seq(s_report_seq);			
		srvo.setM_seq(m_seq);
		srvo.setReport_cate_seq(report_cate_seq);
		srvo.setKind(kind);
		srvo.setBoard_no(board_no);
		srvo.setEmail(email);
		srvo.setContent(content);
	
	
		su = memberService.sr_insert(srvo);

		request.setAttribute("msg","여행기 신고 등록");
		request.setAttribute("su",su);
	
		return ViewPath.MEMBER+"report/slresult.jsp";
	}
	
	



	
}
