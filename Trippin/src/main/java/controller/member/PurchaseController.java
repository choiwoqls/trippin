package controller.member;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.member.MemberService;
import service.member.PurchaseService;
import vo.common.CancelVO;
import vo.common.Cancel_CateVO;
import vo.common.PayVO;
import vo.member.CouponlistVO;
import vo.member.MycashVO;
import vo.ticket.Ccp_WordVO;
import vo.ticket.OptVO;
import vo.ticket.SuboptVO;
import vo.ticket.T_AmountVO;
import vo.ticket.T_PurchaseVO;
import vo.ticket.T_ReserverVO;
import vo.ticket.TicketVO;

@Controller
public class PurchaseController {

	private PurchaseService purchaseService;
	private MemberService memberService;

	public PurchaseController(PurchaseService purchaseService, MemberService memberService) {
		this.purchaseService = purchaseService;
		this.memberService = memberService;
	}

	// 날짜 및 옵션 선택 창
	@RequestMapping("/member/ticket/selectDate")
	public String selectDate(int ticket, HttpServletRequest request) {
		Integer m_seq = (Integer) request.getSession().getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}

		List<OptVO> olist = purchaseService.oneOpt(ticket);
		if (olist.isEmpty())
			olist = null;

		TicketVO tvo = purchaseService.valid(ticket);
		
		Calendar ca = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateFormat.format(ca.getTime());
		
		if (tvo.getValid_type() == 1) {
			if(tvo.getValid_date() != null) {
				String[] date = tvo.getValid_date().split(",");
				
				if(date.length == 1) {
					request.setAttribute("valid", date[0]);
				}else {

					java.util.Date start = null;
					
					try {
						start = dateFormat.parse(date[0]);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					if(ca.getTime().compareTo(start) < 0) {
						// 시작 일자가 오늘보다 뒤에면
						request.setAttribute("start", date[0]);
						// 시작일자부터 선택 가능하도록
					}else {
						// 시작 일자가 이미 지났으면
						request.setAttribute("start", today);
					}
					request.setAttribute("valid", date[1]);
				}
			} else {
				request.setAttribute("valid", tvo.getSell_date());
			}
		}else {
			// 구매일로부터 ~일인경우
			request.setAttribute("start", today);
			request.setAttribute("only", 0);
			if(!tvo.getValid_date().equals("0")) {
				LocalDate valDate = LocalDate.now().plusDays(Integer.parseInt(tvo.getValid_date()));
				DateTimeFormatter formatt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				request.setAttribute("valid", valDate.format(formatt));
			}
		}
		request.setAttribute("olist", olist);
		return ViewPath.TICKET + "selectDate.jsp";
	}

	// 하위 옵션 가져오기
	@RequestMapping("/member/ticket/takeOpt")
	@ResponseBody
	public List<SuboptVO> subOpt(int opt_seq) {
		List<SuboptVO> sub = purchaseService.oneSubopt(opt_seq);
		if (sub.isEmpty())
			sub = null;
		return sub;
	}

