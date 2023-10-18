package controller.admin;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import common.Paging;
import common.ViewPath;
import service.admin.AdminService;
import service.login.LoginService;
import service.member.CsService;
import service.member.MemberService;
import service.member.PurchaseService;
import vo.accom.A_CateVO;
import vo.admin.CouponVO;
import vo.admin.L_CouponVO;
import vo.common.Addr1VO;
import vo.common.CancelVO;
import vo.common.F_TipsVO;
import vo.common.RefundVO;
import vo.common.ReviewVO;
import vo.common.Review_CmtVO;
import vo.common.TipsVO;
import vo.member.CSVO;
import vo.member.CS_CateVO;
import vo.member.CS_SubCateVO;
import vo.member.CouponlistVO;
import vo.member.InquiryVO;
import vo.member.Level_PointVO;
import vo.member.M_ReportVO;
import vo.member.M_Report_CateVO;
import vo.member.MemberVO;
import vo.member.MycashVO;
import vo.member.NewplaceVO;
import vo.member.ReportVO;
import vo.member.Report_CateVO;
import vo.member.RevisionVO;
import vo.member.Revision_CateVO;
import vo.member.S_ReportVO;
import vo.slog.SlogVO;
import vo.slog.Slog_CmtVO;
import vo.ticket.T_AmountVO;
import vo.ticket.T_PurchaseVO;

@Controller
public class AdminController {
	
	private AdminService adminService;
	private MemberService memberService;
	private CsService csService;
	private PurchaseService purchaseService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	public AdminController(AdminService adminService,
							MemberService memberService,
							CsService csService,
							PurchaseService purchaseService
							) {
		this.adminService = adminService;
		this.memberService = memberService;
		this.csService = csService;
		this.purchaseService = purchaseService;
	}
	
	
	//[희지]************************************************************************
	// 관리자용 맛집 리스트(공통)
	@RequestMapping("/admin/list")
	public String adminList(Model model, Integer page, Integer cate) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(page == null) {
			page = 1;
		}
		int cnt = adminService.count(cate);
		Paging paging = new Paging(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		map.put("cate_seq", cate);
		
		List<Map<String, Object>> list = adminService.adminList(map);
		if(list.isEmpty()) list = null;

		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("url", "/admin/list?cate="+cate);
		
		return ViewPath.ADMIN + "list.jsp";
	}
	
