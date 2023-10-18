package controller.join;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;
import service.admin.MailSendService;
import service.member.MemberService;
import vo.admin.CouponVO;
import vo.member.CouponlistVO;
import vo.member.MemberVO;
import vo.member.NoticelistVO;
@Controller
public class JoinController {
	
	private MemberService memberService;
	@Autowired
	private MailSendService mailSendService;
	
	
	public JoinController(MemberService memberService,MailSendService mailSendService) {
		this.memberService = memberService;
		this.mailSendService = mailSendService;
	}
	


	@RequestMapping("/join/joinForm")
	public String joinForm() {
		
		return ViewPath.JOIN + "joinForm.jsp";
	}
	
	
	@RequestMapping(value="/join/checkEmail", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkEmail(String m_email) {
		
		if(memberService.checkEmail(m_email)) {
			return "이미 사용 중인 Email입니다.";
		}else {
			return "사용 가능한 Email입니다.";
		}
		
	}
	
	
	@GetMapping("/join/sendEmail")
	@ResponseBody
	public String sendEmail(String m_email) {
		
		return mailSendService.joinEmail(m_email);
	}
	
	
	@RequestMapping("/join/joinCheck")
	public String joinCheck(MemberVO vo, Model model) {
		
		int m_seq = memberService.nowM_Seq();
		
		//추천코드 생성
		int min = 48;
		int max = 122;
		int length = 6;
		
		Random rd = new Random();
		
		String str = rd.ints(min, max+1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
				.limit(length)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
		
		
		vo.setM_seq(m_seq);
		vo.setM_code(str);
		int su = memberService.insert(vo);
		
		String msg = "";
		String url = "";
		if(su != 0) {
			url = "/login/loginForm";
			msg = "회원가입";
		}else {
			msg = "회원가입";
		}
		
		
		model.addAttribute("su", su);
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return ViewPath.INDEX + "result.jsp";	
	}
	
	
	
	//////////희지/////////////////////////////////////////////
	// 회원가입 성공 시 웰컴 쿠폰 부여
	public void welcomeCoupon(int m_seq) {
		List<CouponVO> clist = memberService.welcome();
		if(clist.isEmpty()) return;
		
		CouponlistVO vo = new CouponlistVO();
		vo.setM_seq(m_seq);
		vo.setKind(0);
		
		for(CouponVO cvo:clist) {
			int plus = cvo.getValid_date();
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.DATE, plus);
			java.util.Date d = ca.getTime();
			Date date = new Date(d.getTime());
			vo.setValid_date(date);
			
			vo.setCoupon_no(cvo.getCoupon_seq());
			memberService.insertCoupon(vo);
		}
	}
	
	// 그 달의 혜택 쿠폰 회원가입시에만 직접 제공
	public void monthCoupon(int m_seq) {
		Calendar ca = Calendar.getInstance();
		int month = ca.get(Calendar.MONTH)+1;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		map.put("m_seq", m_seq);
		
		List<Integer> clist = memberService.new_month(month);
		if(clist.isEmpty()) return;
		
		CouponlistVO vo = new CouponlistVO();
		
		int lastDay = ca.getActualMaximum(Calendar.DAY_OF_MONTH);
		int year = ca.get(Calendar.YEAR);
		ca.set(year, month-1, lastDay);
		java.util.Date d = ca.getTime();
		Date date = new Date(d.getTime());
		
		vo.setValid_date(date);
		vo.setKind(0);
		vo.setM_seq(m_seq);
		
		for(Integer seq:clist) {
			vo.setCoupon_no(seq);
			memberService.insertCoupon(vo);
		}
	}
	
	// 특가 쿠폰도 회원가입 시에 있으면 제공
	public void specialCoupon(int m_seq) {
		List<CouponVO> clist = memberService.new_special();
		if(clist.isEmpty()) return;
		
		CouponlistVO vo = new CouponlistVO();
		vo.setM_seq(m_seq);
		vo.setKind(0);
		
		for(CouponVO cvo : clist) {
			int plus = cvo.getValid_date();
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.DATE, plus);
			java.util.Date d = ca.getTime();
			Date date = new Date(d.getTime());
			vo.setValid_date(date);
			
			vo.setCoupon_no(cvo.getCoupon_seq());
			memberService.insertCoupon(vo);
		}
	}
	
	// 쿠폰팩 확인하라고 알림 -> 쿠폰 리스트로 연결
	public void newCoupon(int m_seq) {
		NoticelistVO vo = new NoticelistVO();
		vo.setM_seq(m_seq);
		vo.setNotice_seq(2);
		memberService.noticeInsert(vo);
	}
	
}