	//에약 폼 이동
	@RequestMapping("/member/ticket/reserveForm")
	public String reserveForm(HttpServletRequest request, int ticket, String startDate, @RequestParam(value="endDate", required=false)String endDate) {
		// 티켓명
		String ticket_name = purchaseService.ticketName(ticket);

		// opt의 서브 옵션 내역
		int opt_seq = Integer.parseInt(request.getParameter("opt_seq"));
		List<SuboptVO> sub = purchaseService.oneSubopt(opt_seq);

		// 다시 합산
		String[] amount = request.getParameterValues("amount");
		T_AmountVO vo = new T_AmountVO();
		
		int tot = 0;
		List<Integer> seqList = new ArrayList<Integer>();
		for (int i = 0; i < sub.size(); i++) {
			int price = 0;
			vo.setSubopt_seq(sub.get(i).getSubopt_seq());

			if (!amount[i].equals("0")) {
				vo.setAmount(Integer.parseInt(amount[i]));
				if (sub.get(i).getDc_rate() == 0) {
					price = sub.get(i).getSubopt_price();
					price *= Integer.parseInt(amount[i]);
					tot += price;
					vo.setSum_price(price);
				} else {
					vo.setAmount(Integer.parseInt(amount[i]));
					price = sub.get(i).getDc_rate();
					price *= Integer.parseInt(amount[i]);
					tot += price;
					vo.setSum_price(price);
				}
				int su = purchaseService.amountInsert(vo);
				if (su != 0) {
					seqList.add(purchaseService.amountSeq());
				}
			}
		}

		// 선택한 내역들 보내기
		if (seqList.isEmpty()) {
			seqList = null;
		} else {
			List<T_AmountVO> pickList = new ArrayList<T_AmountVO>();
			for (int i : seqList) {
				pickList.add(purchaseService.pickList(i));
			}
			request.setAttribute("pickList", pickList);
		}
		
		Integer m_seq = (Integer) request.getSession().getAttribute("login");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_seq", m_seq);
		map.put("max_min", tot);
		map.put("use", 1);

		// 적용 가능한 쿠폰이 있는지 여부 확인용
		List<Map<String, Object>> clist = purchaseService.buyCoupon(map);
		if (clist.isEmpty())
			clist = null;

		// 기존에 저장된 예약 정보
		T_ReserverVO trvo = purchaseService.oneInfo(m_seq);

		// 적립 퍼센트
		int percent = memberService.percent(1);
		request.setAttribute("percent", percent);
		
		// 나의 사용 가능 캐시
		int cash = memberService.canUse(m_seq);
		request.setAttribute("cash", cash);
		
		int cancel_status = purchaseService.cancel_status(ticket);
		if(cancel_status == 1 ) {	// 환불 가능여부 판단
			Map<String, Object> cancelMap = cancelDetail(startDate, endDate, ticket).get(0);
			request.setAttribute("cm",cancelMap );
		}
		
		request.setAttribute("start", startDate);
		request.setAttribute("end", endDate);
		request.setAttribute("tot", tot);
		request.setAttribute("ticket_name", ticket_name);
		request.setAttribute("trvo", trvo);
		request.setAttribute("clist", clist);
		return ViewPath.TICKET + "reserveForm.jsp";
	}

	// 쿠폰 선택하러 다녀오기(공통)
	@RequestMapping("/member/{what}/coupon")
	public String selectCoupont(@PathVariable("what")String what, int price, HttpServletRequest request) {
		Integer m_seq = (Integer) request.getSession().getAttribute("login");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_seq", m_seq);
		map.put("max_min", price);
		
		if(what.equals("ticket")) {
			map.put("use", 1);
		}else {
			map.put("use", 2);
		}

		List<Map<String, Object>> clist = purchaseService.buyCoupon(map);
		if (clist.isEmpty())
			clist = null;

		request.setAttribute("tot", price);
		request.setAttribute("clist", clist);
		return ViewPath.TICKET + "selectCoupon.jsp";
	}

	// 티켓 구매폼 이동
	@RequestMapping("/member/ticket/purchaseForm")
	public String purchaseForm(HttpServletRequest request, int ticket) {
		
		// vo로 안불러와져서...ㅜㅜㅜ
		String end_date = request.getParameter("end_date");
		String use_date = request.getParameter("use_date");
		String reserver_name = request.getParameter("reserver_name");
		String reserver_email = request.getParameter("reserver_email");
		String reserver_tel = request.getParameter("reserver_tel");
		String repre_name = request.getParameter("repre_name");
		String repre_tel = request.getParameter("repre_tel");
		String coupon_seq = request.getParameter("coupon_seq");
		int tot_money = Integer.parseInt(request.getParameter("tot_money"));
		int pay_money = Integer.parseInt(request.getParameter("pay_money"));
		String[] seqList = request.getParameterValues("seq");
		int percent = Integer.parseInt(request.getParameter("percent"));
		int cash = Integer.parseInt(request.getParameter("cash"));
		
		T_ReserverVO rvo = new T_ReserverVO();

		// 회원 시퀀스
		Integer m_seq = (Integer) request.getSession().getAttribute("login");

		// 예약 정보 저장
		rvo.setReserver_tel(reserver_tel.replaceAll("-", ""));
		rvo.setM_seq(m_seq);
		rvo.setReserver_name(reserver_name);
		rvo.setReserver_email(reserver_email);
		if (purchaseService.oneInfo(m_seq) == null) {
			purchaseService.reserveInsert(rvo);
		} else {
			purchaseService.reserveUpdate(rvo);
		}
		
		// 옵션명 보내기
		String optName = purchaseService.optName(Integer.parseInt(seqList[0]));
		request.setAttribute("optName", optName);
		
		// 선택 내역 보내기
		List<T_AmountVO> pickList = new ArrayList<T_AmountVO>();
		for (String seq : seqList) {
			pickList.add(purchaseService.pickList(Integer.parseInt(seq)));
		}
		request.setAttribute("pickList", pickList);

		// 티켓명
		String ticket_name = purchaseService.ticketName(ticket);
		request.setAttribute("ticket_name", ticket_name);

		// 결제 수단 종류
		List<PayVO> pay = purchaseService.pay();
		request.setAttribute("pay", pay);

		request.setAttribute("cash", cash);
		request.setAttribute("percent", percent);
		request.setAttribute("rvo", rvo);
		request.setAttribute("repre_name", repre_name);
		request.setAttribute("repre_tel", repre_tel);
		request.setAttribute("end_date", end_date);
		request.setAttribute("use_date", use_date);
		request.setAttribute("coupon_seq", coupon_seq);
		request.setAttribute("tot_money", tot_money);
		request.setAttribute("pay_money", pay_money);
		return ViewPath.TICKET + "purchaseForm.jsp";
	}

