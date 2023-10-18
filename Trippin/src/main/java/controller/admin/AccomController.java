package controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.ViewPath;
import service.admin.AccomService;
import vo.accom.Cf_subVO;
import vo.accom.Hs_subVO;
import vo.accom.ReservationVO;
import vo.common.Addr1VO;
import vo.common.FormVO;
import vo.member.MemberVO;

@Controller
public class AccomController {
	
	@Autowired
	private AccomService accomService;
	
	public AccomController(AccomService accomService) {
		this.accomService = accomService;
	}

	
	//숙소 등록
	
	@RequestMapping("/admin/accom/insertForm")
	public String insertForm(Model model){
		
		int f_seq = accomService.nowSeq();
		
		List<Addr1VO> addr1list = accomService.addr1();
		List<Hs_subVO> hssublist = accomService.hssub();
		List<Cf_subVO> cfsublist = accomService.cfsub();
		
		model.addAttribute("f_seq", f_seq);
		model.addAttribute("cfsublist", cfsublist);
		model.addAttribute("hssublist", hssublist);
		model.addAttribute("addr1list", addr1list);
		return ViewPath.ADACCOM + "insertAccom.jsp";
	}

	
	@RequestMapping("/admin/accom/insert")
	public String insertAccom(Model model, FormVO fvo, HttpServletRequest request) {
		int f_seq = accomService.nowSeq();
		
		fvo.setF_seq(f_seq);
		fvo.setCate_seq(fvo.getCate_seq());
		fvo.setKind(fvo.getKind());
		fvo.setName(fvo.getName());
		fvo.setIntro(fvo.getIntro());
		fvo.setAddr2_seq(fvo.getAddr2_seq());
		fvo.setAddr(fvo.getAddr());
		fvo.setAddr_detail(fvo.getAddr_detail());
		fvo.setWi(fvo.getWi());
		fvo.setKyung(fvo.getKyung());
		fvo.setWay(fvo.getWay().replaceAll("\r\n", "<br>"));
		fvo.setTel(fvo.getTel().replaceAll("-", ""));
		fvo.setWebsite(fvo.getWebsite());
		
		
		int su = accomService.insert(fvo);
		
		String url = "";
		String msg = "숙소 등록";
		System.out.println(url);
		System.out.println(msg);
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		model.addAttribute("su", su);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	//예약자 등록 insert
	@RequestMapping("/member/accom/insert")
	public String rvinsert(Model model, ReservationVO rvo, HttpServletRequest request) {
		/*
		 * int reservation_seq = accomService.rvSeq();
		 * 
		 * rvo.setReservation_seq(reservation_seq);
		 */
		
		int su = accomService.insert(rvo);
		
		
		String url = "";
		String msg = "숙소 예약";
		System.out.println(url);
		System.out.println(msg);
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		model.addAttribute("su", su);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	//펜션 리스트
	
	@RequestMapping("/admin/member/accom/pensionList")
	public String selectList( Model model) {
		
		List<Map<String, Object>> alist = accomService.selectAlist();
		
		model.addAttribute("alist", alist);
		return ViewPath.ACCOM + "pensionList.jsp";
	}
	
	//펜션 선택시
	
	@RequestMapping("/admin/member/accom/selectPen")
	
		public String selectPen(Model model, @RequestParam("f_seq") int f_seq) {

		Map<String, Object> pen = accomService.selectPen(f_seq);
		List<Map<String, Object>> room = accomService.selectRoom(f_seq);
		List<Map<String, Object>> info = accomService.infoRoom(f_seq);
		List<Map<String, Object>> pol = accomService.policy(f_seq);
		
		String hs = (String) pen.get("HS_SUB_SEQ");

		List<Map<String, Object>> hslist = new ArrayList<Map<String, Object>>();
	
		if (hs != null) {
		    String[] hss = hs.split(",");
		    for (String hsStr : hss) {
		        int hs_sub_seq = Integer.parseInt(hsStr);
		        List<Map<String, Object>> hsDataList = accomService.hs(hs_sub_seq);

		        for (Map<String, Object> hsData : hsDataList) {
		            hslist.add(hsData);
		        }
		    }
		} else {
		    hslist.add(null);
		}
		
		String cf = (String) pen.get("CF_SUB_SEQ");
		List<Map<String, Object>> cflist = new ArrayList<Map<String, Object>>();
		
		if (cf != null) {
		    String[] cfs = cf.split(",");
		    for (String cfStr : cfs) {
		        int cf_sub_seq = Integer.parseInt(cfStr);
		        List<Map<String, Object>> cfDataList = accomService.cf(cf_sub_seq);

		        for (Map<String, Object> cfData : cfDataList) {
		        	cflist.add(cfData);
		        }
		    }
		} else {
			cflist.add(null);
		}
		
//		Map<String, Object> Data = new HashMap<>();
//		Data.put("a", "에이");
//		Data.put("b", 3);
		
//		model.addAttribute("Data", Data);
		model.addAttribute("cflist", cflist);
		model.addAttribute("hslist", hslist);
		model.addAttribute("pol", pol);
		model.addAttribute("info", info);
		model.addAttribute("room", room);
		model.addAttribute("pen", pen);
		return ViewPath.ACCOM + "selectPen.jsp";
		}
	
	//숙소 공통 세부 객실
	@RequestMapping("/admin/member/accom/detailRoom")
	public String detailRoom(Model model, @RequestParam("room_seq") int room_seq,
            /*@RequestParam(value = "selectedButtons", required = false)*/ String selectedButtons,
            /*@RequestParam(value = "totalCount", required = false)*/ String totalCount,
            /*@RequestParam(value = "result", required = false)*/ String result,
            /*@RequestParam(value = "startDate", startDate = false)*/ String startDate,
            /*@RequestParam(value = "startDate", startDate = false)*/ String endDate, 
            /*@RequestParam(value = "startDate", startDate = false)*/ String duration) {
			//method를 post로 전송

		
	Map<String, Object> det = accomService.detailRoom(room_seq);
	String bene = (String) det.get("ROOM_BENEFIT_SEQ");
	List<String> blist = new ArrayList<String>();
	
	//로그인 확인

	
	//객실 혜택 Split
	if(bene!=null) {
		String item ;
		if(!bene.contains(",")) {
			int rbssd = Integer.parseInt(bene);
			item = accomService.benefit(rbssd);
			blist.add(item);
		}else {
			String [] rbs = bene.split(",");
			int [] rbss = Stream.of(rbs).mapToInt(Integer::parseInt).toArray();
			for(int room_benefit_seq : rbss) {
				item = accomService.benefit(room_benefit_seq);
				blist.add(item);
			}
		}			
	}else {
		blist.add("");
	}
	

	
	model.addAttribute("startDate", startDate);
	model.addAttribute("endDate", endDate);
	model.addAttribute("duration", duration);
    model.addAttribute("selectedButtons", selectedButtons);
    model.addAttribute("totalCount", totalCount);
    model.addAttribute("result", result);
	
	model.addAttribute("blist",blist);
	model.addAttribute("det",det);
	return ViewPath.ACCOM + "detailRoom.jsp";
}
	
	//예약하기
	@RequestMapping("admin/member/accom/rvRoom")
	
	public String rvRoom(Model model, HttpSession session,
		@RequestParam("room_seq") int room_seq, 
		/*@RequestParam(value = "selectedButtons", required = false)*/ String selectedButtons,
		/*@RequestParam(value = "totalCount", required = false)*/ String totalCount,
        /*@RequestParam(value = "result", required = false)*/ String result,
        /*@RequestParam(value = "startDate", startDate = false)*/ String startDate,
        /*@RequestParam(value = "startDate", startDate = false)*/ String endDate, 
        /*@RequestParam(value = "startDate", startDate = false)*/ String duration) {
		Map<String, Object> rvlist = accomService.rvRoom(room_seq);
		
		
		Integer m_seq = (Integer) session.getAttribute("login");
		if(m_seq == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}
		
		MemberVO rvmember = accomService.rvMember(m_seq);
		

		model.addAttribute("m_seq",m_seq);
		model.addAttribute("rvmember", rvmember);
		model.addAttribute("rvlist", rvlist);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("duration", duration);
	    model.addAttribute("selectedButtons", selectedButtons);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("result", result);
		return ViewPath.ACCOM + "rvRoom.jsp";
	}
	
	//모텔 리스트
	
	@RequestMapping("admin/member/accom/motelList")
	
		public String selectMlist(Model model) {
		
		List<Map<String, Object>> mlist = accomService.selectMlist();
		
		model.addAttribute("mlist", mlist);
		return ViewPath.ACCOM + "motelList.jsp";
	}
	
	//모텔 선택시
	
	@RequestMapping("admin/member/accom/selectMot")
	
		public String selectMot(Model model, @RequestParam("f_seq") int f_seq) {
		
		Map<String, Object> mot = accomService.selectMot(f_seq);
		List<Map<String, Object>> room = accomService.selectRoom(f_seq);
		
		String hs = (String) mot.get("HS_SUB_SEQ");

		List<Map<String, Object>> hslist = new ArrayList<Map<String, Object>>();
	
		if (hs != null) {
		    String[] hss = hs.split(",");
		    for (String hsStr : hss) {
		        int hs_sub_seq = Integer.parseInt(hsStr);
		        List<Map<String, Object>> hsDataList = accomService.hs(hs_sub_seq);

		        for (Map<String, Object> hsData : hsDataList) {
		            hslist.add(hsData);
		        }
		    }
		} else {
		    hslist.add(null);
		}
		
		String cf = (String) mot.get("CF_SUB_SEQ");
		List<Map<String, Object>> cflist = new ArrayList<Map<String, Object>>();
		
		if (cf != null) {
		    String[] cfs = cf.split(",");
		    for (String cfStr : cfs) {
		        int cf_sub_seq = Integer.parseInt(cfStr);
		        List<Map<String, Object>> cfDataList = accomService.cf(cf_sub_seq);

		        for (Map<String, Object> cfData : cfDataList) {
		        	cflist.add(cfData);
		        }
		    }
		} else {
			cflist.add(null);
		}
		
		model.addAttribute("hslist", hslist);
		model.addAttribute("cflist", cflist);
		model.addAttribute("room", room);
		model.addAttribute("mot", mot);
		return ViewPath.ACCOM + "selectMot.jsp";
	}
	//카테고리는 split , 가공해서 
}
