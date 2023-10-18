package controller.member;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.addr.AddrService;
import service.admin.TourService;
import service.login.LoginService;
import service.member.MemberService;
import service.member.MyclistService;
import service.member.ScheService;
import vo.common.Addr1VO;
import vo.common.CateVO;
import vo.member.MemberVO;
import vo.member.NoticelistVO;
import vo.sche.CityVO;
import vo.sche.Clist_CateVO;
import vo.sche.Clist_ItemsVO;
import vo.sche.Clist_MemoVO;
import vo.sche.InviteVO;
import vo.sche.MyclistVO;
import vo.sche.NuguVO;
import vo.sche.PlanVO;
import vo.sche.ScheVO;
import vo.sche.StyleVO;

@Configuration
@PropertySource(value= {"classpath:config/globals.properties"})

@Controller
public class ScheController {
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	@Autowired
	private ScheService scheService;
	private MyclistService myclistService;
	private AddrService addrService;
	private TourService tourService;
	private LoginService loginService;
	private MemberService memberService;

	public ScheController(ScheService scheService, 
					AddrService addrService, 
					TourService tourService, 
					MyclistService myclistService,
					LoginService loginService,
					MemberService memberService) {
		this.scheService=scheService;
		this.addrService=addrService;
		this.tourService=tourService;
		this.myclistService=myclistService;
		this.loginService = loginService;
		this.memberService = memberService;
	}
	
	
	//[재빈]**********************************************************************************************
	@RequestMapping("/schedule/sche/logincheck")
	public String loginCheck(HttpServletRequest request, Model model) {
		
		int m_seq = -1;
		boolean check = false;
		String msg = "";
		String url ="";
			
		if(request.getSession().getAttribute("login") != null) {
			m_seq = (int) request.getSession().getAttribute("login");	
			check = true;
		}
		
		
		if(m_seq == -1 ) {
			msg = "로그인 후 떠나세요";
			url = "/trippin/login/loginForm";
		}else {
			msg ="어디로든 떠나보세요";
			url =  "/trippin/schedule/sche/addrSelect";
		}
		
		model.addAttribute("check", check);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.SCHEDULE + "result.jsp";
		
	}
	
	
	@RequestMapping("/schedule/sche/addrSelect")
	public String addrSelect(Model model) {
		
		List<Addr1VO> alist = addrService.addr1List();
		
		model.addAttribute("alist", alist);
		return ViewPath.SCHEDULE + "sche/addrSelect.jsp";
		
	}
	
	@RequestMapping("/schedule/sche/daySelect")
	public String daySelect(@RequestParam(value = "nolist", required = false) String nolist, Model model, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login") != null) {
			m_seq = (int)request.getSession().getAttribute("login");
		}
		
		 List<Integer> nlist = new ArrayList<Integer>();
		 JSONParser parser = new JSONParser();
		 