	// 티켓 구매 등록
	@RequestMapping("/member/ticket/purchase")
	public String purchase(int ticket, HttpServletRequest request) {
		Integer m_seq = (Integer) request.getSession().getAttribute("login");

		String[] seqList = request.getParameterValues("seq");
		int pay_seq = Integer.parseInt(request.getParameter("pay_seq"));
		String repre_name = request.getParameter("repre_name");
		String repre_tel = request.getParameter("repre_tel");
		String use_date = request.getParameter("use_date");
		String end_date = request.getParameter("end_date");
		int tot_money = Integer.parseInt(request.getParameter("tot_money"));
		int pay_money = Integer.parseInt(request.getParameter("pay_money"));
		String coupon = request.getParameter("coupon_seq");
		int earnCash = Integer.parseInt(request.getParameter("earnCash"));
		int useCash = Integer.parseInt(request.getParameter("useCash"));
		
		T_PurchaseVO pvo = new T_PurchaseVO();
		pvo.setUse_cash(useCash);
		
		// 캐시 사용의 경우 차감하기
		if(useCash != 0) {
			List<MycashVO> clist = memberService.canUseList(m_seq);
			MycashVO mcvo = new MycashVO();
			for(MycashVO cvo : clist) {
				mcvo.setMycash_seq(cvo.getMycash_seq());
				if(cvo.getSpare()<=useCash) {
					mcvo.setSpare(0);
					useCash -= cvo.getSpare();
				}else {
					mcvo.setSpare(cvo.getSpare() - useCash);
					useCash = 0;
				}
				memberService.updateUse(mcvo);
				if(useCash == 0) {
					break;
				}
			}
		}

		T_ReserverVO trvo = purchaseService.oneInfo(m_seq);

		pvo.setM_seq(m_seq);
		pvo.setTicket_seq(ticket);

		int coupon_kind = 2;
		int coupon_no = 0;

		if (!coupon.isEmpty()) {
			coupon = coupon.replaceAll("coupon_", "");
			if(!coupon.equals("0")) {
				coupon_kind = Integer.parseInt(coupon.substring(coupon.length() - 1, coupon.length()));
				coupon_no = Integer.parseInt(coupon.substring(0, coupon.length() - 1));
			}
		}
		pvo.setCoupon_kind(coupon_kind);
		pvo.setCoupon_no(coupon_no);

		// date 날짜 형식으로 변환
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		pvo.setUse_date(Date.valueOf(LocalDate.parse(use_date.replaceAll("-", "/"), dateFormatter)));
		pvo.setEnd_date(Date.valueOf(LocalDate.parse(end_date.replaceAll("-", "/"), dateFormatter)));
		
		// 수량 시퀀스 넣기
		String amount_no = "";
		for (int i = 0; i < seqList.length; i++) {
			if (i == 0) {
				amount_no += seqList[i];
			} else {
				amount_no += "," + seqList[i];
			}
		}
		pvo.setT_amount_no(amount_no);

		pvo.setTot_money(tot_money);
		pvo.setPay_money(pay_money);

		pvo.setReserver_name(trvo.getReserver_name());
		pvo.setReserver_tel(trvo.getReserver_tel());
		pvo.setReserver_email(trvo.getReserver_email());
		pvo.setRepre_name(repre_name);
		pvo.setRepre_tel(repre_tel);
		pvo.setPay_seq(pay_seq);

		// 예약번호 짜기
		String reserve = "T" + System.currentTimeMillis();
		pvo.setSerial_no(reserve);
		
		int su = purchaseService.purchaseInsert(pvo);
		int t_purchase_seq = 0;
		
		if (su != 0) {
			t_purchase_seq = purchaseService.purchaseSeq();
			
			// 쿠폰 사용 처리
			if (coupon_kind != 2 && !coupon.isEmpty()) {
				CouponlistVO cvo = new CouponlistVO();
				cvo.setKind(coupon_kind);
				cvo.setCoupon_no(coupon_no);
				cvo.setM_seq(m_seq);
				purchaseService.useCoupon(cvo);
			}
			
			MycashVO mcvo = new MycashVO();
			mcvo.setM_seq(m_seq);
			mcvo.setKind(1);
			mcvo.setPurchase_no(t_purchase_seq);

			// mycash에 사용 포인트 insert하기
			if(useCash != 0) {
				mcvo.setCash(pvo.getUse_cash());
				mcvo.setSpare(0);
				mcvo.setWhat(2);
			}
			
			/////////// 캐시 지급(예정일)///////////
			mcvo.setCash(earnCash);
			mcvo.setSpare(earnCash);
			mcvo.setWhat(0);

			// calendar 사용하지 않고 바로 10일 더해주기
			LocalDate localDate = LocalDate.parse(end_date.replaceAll("-", "/"), dateFormatter).plus(10, ChronoUnit.DAYS);
			Date giveDate = Date.valueOf(localDate);
			mcvo.setCash_date(giveDate);

			su = memberService.cashInsert(mcvo);
			
		}

		request.setAttribute("su", su);
		request.setAttribute("url", "/member/ticket/myOne?purchase=" + t_purchase_seq);
		request.setAttribute("msg", "티켓 결제");
		return ViewPath.TICKET + "result.jsp";
	}