	// 쿠폰 리스트
	@RequestMapping("/admin/benefit/couponList")
	public String couponList(Model model, Integer page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(page == null) {
			page = 1;
		}
		
		int cnt = adminService.totCount();
		Paging paging = new Paging(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<CouponVO> clist = adminService.couponSelect(map);
		if(clist.isEmpty()) clist = null;
		
		model.addAttribute("url","/admin/benefit/couponList");
		model.addAttribute("paging", paging);
		model.addAttribute("clist", clist);
		return ViewPath.ADBENEFIT + "coupon.jsp";
	}
	
	// 쿠폰 필터 검색
	@RequestMapping("/admin/benefit/searchCoupon")
	public String searchCoupon(String what, String use, String status, String key, Model model, Integer page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!what.isEmpty()) map.put("what", what);
		if(!use.isEmpty()) map.put("use", use);
		if(!status.isEmpty()) map.put("status", status);
		if(key!=null) map.put("key", key);
		
		if(page == null) {
			page = 1;
		}
		
		int cnt = adminService.someCount(map);
		Paging paging = new Paging(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<CouponVO> clist = adminService.couponSelect(map);
		if(clist.isEmpty()) clist = null;
		
		model.addAttribute("what", what);
		model.addAttribute("use", use);
		model.addAttribute("status", status);
		model.addAttribute("key", key);
		model.addAttribute("url","/admin/benefit/searchCoupon");
		model.addAttribute("paging", paging);
		model.addAttribute("clist", clist);
		
		return ViewPath.ADBENEFIT + "coupon.jsp";
	}
	
	// 기본 쿠폰 등록 폼
	@RequestMapping("/admin/benefit/couponIn")
	public String couponIn(Model model) {
		List<Addr1VO> addr1 = adminService.addr1();
		List<A_CateVO> a_cate = adminService.a_cate();
		
		model.addAttribute("addr1", addr1);
		model.addAttribute("a_cate", a_cate);
		
		return ViewPath.ADBENEFIT + "couponIn.jsp";
	}
	
	// 기본 쿠폰 등록
	@RequestMapping("/admin/benefit/cInsert")
	public String couponInsert(CouponVO vo, Model model) {
		if(vo.getKind()==0) vo.setName("[웰컴기프트]"+vo.getName());
		if(vo.getKind()==1) vo.setName("["+vo.getValid_date()+"월 혜택]"+vo.getName());
		if(vo.getKind()==2) vo.setName("[특별 쿠폰]"+vo.getName());
		
		int su = adminService.couponInsert(vo);
		String msg = "쿠폰 등록";
		String url = "/admin/benefit/couponList";
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return ViewPath.ADBENEFIT + "result.jsp";
	}
	
	// 레벨 쿠폰 등록 폼
	@RequestMapping("/admin/benefit/lcouponIn")
	public String lcouponIn(Model model) {
		List<Level_PointVO> level = adminService.level_point();
		model.addAttribute("level", level);
		return ViewPath.ADBENEFIT + "lcouponIn.jsp";
	}
	
	// 레벨 쿠폰 등록
	@RequestMapping("/admin/benefit/lcInsert")
	public String lcInsert(L_CouponVO vo, Model model) {
		vo.setName("[레벨"+vo.getLevel_no()+"]"+vo.getName());
		
		int su = adminService.lCouponInsert(vo);
		String msg = "등급 쿠폰 등록";
		String url = "/admin/benefit/couponList";
		
		model.addAttribute("su", su);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return ViewPath.ADBENEFIT + "result.jsp";
	}
	
	// 쿠폰 다중 상태 변경
	@RequestMapping("/admin/benefit/couponStatus")
	@ResponseBody
	public String updateCouponStatus(@RequestBody Map<String, Object> requestData) {
	    List<String> selected = (List<String>) requestData.get("list");
	    int num = (int) requestData.get("num");
	    
	    int su = 0;
	    String success = "false";
	    
	    for(String str : selected) {
	    	String last = str.substring(str.length()-1);
	    	Integer seq = Integer.parseInt(str.substring(0, str.length()-1));
	    	
	    	if(last.equals("0")) {
	    		if(num == 0) {
	    			su = adminService.couponRe(seq);
	    		}else if(num == 1){
	    			su = adminService.couponStop(seq);
	    		}else {
	    			su = adminService.couponEnd(seq);
	    		}
	    	}else {
	    		if(num == 0) {
	    			su = adminService.lc_re(seq);
	    		}else if(num == 1){
	    			su = adminService.lc_stop(seq);
	    		}else {
	    			su = adminService.lc_end(seq);
	    		}
	    	}
	    }
	    if(su!=0) success = "true";
	    return success;
	}
	
	// 쿠폰 개별 상태 변경
	@RequestMapping("/admin/benefit/changeStatus")
	@ResponseBody
	public String changeCouponStatus(@RequestBody Map<String, Object> requestData) {
	    int seq = (int) requestData.get("seq");
	    int num = (int) requestData.get("num");
	    int type = (int) requestData.get("type");
	    
	    int su = 0;
	    String success = "false";
	    
	    if(type==0) {
    		if(num == 0) {
    			su = adminService.couponRe(seq);
    		}else if(num == 1){
    			su = adminService.couponStop(seq);
    		}else {
    			su = adminService.couponEnd(seq);
    		}
	    }else {
    		if(num == 0) {
    			su = adminService.lc_re(seq);
    		}else if(num == 1){
    			su = adminService.lc_stop(seq);
    		}else {
    			su = adminService.lc_end(seq);
    		}
	    }
	    
	    if(su!=0) success = "true";
	    return success;
	}
	
	// 쿠폰 상세
	@RequestMapping("/admin/benefit/c_detail/{coupon_seq}")
	public String c_detail(int type,@PathVariable("coupon_seq")int coupon_seq, Model model) {
		if(type == 0) {
			CouponVO cvo = adminService.c_one(coupon_seq);
			model.addAttribute("vo", cvo);
		}else {
			L_CouponVO lcvo = adminService.lc_one(coupon_seq);
			model.addAttribute("vo", lcvo);
		}
		return ViewPath.ADBENEFIT + "c_detail.jsp";
	}
	
	//form 테이블 삭제(공통으로 쓰기)
	@RequestMapping("/admin/common/delete")
	public String checkDelete(int f_seq, Model model) {
		
		String path = adminService.path(f_seq);
		int su = adminService.deleteForm(f_seq);
		
		if(su!=0) {
			
			//사진 삭제
			path = FILEPATH + path;
			Path parent = Paths.get(path).getParent();
			
			// 지정된 경로의 모든 하위 파일과 폴더 목록을 가져오고 역순으로(가장 하위부터) 정렬
			try {
				List<Path> allPaths = Files.walk(parent).collect(Collectors.toList());
				for(int i = allPaths.size()-1; i>=0; i--) {
					Files.delete(allPaths.get(i));
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			//리뷰 사진, 폴더 삭제
			String rPath = "/Review/" + f_seq +"/";
			String savePath = FILEPATH + rPath;
			Path parent2 = Paths.get(savePath);
			
			try {
				List<Path> allPaths2 = Files.walk(parent2).collect(Collectors.toList());
				for(int i = allPaths2.size()-1; i>=0; i--) {
					Files.delete(allPaths2.get(i));
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			//리뷰, 리뷰댓글 신고 NULL처리
			adminService.updateNo(f_seq);
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", "업체 삭제");
		model.addAttribute("url", "/admin/main");
		return ViewPath.ADMIN + "result.jsp";
	}
	
	// 종료 쿠폰 재발급
	@RequestMapping("/admin/benefit/reInsert")
	public String reInsert(int seq, int type, Model model) {
		
		List<Level_PointVO> level = adminService.level_point();
		model.addAttribute("level", level);
		
		if(type == 0) {
			List<Addr1VO> addr1 = adminService.addr1();
			List<A_CateVO> a_cate = adminService.a_cate();
			model.addAttribute("addr1", addr1);
			model.addAttribute("a_cate", a_cate);
			
			CouponVO cvo = adminService.c_one(seq);
			cvo.setName(cvo.getName().replaceFirst("\\[.*?\\]", ""));
			model.addAttribute("vo", cvo);
			return ViewPath.ADBENEFIT + "couponIn.jsp";
		}else {
			L_CouponVO lcvo = adminService.lc_one(seq);
			lcvo.setName(lcvo.getName().replaceFirst("\\[.*?\\]", ""));
			model.addAttribute("vo", lcvo);
			return ViewPath.ADPURCHASE + "purchaseList.jsp";
		}
	}
	
	// 구매목록 및 취소목록(추후 숙소 합치기)
	@RequestMapping("/admin/purchase/{type}")
	public String cancelList(@PathVariable("type") String type, Integer page, Model model) {
		if(page == null) {
			page = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		int cnt = 0;
		if(type.equals("cancelList")) {
			cnt = adminService.cancelCount(map);
		}else {
			cnt = adminService.ticketCount(map);
		}
		
		Paging paging = new Paging(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		String jsp = type + ".jsp";
		if(type.equals("cancelList")) {
			list = adminService.cancelList(map);
		}else if(type.equals("ticketList")){
			list = adminService.ticketList(map);
		}
		
		if(list.isEmpty()) list = null;
		
		model.addAttribute("url", "/admin/purchase/"+type);
		model.addAttribute("list",list);
		model.addAttribute("paging", paging);
		return ViewPath.ADPURCHASE + jsp;
	}
	
	// 티켓 구매 내역 상세
	@RequestMapping("/admin/purchase/ticketOne")
	public String ticketOne(Model model, int purchase) {
		Map<String, Object> map = adminService.ticketOne(purchase);
		
		String[] amountSeq = ((String)map.get("T_AMOUNT_NO")).split(",");
		List<T_AmountVO> pickList = new ArrayList<T_AmountVO>();
		for (String seq : amountSeq) {
			pickList.add(purchaseService.pickList(Integer.parseInt(seq)));
		}
		model.addAttribute("pickList", pickList);
		
		CancelVO cvo = new CancelVO(); 
		cvo.setKind(1);
		cvo.setPurchase_no(purchase);
		
		if(Integer.parseInt(map.get("STATUS").toString()) == 3) {
			cvo = adminService.cancel(cvo);
			model.addAttribute("cvo", cvo);
			
			if(cvo.getStatus() == 1) {
				RefundVO rvo = adminService.refund(cvo.getCancel_seq());
				model.addAttribute("rvo", rvo);
			}
		}
		
		model.addAttribute("map", map);
		return ViewPath.ADPURCHASE + "ticketOne.jsp";
	}
	
	// 티켓 환불 폼
	@RequestMapping("/admin/purchase/refundForm")
	public String refundForm(int purchase, Model model, int kind) {
		Map<String, Object> map = adminService.ticketOne(purchase);
		model.addAttribute("map", map);
		
		CancelVO cvo = new CancelVO(); 
		cvo.setKind(1);
		cvo.setPurchase_no(purchase);
		cvo = adminService.cancel(cvo);
		model.addAttribute("cvo", cvo);
		
		if(map.get("COUPON_NO") != null) {
			CouponlistVO vo = new CouponlistVO();
			vo.setCoupon_no(Integer.parseInt(map.get("COUPON_NO").toString()));
			vo.setKind(Integer.parseInt(map.get("COUPON_KIND").toString()));
			vo.setM_seq(Integer.parseInt(map.get("M_SEQ").toString()));
			vo = adminService.returnCouponOk(vo);
			
			int su = 0;
			Calendar ca = Calendar.getInstance();
			Calendar ca1 = new GregorianCalendar();
			
			java.util.Date validDate = new java.util.Date(vo.getValid_date().getTime());
			ca1.setTime(validDate);
			
			if(ca.compareTo(ca1)<=0) {
				su = 1;
			}
			model.addAttribute("su", su);
			model.addAttribute("coupon", vo);
		}
		
		return ViewPath.ADPURCHASE + "refundForm.jsp";
	}
	
	// 환불 처리(추후 숙소 고려)
	@RequestMapping("/admin/purchase/refund")
	public String refund(int purchase, int kind, HttpServletRequest request) {
		String use_cash = (String)request.getParameter("cash");
		String couponlist_seq = (String)request.getParameter("couponlist_seq");
		int m_seq = Integer.parseInt(request.getParameter("m_seq"));
		int cancel_seq = Integer.parseInt(request.getParameter("cancel_seq"));
		int money = Integer.parseInt(request.getParameter("money"));
		int fee = Integer.parseInt(request.getParameter("fee"));
		String memo = (String) request.getParameter("memo").replaceAll("\r\n", "<br>");
		
		int result = 0;
		
		if(use_cash != "" && !use_cash.equals("0")) {
			MycashVO mcvo = new MycashVO();
			mcvo.setM_seq(m_seq);
			mcvo.setCash(Integer.parseInt(use_cash));
			mcvo.setSpare(Integer.parseInt(use_cash));
			mcvo.setWhat(1);
			mcvo.setKind(2);
			result = memberService.cashInsert(mcvo);
		}
		
		if(couponlist_seq != "") {
			int su = Integer.parseInt(request.getParameter("su"));
			if(su ==1) {
				result = adminService.returnCoupon(Integer.parseInt(couponlist_seq));
			}
		}
		
		RefundVO vo = new RefundVO();
		vo.setMemo(memo);
		vo.setMoney(money);
		vo.setFee(fee);
		vo.setCancel_seq(cancel_seq);
		result = adminService.refundInsert(vo);
		
		if(result!= 0) {
			result = adminService.cancelFinish(cancel_seq);
		}
		
		String url = "/admin/purchase/ticketOne?purchase="+purchase;
		if(kind == 0) {
			//숙소 결제 상세 페이지로 연결
		}
		
		request.setAttribute("su", result);
		request.setAttribute("msg", "환불 처리");
		request.setAttribute("url", url);
		return ViewPath.ADPURCHASE +  "result.jsp";
	}
	
	// 티켓 구매목록 검색
	@RequestMapping("/admin/purchase/ticketSearch")
	public String ticketSearch(String type, String word, Integer page, Model model) {
		String nword = word;
		if(type.equals("status")) {
			if(word.equals("미사용")) {
				nword = "0";
			}else if(word.equals("사용")) {
				nword = "1";
			}else if(word.equals("기간만료")) {
				nword = "2";
			}else if(word.equals("취소")) {
				nword = "3";
			}else {
				nword = "4";
			}
		}
		
		if(page == null) {
			page = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("word", nword);
		int cnt = adminService.ticketCount(map);
		
		Paging paging = new Paging(page, cnt);
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<Map<String, Object>> list = adminService.ticketList(map);
		if(list.isEmpty()) list = null;
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("url","/admin/purchase/ticketSearch");
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		
		return ViewPath.ADPURCHASE + "ticketList.jsp";
	}
	
	// 취소 목록 검색
	@RequestMapping("/admin/purchase/cancelSearch")
	public String cancelSearch(String type, String word, Integer page, Model model) {
		String nword = word;
		if(type.equals("status")) {
			if(word.equals("접수")) {
				nword = "0";
			}else if(word.equals("환불완료")) {
				nword = "1";
			}else {
				nword ="2";
			}
		}
		
		if(type.equals("kind")) {
			if(word.equals("숙소")) {
				nword = "0";
			}else if(word.equals("티켓")) {
				nword = "1";
			}else {
				nword = "2";
			}
		}
		
		if(page == null) {
			page = 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("word", nword);
		int cnt = adminService.cancelCount(map);
		
		Paging paging = new Paging(page, cnt);
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<Map<String, Object>> list = adminService.cancelList(map);
		if(list.isEmpty()) list = null;
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("url","/admin/purchase/cancelSearch");
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		
		return ViewPath.ADPURCHASE + "cancelList.jsp";
	}

	@RequestMapping("/admin/tip/insertForm")
	public String tipInsertForm(Model model) {
		List<String> tip_key = adminService.tip_key();
		model.addAttribute("tip_key", tip_key);
		return ViewPath.ADMIN + "tip.jsp";
	}
	
	@RequestMapping("/admin/tip/findTip")
	@ResponseBody
	public List<TipsVO> findTip(String tip){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tip", tip);
		
		List<TipsVO> list = adminService.findTip(map);
		if(list.isEmpty()) list = null;
		
		return list;
	}
	
	@RequestMapping("/admin/tip/addTip")
	@ResponseBody
	public int addTip(String tip) {
		int su = adminService.sameTip(tip);
		int seq = 0;
		
		if(su == 0) {
			su = adminService.addTip(tip);
			
			if(su != 0) {
				seq = adminService.maxSeq();
			}
		}
		return seq;
	}
	
	@RequestMapping("/admin/tip/insertTip")
	public String insertTip(HttpServletRequest request, int f_seq) {
		String[] tips_seqs = request.getParameterValues("tips_seq");
		String[] f_tips = request.getParameterValues("f_tip");
		
		F_TipsVO vo = new F_TipsVO();
		vo.setF_seq(f_seq);
		
		int su = 0;
		for(int i = 0; i<tips_seqs.length; i++) {
			vo.setTips_seq(Integer.parseInt(tips_seqs[i]));
			if(f_tips != null && f_tips[i] != null) {
				vo.setF_tip(f_tips[i].replaceAll("\r\n", "<br>"));
			}
			su = adminService.tipInsert(vo);
		}
		
		request.setAttribute("su", su);
		request.setAttribute("msg", "영업팁 등록");
		
		return ViewPath.MEMBER + "popResult.jsp";
	}
	
	@RequestMapping("/admin/tip/updateForm")
	public String tipUpdateForm(Model model, int f_seq) {
		List<String> tip_key = adminService.tip_key();
		List<Map<String, Object>> tlist = adminService.oneTip(f_seq);

		for(int i=0; i<tlist.size(); i++) {
			if(tlist.get(i).get("F_TIP") != null) {
				tlist.get(i).put("F_TIP", tlist.get(i).get("F_TIP").toString().replaceAll("<br>", "\r\n"));
			}
		}
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("tip_key", tip_key);
		return ViewPath.ADMIN + "updateTip.jsp";
	}
	
	@RequestMapping("/admin/tip/updateTip")
	public String tipUpdate(HttpServletRequest request, int f_seq) {
		String[] tips_seqs = request.getParameterValues("tips_seq");
		String[] f_tips = request.getParameterValues("f_tip");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_seq", f_seq);
		int su = 0;
		
		if(tips_seqs != null) {	// 선택한 게 있으면
			// 리스트로 만들기
			List<Integer> list =new ArrayList<Integer>();
			for(int i=0; i<tips_seqs.length; i++) {
				list.add(Integer.parseInt(tips_seqs[i]));
				
				F_TipsVO vo = new F_TipsVO();
				vo.setF_seq(f_seq);
				vo.setTips_seq(Integer.parseInt(tips_seqs[i]));
				
				// 기존에 있던 시퀀스는 f_tip만 변경
				if(adminService.sameTip(vo)!=0 && f_tips != null && f_tips[i] != null) {
					vo.setF_tip(f_tips[i].replaceAll("\r\n", "<br>"));
					su = adminService.updateTip(vo);
					
				}else if(adminService.sameTip(vo) == 0){	// 기존에 없던 시퀀스는 insert
					if(f_tips != null) {
						System.out.println(f_tips[i]);
					}
					if(f_tips != null && f_tips[i] != null) {
						vo.setF_tip(f_tips[i].replaceAll("\r\n", "<br>"));
					}
					
					su = adminService.tipInsert(vo);
				}
			}
			
			// 기존에 있었지만... 사라진 이용팁은 삭제
			map.put("newlist", list);
			adminService.deleteTip(map);
		}else {	// 선택한 게 없으면 전체 삭제
			su = adminService.deleteTip(map);
		}
		
		request.setAttribute("su", su);
		request.setAttribute("msg", "이용팁 수정");
		return ViewPath.MEMBER +"popResult.jsp";
	}
	
	
	//[현지]************************************************************************************
	@RequestMapping("/admin/newplace/applicationList")
	public String applicationList(Model model, Integer page, String type, String word) {
		
		if(page == null) {
			page = 1;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(type != null && type.equals("")) {
			type = null;
			word = null;
		}
		
		map.put("type", type);
		map.put("word", word);
		
		int boardCount = adminService.getTotal(map);
		
		Paging paging = new Paging(page, boardCount);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<NewplaceVO> nplist = adminService.selectNPList(map);
		
		
		model.addAttribute("nplist", nplist);
		model.addAttribute("paging", paging);
		return ViewPath.ADMIN + "newplace/applicationList.jsp";
	}
	
	
	@RequestMapping("/admin/ticketList")
	public String ticketList(Model model, Integer page) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(page == null) {
			page = 1;
		}
		int cnt = adminService.ticketCnt();
		Paging paging = new Paging(page, cnt);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());
		
		List<Map<String, Object>> ticketList = adminService.ticketList() == null ? null : adminService.ticketList();
		
		for (int i = 0; i < ticketList.size(); i++) {
			String names = "";
			int ticket_seq = Integer.parseInt(String.valueOf(ticketList.get(i).get("TICKET_SEQ")));
			List<String> tcateNames = adminService.TcateNames(ticket_seq);
			for (int j = 0; j < tcateNames.size(); j++) {
				names += tcateNames.get(j);
				if(j < tcateNames.size() - 1) {
					names += ", ";
				}
			}
			ticketList.get(i).put("tcateNames", names);
		}
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("tlist", ticketList);
		return ViewPath.ADTICKET + "list.jsp";
	}
	
	//[새미]***************************************************************************************
	@RequestMapping("/admin/member/list")
	public String memberList(Model model, Integer page, String word, String type) {

		
		if (page == null) {
			page = 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("word", word);

		int mtotal = adminService.memberTotal(map);

		Paging paging = new Paging(page, mtotal);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<MemberVO> mvlist = adminService.memberList(map);

		model.addAttribute("mvlist", mvlist);
		model.addAttribute("paging", paging);

		return ViewPath.ADMEMBER + "list.jsp";
	}

	// 새로운 장소 등록
	@RequestMapping("/admin/newplace/list")
	public String newplace(Model model) {

		return ViewPath.ADMIN + "newplace/applicationList.jsp";

	}

	// 관리자-고객센터
	@RequestMapping("/admin/cs/all")
	public String csList(Model model, String word, String type, CSVO csvo, Integer page, HttpSession session) {

		Integer admin = (Integer) session.getAttribute("admin");

		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		if (page == null) {
			page = 1;
		}

		List<CS_CateVO> csCateList = adminService.csCateAll();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);
		map.put("word", word);

		int cstotal = adminService.cgetTotal(map);

		Paging paging = new Paging(page, cstotal);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<CSVO> cstList = adminService.allTitle(map);

		int cs_seq = csvo.getCs_seq();

		model.addAttribute("cstList", cstList);
		model.addAttribute("csCateList", csCateList);
		model.addAttribute("cs_seq", cs_seq);
		model.addAttribute("paging", paging);

		return ViewPath.ADMIN + "cs/all.jsp";
	}

	@RequestMapping("/admin/cs/insertForm")
	public String csInsertForm(Model model) {
		List<CS_CateVO> csCateList = adminService.csCateAll();

		int cs_seq = adminService.getCsSeq();

		model.addAttribute("csCateList", csCateList);
		model.addAttribute("cs_seq", cs_seq);

		return ViewPath.ADMIN + "cs/insertform.jsp";

	}

	@RequestMapping("/admin/cs/optionChange")
	@ResponseBody
	public List<CS_SubCateVO> optionCs(int cs_cate_seq) {

		

		List<CS_SubCateVO> data = adminService.csSubCateOne(cs_cate_seq);
		if (data.size() == 0) {
			data = null;
		}

		return data;

	}

	@RequestMapping("/admin/cs/delete")
	public String csDelete(@RequestParam("selectedRows") List<Integer> cs_seq, Model model, HttpSession session) {

		int m_seq = (Integer) session.getAttribute("login");

		int su = 0;

		if (cs_seq != null) {
			for (Integer csSeq : cs_seq) {
				su = adminService.csDel(csSeq);

			}
		}
		model.addAttribute("msg", "글 삭제");
		model.addAttribute("url", "/admin/cs/all?m_seq=" + m_seq);
		model.addAttribute("su", su);

		return ViewPath.ADMIN + "cs/result.jsp";
	}

	@RequestMapping("/admin/cs/insert")
	public String write(HttpServletRequest request, CSVO csvo, int cs_seq) {

		// int cs_seq = adminService.getCsSeq();
		// 파일을 저장할 경로....

		String savePath = FILEPATH + "/cs/faq/" + cs_seq + "/";

//		List<MultipartFile> list = csvo.getFiles();
//
//		String filename = null;
//
//		if (list != null && list.size() != 0) {
//
//			for (MultipartFile file : list) {
//				filename = file.getOriginalFilename();
//				if (!filename.equals("")) {
//					File saveFile = new File(savePath, filename);
//
//					if (!saveFile.exists()) {
//						saveFile.mkdirs();
//					} else {
//						long time = System.currentTimeMillis();
//						filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time,
//								filename.substring(filename.lastIndexOf(".")));
//						saveFile = new File(savePath, filename);
//
//					}
//					try {
//						file.transferTo(saveFile);
//					} catch (IllegalStateException | IOException e) {
//						e.printStackTrace();
//					}
//					csvo.setCs_img(savePath);
//				}
//			}
//		} else {
//			savePath = null;
//			
//		}
		csvo.setCs_img(savePath);

		csvo.setCs_seq(cs_seq);

		String content = csvo.getContent();

		content = content.replaceAll("getImgs", "getImgLoad/" + cs_seq);

		csvo.setContent(content);

		// System.out.println(content);

		try {
			summerCopy(csvo.getFileList(), cs_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int su = adminService.csInsert(csvo);


		request.setAttribute("msg", "글작성");
		request.setAttribute("url", "/admin/cs/all");
		request.setAttribute("su", su);

		return ViewPath.ADMIN + "cs/result.jsp";
	}

	@RequestMapping("/admin/cs/update")
	public String csUpdate(int cs_seq, Model model) {

		List<CS_CateVO> csCateList = adminService.csCateAll();

		Map<String, Object> csvo = csService.getContent(cs_seq);

		List<CS_SubCateVO> cscvList = adminService.csSubCateList();

		model.addAttribute("csvo", csvo);
		model.addAttribute("csCateList", csCateList);
		model.addAttribute("cscvList", cscvList);

		return ViewPath.ADMIN + "cs/update.jsp";
	}

	@RequestMapping("/admin/cs/doUpdate")
	public String csDoupdate(Model model, int cs_seq, CSVO csvo,String content

	) {
		// System.out.println(csvo.getCs_subcate_seq());

		String savePath = FILEPATH + "/cs/faq/" + cs_seq + "/";

//		List<MultipartFile> list = csvo.getFiles();
//
//		String filename = null;
//
//		if (list != null && list.size() != 0) {
//
//			for (MultipartFile file : list) {
//				filename = file.getOriginalFilename();
//				if (!filename.equals("")) {
//					File saveFile = new File(savePath, filename);
//
//					if (!saveFile.exists()) {
//						saveFile.mkdirs();
//					} else {
//						long time = System.currentTimeMillis();
//						filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time,
//								filename.substring(filename.lastIndexOf(".")));
//						saveFile = new File(savePath, filename);
//
//					}
//					try {
//						file.transferTo(saveFile);
//					} catch (IllegalStateException | IOException e) {
//						e.printStackTrace();
//					}
//					csvo.setCs_img(savePath);
//				}
//			}
//		} else {
//			savePath = null;
			
//		}
	
	csvo.setCs_img(savePath);

		csvo.setCs_seq(cs_seq);

		content = csvo.getContent();

		content = content.replaceAll("getImgs", "getImgLoad/" + cs_seq);

		csvo.setContent(content);

		// System.out.println(content);

		try {
			summerCopy(csvo.getFileList(), cs_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int su = adminService.csUpdate(csvo);


		model.addAttribute("msg", "수정");
		model.addAttribute("url", "/admin/cs/all");
		model.addAttribute("su", su);

		return ViewPath.ADMIN + "result.jsp";
	}

	@RequestMapping(value = "/admin/download")
	public void download(String path, String file, HttpServletResponse response) throws IOException {
		File f = new File(FILEPATH + path, file);
		// System.out.println(f.exists());

		// File다운로드 설정
		response.setContentType("application/download");
		response.setContentLength((int) f.length());
		response.setHeader("Content-disposition", "attachment;filename=\"" + file + "\"");

		OutputStream os = response.getOutputStream();

		// response객체를 통해 서버로부터 파일 다운로드 OutputStream os = response.getOutputStream();
		// 파일 입력 객체 생성 FileInputStream fis = new FileInputStream(f);
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, os);
		fis.close();
		os.close();

	}

	@RequestMapping("/summer_image3")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFIle,
			@RequestParam("cs_seq") int cs_seq, HttpServletRequest request) throws IOException {

		JsonObject json = new JsonObject();

		String fileRoot = FILEPATH + "/cs/faq/copy/"; // 저장될 외부 파일 경로
		String originalFileName = multipartFIle.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(fileRoot + savedFileName);
		// System.out.println(savedFileName);

		try {
			// 파일 저장경로 - 이름 만들어주고
			// 파일 읽어주는 통로
			// 파일 저장

			InputStream fileStream = multipartFIle.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);

			// 파일을 열기위하여 common/getImg.do 호출 / 파라미터로 savedFileName 보냄.(실제 저장될 파일에 대한 값)
			json.addProperty("url", "/trippin/admin/cs/getImgs?savedFileName=" + savedFileName);
			json.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			json.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String jsonvalue = json.toString();

		return jsonvalue;

	}

	@RequestMapping(value = "/admin/cs/getImgs", method = RequestMethod.GET)
	public void getImg(@RequestParam(value = "savedFileName") String savedFileName, HttpServletResponse response)
			throws Exception {
		String filePath;
		String DIR = FILEPATH + "\\cs\\faq\\copy\\";
		filePath = DIR + savedFileName;
		getImage(filePath, response);
	}

	@RequestMapping(value = "/admin/cs/getImgLoad/{cs_seq}", method = RequestMethod.GET)
	public void getImgCopy(@RequestParam(value = "savedFileName") String savedFileName,
			@PathVariable("cs_seq") int cs_seq, HttpServletResponse response) throws Exception {
		String filePath;
		String DIR = FILEPATH + "\\cs\\faq\\" + cs_seq + "\\";
		filePath = DIR + savedFileName;
		// System.out.println(filePath);
		getImage(filePath, response);
	}

	private void getImage(String filePath, HttpServletResponse response) throws IOException {
		File file = new File(filePath);

		if (!file.isFile()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script type='text/javascript'>alert('조회된 정보가 없습니다.'); self.close();</script>");
			out.flush();
			return;
		}

		// System.out.println(file.getAbsolutePath());
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

	public Map<String, Object> summerCopy(List<String> fileList, int cs_seq) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		// 원본파일 경로

		for (int i = 0; i < fileList.size(); i++) {
			// System.out.println(fileList.get(i));
			String oriFilePath = FILEPATH + "\\cs\\faq\\copy\\" + fileList.get(i);

			// 복사될 파일 경로
			String copyFilePath = FILEPATH + "\\cs\\faq\\" + cs_seq + "\\" + fileList.get(i);
			File copy = new File(FILEPATH + "\\cs\\faq\\" + cs_seq + "\\");

			if (!copy.exists()) {
				copy.mkdir();
			}
			try {
				FileInputStream fis = new FileInputStream(oriFilePath);// 읽을 파일
				FileOutputStream fos = new FileOutputStream(copyFilePath); // 복사할 파일
				int data = 0;
				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			File del = new File(oriFilePath);
			del.delete();

		}
		result.put("SUCCESS", true);
		return result;

	}

	// 정보수정제안 리스트
	@RequestMapping("/admin/revision/list")
	public String adRevList(Model model, HttpSession session, Integer page, String type, String word) {

		Integer admin = (Integer) session.getAttribute("admin");

		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		if (page == null) {
			page = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);

		if ("status".equals(type) && "승인".equals(word)) {
			map.put("word", 1);
		} else if ("status".equals(type) && "미승인".equals(word)) {
			map.put("word", 0);
		} else if ("status".equals(type) && "부적격".equals(word)) {
			map.put("word", 2);
		} else if ("cate_seq".equals(type) && "맛집".equals(word)) {
			map.put("word", 2);
		} else if ("cate_seq".equals(type) && "관광지".equals(word)) {
			map.put("word", 1);
		} else {
			map.put("word", word);
		}

		int rcount = memberService.revisionTotal(map);

		Paging paging = new Paging(page, rcount);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<Revision_CateVO> revCateList = memberService.revisionCateList();
		List<Map<String, Object>> revoList = memberService.appAllRevq(map);
		
		//내용 글자수 제한
		
		int maxLength = 10;
		System.out.println(revoList);
		if(revoList!=null) {
			for(Map<String, Object> item : revoList) {
				String content = (String) item.get("CONTENT");
				if(content != null && content.length()>maxLength) {
					content = content.substring(0,maxLength)+"...";
				}
				
				item.put("CONTENT", content);
			}
		}


		model.addAttribute("revCateList", revCateList);
		model.addAttribute("revoList", revoList);
		model.addAttribute("paging", paging);

		return ViewPath.ADMIN + "/revision/list.jsp";
	}

	@RequestMapping("/admin/revision/content")
	public String revContent(Model model, int revision_seq) {

		RevisionVO revoOne = adminService.getRevq(revision_seq);
		
		revoOne.setContent(revoOne.getContent().replaceAll("<br>", "\r\n"));

		File path = new File(FILEPATH + revoOne.getRevision_img());

		if (path != null) {
			String[] photos = path.list();

			model.addAttribute("photos", photos);

		}

		model.addAttribute("revoOne", revoOne);

		return ViewPath.ADMIN + "/revision/content.jsp";

	}

	@RequestMapping("/admin/revision/update")

	public String RevStatusUp(RevisionVO revo, int m_seq, int status, int revision_seq, Model model, String memo,
			HttpSession session,HttpServletRequest request) {

		Integer admin = (Integer) session.getAttribute("admin");

		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		revo.setM_seq(m_seq);
		revo.setMemo(memo);
		revo.setRevision_seq(revision_seq);

		int su = 0;

		if (status == 1) {
			su = adminService.appUpStatus(revo);
		} else if (status == 2) {
			//승인에서 부적격으로 변경 시 포인트도 차감..? 같은 종류 부여 포인트인지 어떻게 판단?
			su = adminService.NonAppUpStatus(revo);
		}
		
			//////////////희지////////////////////
			if(su!=0) {
				su = memberService.revisionPoint("revision_status", revo,  request);
				if(su!=0) {
					memberService.afterPoint(m_seq);
				}
			}
			/////////////////////////////////////

		model.addAttribute("su", su);
		model.addAttribute("msg", "정보제안 수정 상태변경");
		model.addAttribute("url", "/admin/revision/list?login=" + admin);

		return ViewPath.ADMIN + "result.jsp";

	}

	@RequestMapping("/admin/cs/inquiry")
	public String adInquiry(Model model, String type, String word, Integer page, HttpSession session) {

		Integer admin = (Integer) session.getAttribute("admin");

		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";

		}

		if (page == null) {
			page = 1;
		}

		if (type != null && type.equals("")) {
			type = null;
			word = null;
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);
		if ("answer".equals(type) && "미응답".equals(word)) {
			map.put("word", 0);
		} else if ("answer".equals(type) && "답변완료".equals(word)) {
			map.put("word", 1);
		} else {
			map.put("word", word);

		}

		int boardCount = adminService.getInquiryTotal(map);

		Paging paging = new Paging(page, boardCount);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<InquiryVO> iqList = adminService.inquiryList(map);
		List<CS_SubCateVO> csSubCateList = adminService.csSubCateAll();

		model.addAttribute("iqList", iqList);
		model.addAttribute("csSubCateList", csSubCateList);
		model.addAttribute("paging", paging);

		return ViewPath.ADMIN + "cs/inquiry.jsp";
	}

	@RequestMapping("/admin/cs/content")
	public String adInquiryContent(int inquiry_seq, Model model, HttpServletRequest request) {

		Integer admin = (Integer) request.getSession().getAttribute("admin");

		Integer login = (Integer) request.getSession().getAttribute("login");

		if (login == null && admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		InquiryVO iqvo = adminService.inquiryOne(inquiry_seq);
		
		if(iqvo.getContent() != null) {
		
		iqvo.setContent(iqvo.getContent().replaceAll("<br>", "\r\n"));
		}
		
		if(iqvo.getDo_answer() !=null) {
		iqvo.setDo_answer(iqvo.getDo_answer().replaceAll("<br>", "\r\n"));
		}

		File path = new File(FILEPATH + iqvo.getInquiry_img());
		// System.out.println("자주 묻는 질문 경로="+path);

		String[] parts = path.getPath().split("[\\\\/]"); // File 객체로부터 경로를 (문자열로)얻어온 후에 split 사용(문자열을 백슬래시 또는 슬래시를 구분자로
															// 사용하여 분리하는 것을 의미)
		// System.out.println(parts.length);
		String folder = parts[parts.length - 2]; // 배열에서 뒤에서 두 번째 요소.

		if (path != null) {
			String[] photos = path.list();
			model.addAttribute("photos", photos);

		}
		//취소 환불일때 예약 정보 넘기기
		Integer purchase_no = iqvo.getPurchase_no();
		
		Integer kind=0;
		
		if(purchase_no !=0) {
			T_PurchaseVO tpvoo = new T_PurchaseVO();
			
			tpvoo = adminService.t_purchase(purchase_no);
			kind = tpvoo.getKind();
			//System.out.println(kind);
			
			if (kind!=0) {
				T_PurchaseVO tpvo = new T_PurchaseVO();
				tpvo = adminService.t_purchaseOne(purchase_no);

				model.addAttribute("tpvo", tpvo);

			}else if(kind==0) {
				
				
				Map<String, Object> pmvo = new HashMap<String, Object>();
				pmvo =adminService.accomPaymentOne(purchase_no);
				
				model.addAttribute("pmvo",pmvo);
				
				
			}
		}
		

		//System.out.println(tpvo.getSerial_no());

		model.addAttribute("iqvo", iqvo);
		model.addAttribute("kind", kind);
		model.addAttribute("admin", admin);
		model.addAttribute("folder", folder);
		model.addAttribute("login", login);
		

		return ViewPath.ADMIN + "cs/iqcontent.jsp";
	}

	@RequestMapping("/admin/cs/answer")
	public String Iqanswer(InquiryVO iqvo, Model model, int m_seq, int inquiry_seq) {

		iqvo.setM_seq(m_seq);
		iqvo.setInquiry_seq(inquiry_seq);
		
		if(iqvo.getDo_answer() != null) {
		iqvo.setDo_answer(iqvo.getDo_answer().replaceAll("<br>", "\r\n"));
		}

		int su = adminService.doAnswerUp(iqvo);


		model.addAttribute("su", su);
		model.addAttribute("msg", "답변등록");
		model.addAttribute("url", "/admin/cs/inquiry");

		return ViewPath.ADMIN + "result.jsp";
	}

	// 리뷰 회원신고
	@RequestMapping("/admin/report/mlist")
	public String rePortmlist(Model model, String type, String word, Integer page, HttpSession session) {

		Integer admin = (Integer) session.getAttribute("admin");
		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		Map<String, Object> map = new HashMap<String, Object>();

		if (page == null) {
			page = 1;
		}

		map.put("type", type);
		if ("result".equals(type) && "미승인".equals(word)) {
			map.put("word", 0);

		} else if ("result".equals(type) && "승인".equals(word)) {
			map.put("word", 1);

		} else if ("result".equals(type) && "부적격".equals(word)) {
			map.put("word", 2);

		} else {
			map.put("word", word);
		}

		int mrCnt = adminService.mlistTotal(map);

		Paging paging = new Paging(page, mrCnt);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<M_ReportVO> mrlist = adminService.mReportLsit(map);
		List<M_Report_CateVO> mcnlist = adminService.mRepCtselect();

		model.addAttribute("mrlist", mrlist);
		model.addAttribute("mcnlist", mcnlist);
		model.addAttribute("paging", paging);

		return ViewPath.ADMIN + "report/member.jsp";
	}

	// 리뷰 신고
	@RequestMapping("/admin/report/mrlist")
	public String rePortmrlist(Model model, HttpSession session, String type, String word, Integer page) {

		Integer admin = (Integer) session.getAttribute("admin");
		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		if (page == null) {
			page = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);
		if ("result".equals(type) && "승인".equals(word)) {
			map.put("word", 1);
		} else if ("result".equals(type) && "미승인".equals(word)) {
			map.put("word", 0);
		} else if ("result".equals(type) && "부적격".equals(word)) {
			map.put("word", 2);
		} else {
			map.put("word", word);

		}

		int mrvcnt = adminService.reportTotal(map);

		Paging paging = new Paging(page, mrvcnt);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<Report_CateVO> rcList = adminService.reviewReportCateselect();

		List<Map<String, Object>> rvList = adminService.reviewReportList(map);

		model.addAttribute("rcList", rcList);
		model.addAttribute("rvList", rvList);
		model.addAttribute("paging", paging);

		return ViewPath.ADMIN + "report/review.jsp";
	}

	// 리뷰신고컨텐츠
	@RequestMapping("/admin/report/review")
	public String rvContent(HttpServletRequest request) {

		Integer kind = Integer.parseInt(request.getParameter("kind"));
		int report_cate_seq = Integer.parseInt(request.getParameter("report_cate_seq"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		if (kind == 0) {
			Map<String, Object> rep = adminService.rvContent(boardNo);
			
			String content = (String)rep.get("CONTENT");
			content=content.replaceAll("<br>", "\r\n");
			
			String rcontent = (String)rep.get("RCONTENT");
			rcontent=rcontent.replaceAll("<br>", "\r\n");
			
			request.setAttribute("rep", rep);
			request.setAttribute("kind", kind);
			request.setAttribute("content", content);
			request.setAttribute("rcontent", rcontent);
			
		

		} else {
			Map<String, Object> rep = adminService.rv_cmtContent(boardNo);
			String content = (String)rep.get("CONTENT");
			content=content.replaceAll("<br>", "\r\n");
			
			String rcontent = (String)rep.get("RCONTENT");
			if(rcontent != null) {
			rcontent=rcontent.replaceAll("<br>", "\r\n");
			
			}
			
			request.setAttribute("rep", rep);
			request.setAttribute("content", content);
			request.setAttribute("rcontent", rcontent);
		}

		request.setAttribute("report_cate_seq", report_cate_seq);
		request.setAttribute("kind", kind);

		return ViewPath.ADMIN + "report/recontent.jsp";

	}

	// 리뷰신고 상태 업데이트
	@RequestMapping("/admin/report/reUpdate")
	public String rvrpUpdate(Model model, ReviewVO revo, ReportVO repvo, int board_no, int report_seq, int result,
			int report_cate_seq, Review_CmtVO rcvVo, int kind) {
		


		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();

		int su = 0;

		// report 업데이트

		repvo.setReport_seq(report_seq);
		repvo.setResult(result);
		repvo.setMemo(repvo.getMemo());
		su = adminService.rpUpdate(repvo);

		if (result == 1) {
			if (kind == 0) {
				revo.setRv_seq(board_no);
				
				map.put("rv_seq", board_no);
				map.put("report_cate_seq", report_cate_seq);

				su = adminService.scoreRV(map);
				adminService.HiddenRV(revo);
				

			} else if(kind==1) {
				rcvVo.setRv_cmt_seq(board_no);
				

				map1.put("rv_cmt_seq", board_no);
				map1.put("report_cate_seq", report_cate_seq);

				su = adminService.scoreRVC(map1);
				adminService.HiddenRVC(rcvVo);
				

			}

		}else if (result == 2) {// 숨김해제(부적격)
			if (kind == 0) {
				revo.setRv_seq(board_no);
				revo.setReport_status(0);
				
				
				su = adminService.scoreReset(board_no);
				su = adminService.defaultRV(revo);
				

			} else if(kind==1) {
				rcvVo.setRv_cmt_seq(board_no);
				rcvVo.setReport_status(0);

				su = adminService.scoreResetRVC(board_no);
				su = adminService.defaultRVC(rcvVo);
				
			}

		}

		model.addAttribute("su", su);
		model.addAttribute("msg", "신고 상태 변경");
		model.addAttribute("url", "/admin/report/mrlist");

		return ViewPath.ADMIN + "result.jsp";

	}

	@RequestMapping("/admin/mreport/memo")
	public String Mmemo(int result, HttpServletRequest request) {

		M_ReportVO mrpvo = new M_ReportVO();

		String[] m_report_seq = request.getParameter("m_report_seq").split(",");

		int su = 0;

		for (int i = 0; i < m_report_seq.length; i++) {
			int mrs = Integer.parseInt(m_report_seq[i]);

			mrpvo.setM_report_seq(mrs);
			mrpvo.setResult(result);
			
			
			su = adminService.mrpUpResult(mrpvo);
			if (result == 1) {

				su = adminService.updateScore(mrs);

				su = adminService.deleteMember();

			}else if(result==2) {
				
				su = adminService.minUpScore(mrs);

				su = adminService.deleteMember();
				
			}

			request.setAttribute("m_report_seq", m_report_seq);

		}

		return ViewPath.ADMIN + "report/memo.jsp";
	}

	@RequestMapping("/admin/mreport/doMemo")
	public String doMemo(HttpServletRequest request) {

		int su = 0;

		String memo = request.getParameter("memo");
		memo = memo.replaceAll("<br>", "\r\n");

		M_ReportVO mrvo = new M_ReportVO();

		String[] m_report_seq = request.getParameterValues("m_report_seq");
		

		for (int i = 0; i < m_report_seq.length; i++) {

			int msq = Integer.parseInt(m_report_seq[i]);

			// System.out.println(msq);

			mrvo.setM_report_seq(msq);
			mrvo.setMemo(memo);

			su = adminService.mrpUpMemo(mrvo);

		}

		request.setAttribute("msg", "메모등록");
		request.setAttribute("su", su);
		request.setAttribute("url", "/admin/report/mlist");

		return ViewPath.ADMIN + "result.jsp";
	}

	// 새미
	@RequestMapping("admin/newplace/selectNewplace")
	public String npContent(int newplace_seq, Model model) {

		NewplaceVO npvo = adminService.npOne(newplace_seq);

		File path = new File(FILEPATH + npvo.getImg());
		File path1 = new File(FILEPATH + npvo.getInfo_img());

		if (path != null && path1 != null) {
			String[] img = path.list();
			String[] info_img = path1.list();

			model.addAttribute("img", img);
			model.addAttribute("info_img", info_img);

		}

		model.addAttribute("npvo", npvo);

		return ViewPath.ADMIN + "newplace/content.jsp";
	}

	@RequestMapping("/admin/newplace/update")
	public String npUpdate(NewplaceVO npvo, Model model) {
		
		System.out.println(npvo.getM_seq());
			
		int su = adminService.npStatus(npvo);
		
		////////////////희지//////////////////
		if(su !=0) { 
			 su = memberService.newplacePoint("newplace", npvo.getNewplace_seq());
			 if(su!=0) { 
			  memberService.afterPoint(npvo.getM_seq());
			 } 
		}
		//////////////////////////////////////

		model.addAttribute("su", su);
		model.addAttribute("msg", "새로운 장소 상태 등록");
		model.addAttribute("url", "/admin/newplace/applicationList");

		return ViewPath.ADMIN + "result.jsp";

	}

	
	@RequestMapping("/admin/mreport/mcontent")
	public String mcontent(Model model, int bad_seq, int m_report_seq) {

		
		

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("bad_seq", bad_seq);
		map.put("m_report_seq", m_report_seq);

		Map<String, Object> mOne = adminService.m_reportOne(map);
		
		String content = (String) mOne.get("CONTENT");

		content= content.replaceAll("<br>","\r\n");
		
		if(mOne.get("MEMO")!= null) {
			String memo = (String) mOne.get("MEMO");
			
			memo= memo.replaceAll("<br>","\r\n");
			
			mOne.put("MEMO", memo);
			
		}
		

		model.addAttribute("mOne", mOne);
		model.addAttribute("content", content);

		return ViewPath.ADMIN + "report/mcontent.jsp";

	}

	@RequestMapping("/admin/mreport/updateOne")
	public String mReportUpPOne(M_ReportVO mrpvo, int m_report_seq, int result, HttpServletRequest request) {

		System.out.println("result="+result);

		String memo = request.getParameter("memo");
		
		memo=memo.replaceAll("\r\n", "<br>");

		int su = 0;

		mrpvo.setM_report_seq(m_report_seq);
		mrpvo.setResult(result);
		mrpvo.setMemo(memo);

		if (result == 1) {
			su = adminService.updateScore(m_report_seq);
			su = adminService.deleteMember();
			su = adminService.mrpUpResult(mrpvo);
			su = adminService.mrpUpMemo(mrpvo);
		}else if(result ==2){
			su=adminService.minUpScore(m_report_seq);
			su = adminService.mrpUpResult(mrpvo);
			su = adminService.mrpUpMemo(mrpvo);
		}

		request.setAttribute("msg", "회원 신고 상태 등록");
		request.setAttribute("su", su);
		request.setAttribute("url", "/admin/report/mlist");

		return ViewPath.ADMIN + "result.jsp";
	}
	
	@RequestMapping("/admin/member/content")
	public String adMemContent(Model model,int m_seq) {
		
		Map<String, Object> member = adminService.detailMember(m_seq);
		
		model.addAttribute("member",member);

		return ViewPath.ADMIN+"member/content.jsp";
		
	}
	
	//여행기 신고
	
	@RequestMapping("/admin/sreport/srlist")
	public String srlistContent(String type, String word, Integer page,HttpServletRequest request) {
		
	
		Integer admin = (Integer)request.getSession().getAttribute("admin");
		
		if (admin == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		if (page == null) {
			page = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("type", type);
		if ("result".equals(type) && "승인".equals(word)) {
			map.put("word", 1);
		} else if ("result".equals(type) && "미승인".equals(word)) {
			map.put("word", 0);
		} else if ("result".equals(type) && "부적격".equals(word)) {
			map.put("word", 2);
		}else if("kind".equals(type) && "여행기".equals(word)) {
			map.put("word", 0);
		}else if("kind".equals(type) && "여행기 댓글".equals(word)) {
			map.put("word", 1);
		}else {
			map.put("word", word);
		}


		int sreportTotal = adminService.sreportTotal(map);

		Paging paging = new Paging(page, sreportTotal);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());


		List<Map<String, Object>> spList = adminService.sreportList(map);


		request.setAttribute("spList", spList);
		request.setAttribute("paging", paging);

		


		return ViewPath.ADMIN+"report/slog.jsp";
		
	}
	
	@RequestMapping("/admin/sreport/scontent")
	public String s_reportOne(int s_report_seq,Model model,int kind,HttpServletRequest request) {
		
		Integer m_seq= (Integer)request.getSession().getAttribute("login");
		
		if(m_seq == null) {
			return ViewPath.LOGIN + "goLogin.jsp";
		}

		if(kind == 0) {
		
		Map<String, Object> sOne = adminService.s_reportOne(s_report_seq);
		
		String intro = (String) sOne.get("INTRO");
		
		if(intro != null) {
		
			intro = intro.replaceAll("<br>","\r\n");
			//intro = intro.replaceAll("\r\n","<br>");
		
		sOne.put("INTRO", intro);
		
		}
		String content = (String)sOne.get("CONTENT");
		if(content != null) {
			content = content.replaceAll("<br>","\r\n");
			//content = content.replaceAll("\r\n","<br>");
			sOne.put("CONTENT", content);
		}
		
		model.addAttribute("mOne",sOne);
		
		
		}else if(kind == 1 ) {
			Map<String, Object> scOne = adminService.s_report_cmtOne(s_report_seq);
			String sclct = (String)scOne.get("SCLCT");
			
			if(sclct != null) {
				sclct = sclct.replaceAll("<br>","\r\n");
				//sclct = sclct.replaceAll("\r\n","<br>");
				scOne.put("SCLCT", sclct);
			}
			String content = (String)scOne.get("CONTENT");
			if(content != null) {
				content = content.replaceAll("<br>","\r\n");
				scOne.put("CONTENT", content);
			}

			
			model.addAttribute("mOne",scOne);
		}
		
		return ViewPath.ADMIN+"report/scontent.jsp";
		
		
	}
	

	// 여행기신고 상태 업데이트
	@RequestMapping("/admin/sreport/sreportUpdate")
	public String spUpdate(Model model,SlogVO slvo , Slog_CmtVO slcvo,S_ReportVO spvo, int s_report_seq, int result,
			int report_cate_seq,int kind,int board_no) {
		

		Map<String, Object> map = new HashMap<String, Object>();
	

		int su = 0;
		
		slvo.setSlog_seq(board_no);
		slcvo.setSlog_cmt_seq(board_no);
		
		// s_report 업데이트

		spvo.setS_report_seq(s_report_seq);
		spvo.setResult(result);
		spvo.setMemo(spvo.getMemo());
		su = adminService.spUpdate(spvo);

		if (result == 1) {
			if(kind==0) {
				map.put("report_cate_seq",report_cate_seq);
				map.put("slog_seq",board_no);
				
				su = adminService.scoreSL(map);
				adminService.HiddenSL(slvo);
				
			}else if(kind ==1) {

			map.put("report_cate_seq",report_cate_seq);
			map.put("slog_cmt_seq",board_no);
			
			su = adminService.scoreSLC(map);
			adminService.HiddenSLC(slcvo);
			
			}

		} else if (result == 2) {// 숨김해제
			
			if(kind ==0) {
				su = adminService.DefaultSL(slvo);
				su = adminService.scoreSLReset(board_no);
				
			}else if(kind ==1) {

			su = adminService.DefaultSLC(slcvo);
			su = adminService.scoreResetSLC(board_no);

			}

		}

		model.addAttribute("su", su);
		model.addAttribute("msg", "여행기 신고 상태 변경");
		model.addAttribute("url", "/admin/sreport/srlist");

		return ViewPath.ADMIN + "result.jsp";

	}
	
	@RequestMapping("/admin/reviewCmtList")
	public String reviewCmtList(int m_seq,Model model,Integer page,HttpServletRequest request) {
		
		if(page == null) {
			page=1;
		}
		
		Integer login = (Integer)request.getSession().getAttribute("login");
		
		if(login == null) {
			return ViewPath.LOGIN+"goLogin.jsp";
		}
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("m_seq", m_seq);
		
		int total = adminService.rvcOneTotal(rmap);
		
		Paging paging = new Paging(page,total);
		
		rmap.put("first", paging.getFirst());
		rmap.put("last", paging.getLast());
		
		
		
		List<Map<String, Object>> map = adminService.rvcOne(rmap);
		
		model.addAttribute("map",map);
		model.addAttribute("paging",paging);
		
		
		return ViewPath.ADMIN+"member/rvclist.jsp";
		
	}
	
	
	
	
	
	
	
	
	
}
