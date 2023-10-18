package service.login;

import dao.member.MemberDAO;
import vo.member.MemberVO;

public class LoginService {

	private MemberDAO memberDao;
	
	public LoginService(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	
	
	public int insert(MemberVO vo) {
		return memberDao.insert(vo);
	}
	
	public String checkEmail(String m_email) {
		return memberDao.checkEmail(m_email);
	}
	
	public int checkLogin(MemberVO vo) {
		return memberDao.checkLogin(vo);
	}
	
	public String getM_nickname(int m_seq) {
		return memberDao.getM_nickname(m_seq);
	}
	
	
	
	
}