	// 내 티켓 상세 보이기
	@RequestMapping("/member/ticket/myOne")
	public String myOne(int purchase, Model model) {
		Map<String, Object> map = purchaseService.myTicket(purchase);
		model.addAttribute("map", map);
		
		// 선택 내역 보내기
		String[] amountSeq = ((String)map.get("T_AMOUNT_NO")).split(",");
		List<T_AmountVO> pickList = new ArrayList<T_AmountVO>();
		for (String seq : amountSeq) {
			pickList.add(purchaseService.pickList(Integer.parseInt(seq)));
		}
		model.addAttribute("pickList", pickList);
		
		Map<String, Integer> cmap = cancelOk(purchase, model);
		model.addAttribute("cmap",cmap);
		
		if(((BigDecimal)map.get("STATUS")).intValue() == 3) {
			CancelVO cvo = new CancelVO();
			cvo.setKind(1);
			cvo.setPurchase_no(purchase);
			Integer status = purchaseService.cancelStatus(cvo);
			model.addAttribute("status", status);
			
			if(status == 1) {
				Map<String, Object> rmap = new HashMap<String, Object>();
				rmap.put("t_purchase_seq", purchase);
				rmap.put("kind", 1);
				rmap = purchaseService.refundDetail(rmap);
				model.addAttribute("rmap", rmap);
			}
		}
		
		return ViewPath.TICKET + "myOne.jsp";
	}
	