		 try {
			JSONArray jsonArray = (JSONArray) parser.parse(nolist);
			
			for(Object obj : jsonArray) {
				int number = Integer.parseInt(obj.toString());
				nlist.add(number);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 //기존 일정에 있는 날짜 ,, 반영
		 
		 List<ScheVO> sdlist = scheService.m_Sche_Day(m_seq);
		 String addrlist = "";
		 for(Integer addr : nlist) {
			 if(addrlist.equals("")) {				 
				 addrlist += addr.toString();
			 }else {
				 addrlist +=",";
				 addrlist += addr.toString();				 
			 }
		 }
 
		 model.addAttribute("sdlist", sdlist);
		 model.addAttribute("addrlist", addrlist);
		return ViewPath.SCHEDULE + "sche/daySelect.jsp";
	}
	
	@RequestMapping("/schedule/sche/styleSelect")
	public String styleSelect(@RequestParam(value = "daylist", required = false) String day_list, String addrlist, Model model, HttpServletRequest request) {		
		
		List<String> dlist = new ArrayList<String>();
		
		JSONParser parser = new JSONParser();
		 
		 try {
			JSONArray jsonArray = (JSONArray) parser.parse(day_list);
			
			for(Object obj : jsonArray) {
				String date = (String)(obj.toString());
				dlist.add(date);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		 String firstday ="";
		 String lastday="";
		 
		 if(dlist.size()>=2) {
			 firstday = dlist.get(0);
			 lastday = dlist.get(1);
		 }else {
			 firstday = dlist.get(0);
		 }
		 
		 List<StyleVO> stlist = scheService.styleList();
		 List<NuguVO>nulist = scheService.nuguList();
	 
		 
		 model.addAttribute("stlist", stlist);
		 model.addAttribute("nulist", nulist);
		 model.addAttribute("addrlist", addrlist);
		 model.addAttribute("first_day", firstday);
		 model.addAttribute("last_day", lastday);
		 	
		 
		 return ViewPath.SCHEDULE + "sche/styleSelect.jsp";
		 
	}
	
	@RequestMapping("/schedule/sche/newSche")
	public String newSche(@RequestParam(value = "nglist", required = false) String ng_list, @RequestParam(value = "stlist", required = false) String st_list, 
			String addrlist, String first_day, String last_day, Model model, HttpServletRequest request) throws java.text.ParseException {
		
		int m_seq = -1;
		if(request.getSession().getAttribute("login") != null) {
					m_seq = (int)request.getSession().getAttribute("login");
		}
		
		System.out.println("11" + addrlist);
		
		
		List<String> nglist = new ArrayList<String>();
		List<String> stlist = new ArrayList<String>(); 
		
		JSONParser parser = new JSONParser();
		 
		 try {
			JSONArray jsonArray = (JSONArray) parser.parse(ng_list);
			
			for(Object obj : jsonArray) {
				String nugu = (String)(obj.toString());
				nglist.add(nugu);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		 try {
			 JSONArray jsonArray = (JSONArray) parser.parse(st_list);
			 
			 for(Object obj : jsonArray) {
				 String style = (String)(obj.toString());
				 stlist.add(style);
			 }
			 
		 } catch (ParseException e) {
			 e.printStackTrace();
		 }
		 
		 System.out.println("22" + nglist);
		 System.out.println("33" + stlist);
		 
		 String nugu_seq = "";
		 String style_seq = "";
		 if(nglist.size()==0) {
			 
		 }else {
			 for(int i =0; i<nglist.size(); i++) {
				 if(i == 0) {
					 nugu_seq += nglist.get(i);
				 }else {
					 nugu_seq += ","+nglist.get(i);			 
				 }
			 }
			 
		 }
		 
		 if(stlist.size()==0) {
			 
		 }else {
			 for(int j = 0; j <stlist.size(); j++) {
				 if(j == 0) {
					 style_seq += stlist.get(j);						 
				 }else {
					 style_seq +=  "," + stlist.get(j);
				 }
			 } 			 
		 }
		 
		 
		 String partnerlist = Integer.toString(m_seq);
		
		 if(last_day == "") {
			 last_day = first_day;
		 }
		 
		 String title = "";
		 
		 String[] addrs = addrlist.split(",");
		 int [] addr1_no = Stream.of(addrs).mapToInt(Integer::parseInt).toArray();
		 int addr1_seq1 = addr1_no[0];			 	
		 
		 for(int z = 0; z < addr1_no.length; z++) {
			 int addr_seq = addr1_no[z];
			 if(z == 0&& addr1_no.length!=1) {			 
				 if(addr_seq == 0 ) {
					 title += "국내";
				 }else {
					 title += addrService.addr_name(addr_seq);					 
				 }
			 }else if (z == addr1_no.length -1) {
				 if(addr1_no.length!=1) {
					 title+=",";
				 }
				 if(addr_seq == 0 ) {
					 title += "국내 여행";
				 }else {
					 title +=addrService.addr_name(addr_seq)+"여행";					 
				 }
			}else {
				if(addr_seq == 0 ) {
					title += ",국내";
				}else {
					title += "," + addrService.addr_name(addr_seq);					
				}
			}
		 }
		 
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		 
		 java.util.Date firstday_ = formatter.parse(first_day);
		 java.util.Date lastday_ = formatter.parse(last_day);
		 
		 long fd = firstday_.getTime();
		 long ld = lastday_.getTime();
		 
		 Date firstday = new Date(fd);
		 Date lastday = new Date(ld);

		 int s_seq = scheService.sche_seq();
		 
		 ScheVO scvo = new  ScheVO(s_seq, title, partnerlist, nugu_seq, style_seq, firstday, lastday);
		 
		 String msg = "";
		 String url = "";
		 
		 if(scheService.newSche(scvo)) {
			 int num = 0;
			 boolean cb = false;
			 for(int addr1_seq : addr1_no) {				 
				 num++;
				 CityVO cvo = new CityVO(s_seq, addr1_seq, num);
				 if(scheService.newCity(cvo)) {
					 cb = true;
				 }else {
					 cb = false;
					 break;
				 }
			 }
			 if(cb) {
				 InviteVO ivo = new InviteVO(m_seq, m_seq, s_seq, 2);
				 if(scheService.newIv(ivo)) {
					 msg = "나만의 일정을 만들어보세요 !~!";
					 url = "/trippin/schedule/sche/scheHome";
				 }else {
					 scheService.delCity(s_seq);
					 scheService.delSche(s_seq);
					 msg = "일정 참여 오류";
					 url = "/trippin/";
				 }
			 }else {
				 scheService.delSche(s_seq);
				 msg = "일정 도시 오류";
				 url = "/trippin/";
			 }
			 
		 }else {
			 msg = "일정생성 오류";
			 url = "/trippin/";
		 } 
		 
		 model.addAttribute("addr1_seq1", addr1_seq1);
		 model.addAttribute("s_seq", s_seq);
		 model.addAttribute("msg", msg);
		 model.addAttribute("url", url);	 
		 
		 return ViewPath.SCHEDULE + "result.jsp";
	}
	
	@RequestMapping("/schedule/sche/listLogin")
	public String listLogin(HttpServletRequest request, Model model) {
		int m_seq = -1;
		boolean check = false;
		String msg = "";
		String url ="";
			
		if(request.getSession().getAttribute("login") != null) {
			m_seq = (int) request.getSession().getAttribute("login");	
			check = true;
		}
		
		
		if(m_seq == -1 ) {
			msg = "로그인 후 이용하세요";
			url = "/trippin/login/loginForm";
		}else {
			msg ="여행 리스트를 확인해 보세요";
			url =  "/trippin/schedule/sche/scheList";
		}
		
		model.addAttribute("check", check);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.SCHEDULE + "result.jsp";
	}
	
	@RequestMapping("/schedule/sche/scheList")
	public String scheList(HttpServletRequest request, Model model) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		List<Map<String, Object>> list = scheService.mScheList(m_seq);
		List<Map<String, Object>> llist = scheService.lastSche(m_seq);
		
		model.addAttribute("llist", llist);
		model.addAttribute("list", list);
		return ViewPath.SCHEDULE +"sche/scheList.jsp";
		
	}
	
	
	@RequestMapping("/schedule/sche/scheHome")
	public String scheHome(int s_seq, Model model, int addr1_seq1) {
		
		if(addr1_seq1 == -1) {
			addr1_seq1 = scheService.firstCity(s_seq);
		}
		
		Map<String, Object> scheInfo  = scheService.scheInfo(s_seq);
		List<Map<String, Object>> clist = scheService.selectCity(s_seq);
		Map<String, Object> cmap = new HashMap<String, Object>();

		List<Map<String, Object>> hlist = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> mlist = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> slist = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> tlist = new ArrayList<Map<String,Object>>();
		
		if(addr1_seq1 == 0) {
			hlist = tourService.selectScheList(1);
			mlist = tourService.selectScheList(2);
			slist = tourService.selectScheList(3);
			tlist = tourService.selectScheList(4);
		}else {
			cmap.put("addr1_seq", addr1_seq1);
			cmap.put("cate_seq", 1);
			
			hlist = tourService.selectAddrForm(cmap);
			
			cmap.replace("cate_seq", 2);
			mlist = tourService.selectAddrForm(cmap);
			
			cmap.replace("cate_seq", 3);
			slist = tourService.selectAddrForm(cmap);
			
			cmap.replace("cate_seq", 4);
			tlist = tourService.selectAddrForm(cmap);

			
		}

		
		model.addAttribute("addr1_seq1", addr1_seq1);
		model.addAttribute("hlist", hlist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("slist", slist);
		model.addAttribute("tlist", tlist);
		model.addAttribute("clist", clist);
		model.addAttribute("scheInfo", scheInfo);
		model.addAttribute("s_seq", s_seq);
		return ViewPath.SCHEDULE + "sche/scheHome.jsp";
	}
	
	@RequestMapping("/schedule/sche/chooseSche")
	public String chooseSche(HttpServletRequest request, Model model, @RequestParam("f_seq") int f_seq) {
		
		System.out.println(f_seq);
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		List<Map<String, Object>> list = scheService.mScheList(m_seq);
		
		model.addAttribute("list", list);
		model.addAttribute("f_seq", f_seq);
		
		return ViewPath.SCHEDULE + "sche/chooseSche.jsp";
		
	}
	
	@RequestMapping("/schedule/sche/addHotPlan")
	public String addHotPlan(int s_seq, int day_no, int f_seq, Model model) {
		
		System.out.println("s_seq : " + s_seq);
		System.out.println("day_no : " + day_no);
		System.out.println("f_seq : " + f_seq);
		PlanVO vo = new PlanVO();
		vo.setS_seq(s_seq);
		vo.setDay_no(day_no);

		
		int num = scheService.planLastNum(vo) +1 ;
		String msg = "세부일정 추가 오류, , 계속해서 오류가 뜨면 문의해주세요";

		vo = new PlanVO(s_seq, day_no, num, f_seq, "", "");
		

		if(scheService.newPlan(vo)) {
			msg = "선택하신 일정에 추가가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		
		return ViewPath.SCHEDULE + "sche/close.jsp";
	}
	
	@RequestMapping("/schedule/sche/edit/reCity")
	public String reCity(int s_seq, Model model) {
		
		List<Addr1VO> alist = addrService.addr1List();
		
		List<Map<String, Object>> clist = scheService.selectCity(s_seq);
		String addr = "";
		
		for(Map<String, Object> map : clist) {
			addr += map.get("addr1_seq")+"/";
		}

		
		model.addAttribute("addr", addr);
		model.addAttribute("alist", alist);
		return ViewPath.SCHEDULE +"sche/edit/reCity.jsp";
	}
	
	
	@RequestMapping(value="/schedule/sche/edit/editTitle", produces="application/text;charset=utf8")
	@ResponseBody
	public String editTitle(@RequestParam("s_title") String title, @RequestParam("s_seq") int s_seq ) {
		System.out.println(title + "/"+s_seq);
		
		ScheVO vo = new ScheVO();
		vo.setS_seq(s_seq);
		vo.setTitle(title);
		if(scheService.reTitle(vo)) {
			return "성공";
		}else {
			return "실패";			
		}	
	}
	
	@RequestMapping("/schedule/sche/edit/reDate")
	public String reDate(int s_seq, Model model) {
		
		
		return ViewPath.SCHEDULE +"sche/edit/reDate.jsp";
	}
	
	//2023-08-15
	@RequestMapping("/schedule/sche/edit/exitSche")
	public String exitSche(int s_seq, Model model, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		String msg = "";
		String url = "";
	
		String partnerlist = "";
		String pArr = scheService.selectPartner(s_seq);
		if(pArr.contains(",")) {
			//함께하는 여행
			String[] partnerArr = pArr.split(",");

			List<String> plist = new ArrayList<String>(Arrays.asList(partnerArr));
			int su = 0;
			for(String p : plist) {//파트너 리스트
				int a =	Integer.parseInt(p);
				if(a != m_seq) { //
					if(su !=0) {
						partnerlist += (","+ p);						
					}else {
						partnerlist += p;
					}
				}
				su++;
			}
			ScheVO svo = new ScheVO();
			svo.setS_seq(s_seq);
			svo.setPartnerlist(partnerlist);
			if(scheService.rePartner(svo)) {
				//파트너 리스트 수정 성공
				InviteVO ivo = new InviteVO();
				ivo.setS_seq(s_seq);
				ivo.setReceiver_seq(m_seq);
				if(scheService.delInvite(ivo)) {
					//invite 테이블 수정 성공
					msg = "또 다른 여행을 떠나보세요";
					url = "/trippin/schedule/sche/scheList";
				}else {
					//invite 테이블 수정 실패
					msg = "오류";
					url = "/trippin/";
					svo.setPartnerlist(pArr);
					scheService.rePartner(svo);
				}
			}else {
				//파트너 리스트 수정 실패
				msg = "오류";
				url = "/trippin/";
			}
		}else {
			//혼자여행 schedule 테이블 삭제
			if(scheService.delSche(s_seq)) {
				msg = "일정 삭제 성공";
				url = "/trippin/schedule/sche/scheList";				
			}else {
				msg = "오류";
				url = "/trippin/";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return ViewPath.SCHEDULE +"result.jsp";
	}
	
	@RequestMapping("/schedule/plan/planHome")
	public String planHome(int s_seq, int day_no, Model model) {
		
		int day_num = 0;
		
		if(day_no ==-1) {
			day_num = 1;
		}else {
			day_num = day_no;
		}
		
		PlanVO vo = new PlanVO();
		vo.setS_seq(s_seq);
		vo.setDay_no(day_no);
		
		Map<String, Object> info = scheService.scheInfo(s_seq);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("s_seq", s_seq);
		map.put("day_no", day_num);
		
		info.put("day_no", day_num);
		
		List<Map<String, Object>> bplist = scheService.schePlanList(map);
		List<Map<String, Object>> plist = new ArrayList<Map<String,Object>>();
		
		String name = "";
		String wi = "";
		String kyung = "";
		
		int planCnt = scheService.planCnt(s_seq);
		
		
		for(Map<String, Object> amap : bplist) {
				name += (amap.get("NAME")+"/");
				wi += (amap.get("WI")+"/");
				kyung += (amap.get("KYUNG")+"/");				
			
			String kind = "";
			String ad2N ="";
			String url = "";
			int mct = Integer.parseInt(String.valueOf(amap.get("CATE_SEQ")));
			int ks = Integer.parseInt(String.valueOf(amap.get("KIND")));
			switch(mct) {		
			case 1://관광지
				url = "tour/selectTour?f_seq="+amap.get("F_SEQ");
				kind = scheService.tourCate(ks);
				break;
			case 2://맛집
				url = "hotple/selectHotple?f_seq="+amap.get("F_SEQ");
				kind = scheService.hotpleCate(ks);
				break;
			case 3://숙소
				url = "tour/selectTour?f_seq="+amap.get("F_SEQ");
				kind = scheService.accCate(ks);
				break;
			default:
				url = "";
				kind = "메모";	
			}	
			amap.put("url", url);
			amap.replace("KIND", kind);
			
			int a2 = Integer.parseInt(String.valueOf(amap.get("ADDR2_SEQ")));
			if(a2 == 0) {
				ad2N = ""; 
			}else {
				ad2N= addrService.addr2Name(a2);
								
			}
			amap.replace("ADDR2_SEQ", ad2N);
			plist.add(amap);
		}
		
		model.addAttribute("planCnt", planCnt);
		model.addAttribute("name", name);
		model.addAttribute("wi", wi);
		model.addAttribute("kyung", kyung);
		model.addAttribute("plist", plist);
		model.addAttribute("info", info);
		
		return ViewPath.SCHEDULE +"plan/planHome.jsp";
	}

	
	//addPs
	@RequestMapping("/schedule/plan/addForm")
	public String addForm(int plan_seq, Model model, boolean check) {
		System.out.println(check);
		//시간 추가 false;
		//메모 추가 true;
		String msg = "";
		if(check) {
			msg = "메모 추가";
		}else {
			msg = "시간 추가";
		}
		
		PlanVO vo = scheService.planMT(plan_seq);
		model.addAttribute("vo", vo);
		model.addAttribute("msg", msg);
		model.addAttribute("check", check);
		
		return ViewPath.SCHEDULE +"plan/addForm.jsp";
	}

	@RequestMapping("/schedule/plan/add")
	public String insertForm(boolean check, String data, int plan_seq, Model model) {
		String msg ="";
		PlanVO vo = new PlanVO();
		vo.setPlan_seq(plan_seq);
		
		if(check) {
			//메모
			vo.setMemo(data);
			if(scheService.updateMemo(vo)) {
				msg = "메모 입력 성공";
			}else {
				msg = "메모 입력 오류 ,,, 계속 오류가 나면 문의해주세요";
			}
		}else {
			//시간		
			vo.setTime(data);
			if(scheService.updateTime(vo)) {
				msg = "시간 입력 성공";
			}else {
				msg = "시간 입력 오류 ,,, 계속 오류가 나면 문의해주세요";
			}
		}
		model.addAttribute("msg", msg);

		return ViewPath.SCHEDULE+"sche/close.jsp";
	}
	
	@RequestMapping("/schedule/plan/res")
	public String resForm(boolean check, String data, int plan_seq, Model model) {
		String msg ="";
		PlanVO vo = new PlanVO();
		vo.setPlan_seq(plan_seq);
		
		if(check) {
			//메모
			vo.setMemo("");
			if(scheService.updateMemo(vo)) {
				msg = "메모 삭제 성공";
			}else {
				msg = "메모 삭제 오류 ,,, 계속 오류가 나면 문의해주세요";
			}
		}else {
			//시간		
			vo.setTime("");
			if(scheService.updateTime(vo)) {
				msg = "시간 삭제 성공";
			}else {
				msg = "시간 삭제 오류 ,,, 계속 오류가 나면 문의해주세요";
			}
		}
		model.addAttribute("msg", msg);
		
		return ViewPath.SCHEDULE+"sche/close.jsp";
	}

	@RequestMapping(value="/schedule/plan/del", produces="application/text;charset=utf8")
	@ResponseBody
	public String delPlan(@RequestParam("plan_seq")int plan_seq) {
			
		if(scheService.delPlan(plan_seq)) {
			return "일정 삭제 성공";
		}else {
			return "일정 삭제 오류";
		}
		
 	}
	
	
	

	@RequestMapping("/schedule/search/rec")
	public String formList(@RequestParam("day_no") int day_no, @RequestParam("s_seq") int s_seq,@RequestParam("addr1_seq")  int addr1_seq, 
			@RequestParam("cate_seq") int cate_seq, Model model) {
		
		System.out.println(s_seq);
		System.out.println(addr1_seq);
		
		List<Map<String, Object>> flist = new ArrayList<Map<String,Object>>();
		
		if(addr1_seq <0) { // 기본 상태 or 도시 선택에서 전체를 선택했을 때
			int adrs = 0;
			//일정에 포함된 도시 for 문
			List<Map<String, Object>> clist = scheService.selectCity(s_seq);
			if(clist.size()!= 1) {
				//일정에 도시가 2개 이상 일 때
				for(Map<String, Object> cmap : clist) {
					List<Map<String, Object>> eelist = new ArrayList<Map<String,Object>>();
					int as = Integer.parseInt(String.valueOf(cmap.get("ADDR1_SEQ")));
					if(as == 0) {
						//일정에 포함된 도시 중 국내가 있을 때 
						if(cate_seq == -1) {
							//모든 카테고리
							flist = scheService.afList();
						}else {
							//선택 카테고리
							flist = tourService.selectScheList(cate_seq); 
						}
						break;
					}else {
						adrs = as;
					}
					if(cate_seq == -1) {
						//일정에 포함된 도시 전체 / 모든 카테고리 
						eelist = scheService.selectAllScheList(adrs);				
					}else {
						//일정에 포함된 도시 전체 / 선택 카테고리
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("cate_seq", cate_seq);
						map.put("addr1_seq", adrs);
						eelist = tourService.selectAddrForm(map);
					}
					flist.addAll(eelist);
				}				
				
			}else {
				//일정에 도시가 1개일 때
				int sss = Integer.parseInt(String.valueOf(clist.get(0).get("ADDR1_SEQ")));
				if(cate_seq == -1) {
					flist = scheService.selectAllScheList(sss);						
				}else{
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("cate_seq", cate_seq);
					map.put("addr1_seq", sss);
					flist = tourService.selectAddrForm(map);	
				}
			}
		}else if(addr1_seq >0) {//도시 선택에서 전체, 국내를 제외한 도시를 선택 했을 때
			if(cate_seq == -1) {
				//선택 도시 / 모든 카테고리 
				flist = scheService.selectAllScheList(addr1_seq);				
			}else {
				//선택도시 / 선택 카테고리
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cate_seq", cate_seq);
				map.put("addr1_seq", addr1_seq);
				flist = tourService.selectAddrForm(map);	
			}
		}else { // 도시 선택에서 국내를 선택 했을 때
			if(cate_seq == -1) {
				//모든 도시 / 모든 카테고리
				flist = scheService.afList();
			}else {
				//모든 도시 / 선택 카테고리
				flist = tourService.selectScheList(cate_seq); 
			}
		}
		
//		if(!flist.isEmpty()) {
//			for(int i = 0; i < flist.size(); i++) {
//				String path = FILEPATH + flist.get(i).get("MAIN_IMG");
//				File f = new File(path);
//				String[] files = f.list();
//				flist.get(i).put("FILE", files[0]);
//			}
//		}
		
		List<Map<String, Object>> clist = scheService.selectCity(s_seq);
		List<CateVO> ctlist = scheService.cateList();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("flist", flist);
		map.put("clist", clist);
		map.put("ctlist", ctlist);
		map.put("day_no", day_no);
		map.put("s_seq", s_seq);
		map.put("addr1_seq", addr1_seq);
		map.put("cate_seq", cate_seq);
		

		model.addAttribute("map", map);
		return ViewPath.SCHEDULE +"search/rec.jsp";
	}
	
	@RequestMapping("/schedule/plan/addFormList")
	public String addFormList(int day_no, int s_seq,@RequestParam(value = "fArr", required = false) String fArr, Model model) {
		
		List<Integer> flist = new ArrayList<Integer>();
		 JSONParser parser = new JSONParser();
		 
		 try {
			JSONArray jsonArray = (JSONArray) parser.parse(fArr);
			
			for(Object obj : jsonArray) {
				int number = Integer.parseInt(obj.toString());
				flist.add(number);
	
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		 String msg = "";
		 
		 PlanVO vo = new PlanVO();
		 vo.setS_seq(s_seq);
		 vo.setDay_no(day_no);
		 
		 for(int i : flist) { // 일정 리스트
			 int num = scheService.planLastNum(vo)+1;
			 vo.setF_seq(i);
			 vo.setNum(num);
			 vo.setMemo("");
			 vo.setTime("");
			 if(scheService.newPlan(vo)) {
				 msg = "선택하신 일정에 장소를 추가 했습니다";
			 }else {
				 msg = "일정 추가 오류 , , , 계속 오류가 생기면 문의해주세요";
			 }
			 
		 }
		
		model.addAttribute("msg", msg);
		
		
		return ViewPath.SCHEDULE  +"sche/close.jsp";	
	}
	
	@RequestMapping("schedule/plan/dayMemo")
	public String dayMemo(@RequestParam("s_seq")int s_seq, @RequestParam("day_no")int day_no, Model model) {
		
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("day_no", day_no);
		
		return ViewPath.SCHEDULE+"plan/dayMemo.jsp";
		
	}
	
	@RequestMapping("/schedule/plan/addDMemo")
	public String dayMemo(int s_seq, int day_no, String memo, Model model) {
		PlanVO vo = new PlanVO();
		
		vo.setS_seq(s_seq);
		vo.setDay_no(day_no);
		vo.setMemo(memo);
		int num = scheService.planLastNum(vo)+1;
		vo.setNum(num);
		vo.setTime("");
		
		String msg = "메모 추가 오류, , ,";
		
		if(scheService.newMemo(vo)) {
			msg = "메모 추가 완료";
		}
		
		model.addAttribute("msg", msg);
		
		return ViewPath.SCHEDULE+"sche/close.jsp";
		
	}
	
	
	@RequestMapping("schedule/sche/partner/partnerList")
	public String ptList(Model model, int s_seq, HttpServletRequest request) throws Exception {
		
		Integer ms = (Integer) request.getSession().getAttribute("login");
		int sender_seq = -1;
		if(ms != null) {
			sender_seq = ms;
		}
		
		String url = "http://localhost:8080/trippin/schedule/sche/partner/inviteM?s_seq="+s_seq+"&&sender_seq="+sender_seq;
		
		String p = scheService.selectPartner(s_seq);
		
		List<MemberVO> mlist = new ArrayList<MemberVO>();
		
		if(p.contains(",")) {
			String[] partner = p.split(",");
			int[] m= Stream.of(partner).mapToInt(Integer::parseInt).toArray();
			for(int m_seq : m) {
				MemberVO vo = scheService.mInfo(m_seq);
				mlist.add(vo);
			}
		}else {
			int m_seq = Integer.parseInt(p);
			MemberVO vo = scheService.mInfo(m_seq);
			mlist.add(vo);
		}
		
				
		model.addAttribute("mlist", mlist);
		model.addAttribute("url", url);
		model.addAttribute("s_seq", s_seq);
		
		return ViewPath.SCHEDULE + "sche/partner/partnerList.jsp";
		
	}
	

	
	@RequestMapping("/schedule/sche/partner/inviteM")
	public String inviteForm(Model model, @RequestParam("s_seq")int s_seq, @RequestParam("sender_seq")int sender_seq) {
		
		Map<String, Object> sInfo = scheService.scheInfo(s_seq);
		
		model.addAttribute("sender_seq", sender_seq);
		model.addAttribute("sInfo", sInfo);
		
		return ViewPath.SCHEDULE + "sche/partner/inviteForm.jsp";
	}
	
	
	
	@RequestMapping("/schedule/sche/partner/addMPlan")
	public String inviteM(Model model, int s_seq, int sender_seq, HttpServletRequest request) {
		
		int m_seq = -1;
		String msg = "";
		String url ="";
			
		if(request.getSession().getAttribute("login") != null) {
			m_seq = (int) request.getSession().getAttribute("login");	
		}
		
		
		if(m_seq == -1 ) {
			msg = "로그인 후 다시 초대링크로 접속해주세요";
			url = "/trippin/login/loginForm";
		}else {
			//일정 파트너 리스트 컬럼
			//invite table . . .
			boolean stCk = true;
			List<Integer> recList = scheService.IvInfo(s_seq);
			for(int i : recList) {
				if(i == m_seq) {
					url = "/trippin/";
					msg = "이미 참여하신 일정 입니다.";
					stCk = false;
					break;
				}
			}
			if(stCk) {
				String plist  = scheService.selectPartner(s_seq);
				String partnerlist = plist+(","+m_seq);
				ScheVO svo = new ScheVO();
				svo.setPartnerlist(partnerlist);
				svo.setS_seq(s_seq);
				if(scheService.rePartner(svo)) {
					//일정 partnerlist 수정 성공
					InviteVO ivo = new InviteVO();
					ivo.setReceiver_seq(m_seq);
					ivo.setSender_seq(sender_seq);
					ivo.setS_seq(s_seq);
					ivo.setStatus(2);
					if(scheService.newIv(ivo)) {
						//일정에 초대 수락 후 일정에 최종 추가 완료
						//이 코드가 실행되면 일정에 추가 성공
						
						this.newMember(ivo);	// 일정 초대 알림(희지)
						
						url = "/trippin/schedule/sche/scheHome";
						msg = "일행과 함께 즐거운 여행을 계획해보세요";
						model.addAttribute("s_seq", s_seq);
						model.addAttribute("addr1_seq1", -1);
					}else {
						url = "/trippin/";
						msg = "오류";
						System.out.println("invite 테이블 오류`");
						svo.setPartnerlist(plist);
						scheService.rePartner(svo);
					}
					
				}else {
					url = "/trippin/";
					msg = "오류";
					System.out.println("일정 partnerlist 수정 실패");
				}
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return ViewPath.SCHEDULE + "result.jsp";
	}
	
	@RequestMapping("/schedule/tool/toolHome")
	public String toolHome(int s_seq ) {
		
		
		return ViewPath.SCHEDULE + "tool/toolHome.jsp";
	}
	
	
	
	//[희지]***************************************************************************************
	// 일정 초대 시 다른 일행에게 알림 주기
	public void newMember(InviteVO ivo) {
		String[] members = scheService.selectPartner(ivo.getS_seq()).split(",");
		
		String sender = loginService.getM_nickname(ivo.getSender_seq());
		String receiver = loginService.getM_nickname(ivo.getReceiver_seq());
		String title = scheService.scheTitle(ivo.getS_seq());
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setContent(sender+"/"+receiver+"/"+title);
		nvo.setUrl_in(ivo.getS_seq()+",-1");
		nvo.setNotice_seq(5);;
		
		for(String m : members) {
			int m_seq = Integer.parseInt(m);
			if(m_seq != ivo.getReceiver_seq()) {
				nvo.setM_seq(m_seq);
				memberService.noticeInsert(nvo);
			}
		}
	}
	
	
	//[새미]************************************************************************************************************

	@RequestMapping("/schedule/checklist/insertForm")
	public String checkInsertForm(Model model, HttpServletRequest request) throws ParseException {

		int clist_cate_seq=0;
		
		
		Integer login = (Integer) request.getSession().getAttribute("login");
		
		if(login==null) {
			return ViewPath.LOGIN+"goLogin.jsp";
		}

		int s_seq = 1; // 임시로 넣는것
		
		ScheVO scvo = scheService.schSelectOne(s_seq);
		
		//여행일정 계산
		Date firstDay = scvo.getFirstday();
		Date lastDay = scvo.getLastday();
		
		long calDate = firstDay.getTime() - lastDay.getTime();	 
		
		long calDateDays = calDate /(24*60*60*1000);
		
		calDateDays = Math.abs(calDateDays);

		
		
		long days = calDateDays;
		long nights = calDateDays+1;
		

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		List<Clist_CateVO> clist = myclistService.cateList(login);
		
		Clist_MemoVO cmvoAll = new Clist_MemoVO();
		

		for (Clist_CateVO vo : clist) { // 모든 카테리스트 for문
			// 카테고리 번호
			clist_cate_seq = vo.getClist_cate_seq();
		

			// 빈 맵
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> mmap = new HashMap<String, Object>();
			Map<String, Object> cmap = new HashMap<String, Object>();
			
			cmap.put("clist_cate_seq", clist_cate_seq);
			cmap.put("m_seq", login);
			cmap.put("s_seq", s_seq);
			
			Clist_MemoVO cmvo = myclistService.ClistMemoOne(cmap);
			
			cmvoAll = myclistService.ClistMemoAllOne(cmap);
			 
			// 빈 리스트
			List<Map<String, Object>> ilist = new ArrayList<Map<String, Object>>();

		

			// 카테고리 별 아이템 리스트 ,, -- 원하는 아이템 리스트 다 불러오기 가능 ex) 상태가 추가인 리스트, 디폴트인 리스트,,
			mmap.put("m_seq", login);
			mmap.put("clist_cate_seq", clist_cate_seq);
		
			ilist = myclistService.cateItem(mmap);
			

			map.put("m_seq", login);

			// 빈 맵에 리스트 세팅
			map.put("ilist", ilist);
			map.put("vo", vo);
			map.put("cmvo", cmvo);
			
		

			// 넘길 리스트에 맵 저장
			list.add(map);
		}

		// 1.리스트 = 체크리스트 카테고리
		// 2. Map안에 리스트 =카테고리 별 아이템 리스트

		model.addAttribute("s_seq", s_seq);
		model.addAttribute("list", list);
		model.addAttribute("login", login);
		model.addAttribute("scvo", scvo);
		model.addAttribute("days", days);
		model.addAttribute("nights", nights);
		model.addAttribute("clist_cate_seq", clist_cate_seq);
		model.addAttribute("cmvoAll", cmvoAll);


		return ViewPath.SCHEDULE + "checklist/insertform.jsp";
	}



	@RequestMapping(value = "member/sche/addMemoAll")
	@ResponseBody
	public int memoAddAll(HttpServletRequest request) {
		
		int m_seq  = Integer.parseInt(request.getParameter("m_seq"));
		int clist_cate_seq  = Integer.parseInt(request.getParameter("clist_cate_seq"));
		int s_seq  = Integer.parseInt(request.getParameter("s_seq"));
		String memo = request.getParameter("memo");
		memo= memo.replaceAll("\r\n", "<br>");
		
		Clist_MemoVO cmvo= new Clist_MemoVO();

		
		int data = 0;
		int su=0;
		
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("m_seq", m_seq);
		map.put("s_seq", s_seq);
	

		Clist_MemoVO cmvoOneAll = myclistService.ClistMemoAllOne(map);

		if(cmvoOneAll == null) {
			cmvo.setClist_cate_seq(clist_cate_seq);
			cmvo.setM_seq(m_seq);
			cmvo.setS_seq(s_seq);
			cmvo.setMemo(memo);
			 su = myclistService.clistMemoAdd(cmvo);
				
				if(su!=0) {
					data=1;
					
				}else {
					data=0;
				}
			
		}else {//null이 아닐 경우 업데이트
		
			        cmvo.setMemo(memo);
			        cmvo.setClist_memo_seq(cmvoOneAll.getClist_memo_seq());
			        //System.out.println("cmvoOneAll.getClist_memo_seq()="+cmvoOneAll.getClist_memo_seq());
			        su = myclistService.clistMemoUpdate(cmvo);
	
			if(su!=0) {
				data=1;
				
			}else {
				data=0;
			}
		}
		return data;
	}
	
	
	
	@RequestMapping(value = "member/sche/addMemo")
	@ResponseBody
	public int memoAdd(HttpServletRequest request) {
		
		int m_seq  = Integer.parseInt(request.getParameter("m_seq"));
		int clist_cate_seq  = Integer.parseInt(request.getParameter("clist_cate_seq"));
		int s_seq  = Integer.parseInt(request.getParameter("s_seq"));
	
		String memo = request.getParameter("memo");
		//memo= memo.replaceAll("\r\n", "<br>");
		
		Clist_MemoVO cmvo= new Clist_MemoVO();

		
		int data = 0;
		int su=0;
		
		Map<String, Object> map=new HashMap<String, Object>();
	

		map.put("clist_cate_seq", clist_cate_seq);
		map.put("m_seq", m_seq);
		map.put("s_seq", s_seq);

		
		
		Clist_MemoVO cmvoOne = myclistService.ClistMemoOne(map);
		

		if(cmvoOne == null) {
			cmvo.setClist_cate_seq(clist_cate_seq);
			cmvo.setM_seq(m_seq);
			cmvo.setS_seq(s_seq);
			cmvo.setMemo(memo);
			su = myclistService.clistMemoAdd(cmvo);
				
			if(su!=0) {
				data=1;
				
			}else {
				data=0;
			}
			
		}else {//null이 아닐 경우 업데이트
		
	        cmvo.setMemo(memo);
	        cmvo.setClist_memo_seq(cmvoOne.getClist_memo_seq());
	        su = myclistService.clistMemoUpdate(cmvo);

			if(su!=0) {
				data=1;
				
			}else {
				data=0;
			}
		}
		return data;
	}
	
	
	
	@RequestMapping(value = "member/sche/MemoDelete")
	@ResponseBody
	public int memoDelete(int clist_memo_seq, Clist_MemoVO cmvo) {
		int data =0;
		
		cmvo.setClist_memo_seq(clist_memo_seq);
		int su = myclistService.clistMemoDelete(cmvo);
		if(su!=0) {
			data=1;
			
		}else {
			data=0;
		}
		return data;
	}
	
	

	@RequestMapping(value="member/sche/myclistInsert")	
	@ResponseBody
	public int myclistInsert(int m_seq,int s_seq, int clist_items_seq
			,MyclistVO mcvo,String clist_items_name){
		
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int data=0;
		
		cmap.put("m_seq", m_seq);
		cmap.put("s_seq", s_seq);
		cmap.put("clist_items_seq",clist_items_seq);
		
		int cnt =myclistService.myClistOneCnt(cmap);
		
		if(cnt==0) {
			mcvo.setClist_items_seq(clist_items_seq);
			mcvo.setS_seq(s_seq);
		
			mcvo.setM_seq(m_seq);
			data = myclistService.myclistInsert(mcvo);
			
		}else {
			int sd = myclistService.deleteMyclist(cmap);
		}
		return data;
	}
	


	
	
}
