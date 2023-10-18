package controller.login;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.ViewPath;
import service.admin.AdminService;
import service.login.LoginService;
import service.member.MemberService;
import service.member.ScheService;
import vo.member.MemberVO;
import vo.member.MycashVO;
import vo.member.NoticelistVO;

@Controller
public class LoginController {
	
	private LoginService loginService;
	private AdminService adminService;
	private MemberService memberService;
	private ScheService scheService;
	
	public LoginController(LoginService loginService, 
							AdminService adminService, 
							MemberService memberService,
							ScheService scheService) {
		this.loginService = loginService;
		this.adminService = adminService;
		this.memberService = memberService;
		this.scheService = scheService;
	}
	
	@RequestMapping("/login/loginForm")
	public String loginForm(HttpServletRequest request, String m_email) {
		boolean check = false;
		
		if(m_email == null) {
			Cookie[] cks = request.getCookies();
			
			if(cks != null) {
				for(Cookie ck : cks) {
					if(ck.getName().equals("ckid")) {
						m_email = ck.getValue();
						check = true;
						break;
					}
				}
			}
			
		}
		request.setAttribute("m_email", m_email);
		request.setAttribute("check", check);

		return ViewPath.LOGIN + "loginForm.jsp";
	}
	
	
	@RequestMapping("/login/check")
	public String checkLogin(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		int m_seq = loginService.checkLogin(vo);
		String m_nickname = loginService.getM_nickname(m_seq);
		
		int start = vo.getM_email().lastIndexOf("@");
		int end = vo.getM_email().lastIndexOf(".com");	
		
		String msg = null;
		boolean check = false;
		
		if(m_seq != 0) {
			
			
			
			//////////희지//////////////////////////////
			// 쿠폰 만료 정리
			memberService.deleteCoupon();
			// 적립예정 -> 적립 상태 변경
			memberService.updateEarn();
			// 소멸 대상 포인트 있으면 소멸시키고 - 캐시 인서트
			//(나중에 월말에 처리할 수 있도록 코드 짜볼까??)
			int cash = memberService.endCash(m_seq);
			if(cash != 0) {
				memberService.updateEnd(m_seq);
				
				MycashVO mvo = new MycashVO();
				mvo.setM_seq(m_seq);
				mvo.setCash(cash);
				mvo.setSpare(0);
				mvo.setWhat(3);
				mvo.setKind(2);
				memberService.cashInsert(mvo);
			}
			///////////알림////////////////////
			//1. 여행 3일 전 or 15일에서 한 달 사이 알림
			tripMinus3or60(m_seq);
			//2. 쿠폰 만료 5일 전부터 로그인 시 알림
			couponBye(m_seq);
			////////////////////////////////////
			
			
			
			msg = m_nickname + " 님이 로그인하셨습니다.";
			check = true;
			
			request.getSession().setAttribute("login", m_seq);
			
			
			if(vo.getM_email().substring(start + 1, end).equals("trippin")) {
				request.getSession().setAttribute("admin", m_seq);
			}
			
			
			String ckid = request.getParameter("ckid");
			Cookie ck = null;
			
			Cookie[] cks = request.getCookies();
			
			if(cks != null) {
				for (Cookie c : cks) {
					if(c.getName().equals("ckid")) {
						ck = c;
						break;
					}
				}
			}
			if(ckid != null) {
				if(ck == null) {
					ck = new Cookie("ckid", vo.getM_email());
					
					ck.setPath("/");
					
					ck.setMaxAge(60*60*24);
					
					response.addCookie(ck);
				}else {
					if(!ck.getValue().equals(vo.getM_email())) {
						ck.setValue(vo.getM_email());
						
						ck.setPath("/");
						
						response.addCookie(ck);
					}
				}
			}else {
				if(ck != null) {
					if(ck.getValue().equals(vo.getM_email())) {
						
						ck.setPath("/");
						
						ck.setMaxAge(0);
						response.addCookie(ck);
					}
				}
			}
		}else {
			msg = "이메일 혹은 비밀번호가 잘못되었습니다.";
		}
		
		//리뷰,리뷰댓글 삭제
		int su=0;
		
		List<Map<String, Object>> rv_seq = adminService.rv_seqDelete();
		
		if(!rv_seq.isEmpty()) {
			for(Map<String,Object> rv : rv_seq ) {
				int rvseq=Integer.parseInt(rv.get("RV_SEQ").toString());
				int mm_seq = Integer.parseInt(rv.get("M_SEQ").toString());
				su = adminService.deleteRV(rvseq);
				if(su!=0) {
					su = memberService.reviewPoint("review", rvseq); 
					if(su!=0) {
						memberService.afterPoint(mm_seq);
					}
				}
			}
		}
		
		adminService.deleteRVC();
		
		
		//여행기 신고 삭제
		List<Map<String, Object>> slogseq = adminService.slseqDelete();
		if(!slogseq.isEmpty()) {
			for(Map<String, Object> s : slogseq) {
				int slog_seq = Integer.parseInt(s.get("SLOG_SEQ").toString());
				int smseq = Integer.parseInt(s.get("M_SEQ").toString());
				su = adminService.deleteSL(slog_seq);
				if(su!=0) {
					su = memberService.slogPoint("slog", slog_seq);
					if(su!=0) {
						memberService.afterPoint(smseq);
					}
				}
			}
		}
		
		//여행기댓글 신고 삭제
		adminService.deleteSLC();
		
		request.setAttribute("vo", vo);
		request.setAttribute("msg", msg);
		request.setAttribute("check", check);
		
		return ViewPath.LOGIN + "result.jsp";
	}
	