	// 취소 가능한지 여부 판단하기
	public Map<String, Integer> cancelOk(int purchase, Model model) {
		T_PurchaseVO vo = purchaseService.ticket_seq(purchase);
		java.util.Date endDate = new java.util.Date(vo.getEnd_date().getTime());
		java.util.Date useDate = new java.util.Date(vo.getUse_date().getTime());

		List<Ccp_WordVO> ccp_word_use = purchaseService.ccp_word_use(vo.getTicket_seq());
		
		// 비교할 객체 하나 두기
		Calendar ca1 = new GregorianCalendar();
		int compare = 0;
		int su = 0;
		int percent = 0;
		
		// 취소 가능 여부가 가능일 경우에만~!
		if(purchaseService.cancel_status(vo.getTicket_seq()) != 0) {
			
			if (!ccp_word_use.isEmpty()) {
				for (Ccp_WordVO cvo : ccp_word_use) {
					Calendar ca = Calendar.getInstance();
					String[] range = cvo.getWord().split(",");
					Integer day = Integer.parseInt(range[0]) / 24;
					
					//17시를 넘기면 다음 날로 간주하므로
					if(ca.get(Calendar.HOUR_OF_DAY)>17){
						//오늘 날짜에서 +1일 해주기
						ca.add(Calendar.DATE, 1);
					}
					
					// 이용 예정일 설정 후 기간 빼주기
					ca1.setTime(useDate);
					ca1.add(Calendar.DATE, -day);
					compare = ca1.compareTo(ca);
					
					if (compare >= 0) {
						su = 1;
						percent = Integer.parseInt(range[1]);
						break;
					}
				}
				
				if (su == 0) {
					Calendar ca = Calendar.getInstance();
					Ccp_WordVO ccp_word_end = purchaseService.ccp_word_end(vo.getTicket_seq());
					if (ccp_word_end != null) {
						ca1.setTime(endDate);
						
						compare = ca1.compareTo(ca);
						if (compare >= 0) {
							su = 1;
							percent = Integer.parseInt(ccp_word_end.getWord());
						}
					}
				}
			} else {
				Calendar ca = Calendar.getInstance();
				Ccp_WordVO ccp_end = purchaseService.ccp_word_end(vo.getTicket_seq());
				if (ccp_end != null) {
					ca1.setTime(endDate);
					
					compare = ca1.compareTo(ca);
					if (compare >= 0) {
						su = 1;
						percent = Integer.parseInt(ccp_end.getWord());
					}
				}
			}
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("su", su);
		map.put("percent", percent);
		return map;
	}

	// 취소 폼으로 이동하기(숙소 + 티켓)
	@RequestMapping("/member/cancelForm/{kind}")
	public String cancelForm(@PathVariable("kind") int kind, int purchase, Model model) {
		
		List<Cancel_CateVO> clist = purchaseService.cancel_cate();
		if(clist.isEmpty()) clist = null;
		
		Map<String, Integer> map = cancelOk(purchase, model);
		
		model.addAttribute("kind", kind);
		model.addAttribute("map", map);
		model.addAttribute("clist", clist);
		return ViewPath.TICKET + "cancelForm.jsp";
	}
	
	// 취소 진행
	@RequestMapping("/member/ticket/cancel")
	public String cancel(int purchase, Model model, CancelVO vo, HttpSession session) {
		Integer m_seq = (Integer)session.getAttribute("login");
		if(m_seq  == null) {
			return ViewPath.MEMBER + "goLogin.jsp";
		}
		
		vo.setM_seq(m_seq);
		vo.setCancel_percent(cancelOk(purchase, model).get("percent"));
		System.out.println(vo.getContent() == null);
		if(vo.getContent() != null) {
			vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
		}
		vo.setPurchase_no(purchase);
		
		int su = purchaseService.cancelInsert(vo);
		String url="";
		
		if(su!=0) {
			if(vo.getKind() == 0) {
				
			}else {
				purchaseService.returnCancel(purchase);
				
				MycashVO cvo = new MycashVO();
				cvo.setKind(1);
				cvo.setPurchase_no(purchase);
				memberService.cancelCash(cvo);
				url = "/member/ticket/myOne?purchase="+purchase;
			}
		}
		
		model.addAttribute("su", su);
		model.addAttribute("msg", "취소");
		model.addAttribute("url", url);
		return ViewPath.TICKET + "result.jsp";
	}
	
	/////////////////////////////////////
	@RequestMapping("/member/ticket/cancelInfo/{start}")
	public String cancelInfo(@PathVariable("start")String start, @RequestParam(value="end", required=false)String end, int ticket, Model model) {
		List<Map<String, Object>> list = cancelDetail(start, end, ticket);
		if(list.isEmpty()) {
			list = null;
		}
		model.addAttribute("list", list);
		return ViewPath.TICKET + "cancelInfo.jsp";
	}
	
	public List<Map<String, Object>> cancelDetail(String start,String end, int ticket) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//이용 예정일 %d시간 전까지 취소 시, %d% 환불
		List<Ccp_WordVO> ccp_use = purchaseService.ccp_word_use(ticket);
		for(int i=0; i<ccp_use.size(); i++) {
			String[] words = ccp_use.get(i).getWord().split(",");
			int day = Integer.parseInt(words[0])/24;
			
			Calendar ca = Calendar.getInstance();
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			Date start_date = Date.valueOf(LocalDate.parse(start.replaceAll("-", "/"), dateFormatter));
			
			ca.setTime(start_date);
			ca.add(Calendar.DATE, -day);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String formattedDate = dateFormat.format(ca.getTime());
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date", formattedDate);
			map.put("percent", words[1]);
			list.add(map);
		}
		
		//유효기간 당일까지 취소 시, %d% 환불
		if(end != null) {	// 유효기간 존재할 경우
			Ccp_WordVO ccp_end = purchaseService.ccp_word_end(ticket);
			if(ccp_end != null) {	// 유효기간 관련 취소규정이 있다면
				String[] ends = end.split("-");
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("date", ends[0]+"년 "+ends[1]+"월 " +ends[2]+"일");
				map.put("percent", ccp_end.getWord());
				
				list.add(map);
			}
		}
		
		return list;
	}
	

}