	@RequestMapping("/admin/main")
	public String adminMain(HttpServletRequest request) {
		return ViewPath.ADMIN + "main.jsp";
	}
	
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
//		session.invalidate();
		session.removeAttribute("login");
		session.removeAttribute("admin");
		return ViewPath.LOGIN + "logout.jsp";
	}
	
	////////////희지///////////////////////////////////
	// 여행 3일 전 또는 60일 전
	public void tripMinus3or60(int m_seq) {
		List<Map<String, Object>> list = scheService.myIngSche(m_seq);

		for(int i=0; i<list.size(); i++) {
			int  s_seq = Integer.parseInt(String.valueOf(list.get(i).get("S_SEQ")));
			int dday = ((BigDecimal)scheService.scheInfo(s_seq).get("DDAY")).intValue();
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("m_seq", m_seq);
			map.put("some", s_seq);
			map.put("order", 1);
			map.put("where", "url_in");
			
			if(dday <= 3) {
				map.put("notice_seq", 3);
				if(memberService.preNotice(map) == 0) {
					NoticelistVO nvo = new NoticelistVO();
					nvo.setUrl_in(s_seq + ",-1");
					nvo.setNotice_seq(3);
					String[] ms = ((String)list.get(i).get("PARTNERLIST")).split(",");
					for(String m : ms) {
						nvo.setM_seq(Integer.parseInt(m));
						memberService.noticeInsert(nvo);
					}
				}
			}else if(dday <= 60 && dday >=7) {
				map.put("notice_seq", 4);
				if(memberService.preNotice(map) == 0) {
					NoticelistVO nvo = new NoticelistVO();
					nvo.setUrl_in(s_seq + ",-1");
					nvo.setNotice_seq(4);
					String[] ms = ((String)list.get(i).get("PARTNERLIST")).split(",");
					for(String m : ms) {
						nvo.setM_seq(Integer.parseInt(m));
						memberService.noticeInsert(nvo);
					}
				}
			}
		}
	}
		
	//////// url 추후에 넣기
	//쿠폰 만료 d-5
	public void couponBye(int m_seq) {
		NoticelistVO vo = new NoticelistVO();
		vo.setM_seq(m_seq);
		vo.setNotice_seq(1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_seq", m_seq);
		map.put("notice_seq", 1);
		map.put("order", 3);
		map.put("where", "content");
		map.put("cl_kind", 0);	//기본쿠폰
		
		map.put("c_kind", 0); //웰컴쿠폰
		int spare = 0;
		
		if(memberService.couponBye(map) != 0) {
			map.put("some", "웰");
			if(memberService.preNotice(map) == 0) {
				spare = memberService.spareDay(map);
				if(spare > 0) {
					vo.setContent(spare + ",웰컴 기프트");
					memberService.noticeInsert(vo);
				}
			}
		}
		
		map.put("c_kind", 1); //월 쿠폰
		if(memberService.couponBye(map) != 0) {
			Calendar ca = Calendar.getInstance();
			int month = ca.get(Calendar.MONTH)+1;
			map.put("some", month);
			if(memberService.preNotice(map)==0) {
				spare = memberService.spareDay(map);
				if(spare > 0) {
					vo.setContent(spare + "," + month + "월");
					memberService.noticeInsert(vo);
				}
			}
		}
	}	
	
}
