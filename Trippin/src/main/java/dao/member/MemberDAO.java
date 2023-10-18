package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.Addr1VO;
import vo.member.MemberVO;
import vo.slog.SlogVO;

public class MemberDAO {

	private SqlSession sqlSession;
	
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//[현지]**************************************************************
	public int insert(MemberVO vo) {
		return sqlSession.insert("member.insert", vo);
	}
	
	public String checkEmail(String m_email) {
		return sqlSession.selectOne("member.checkEmail", m_email);
	}
	
	public int checkLogin(MemberVO vo) {
		int m_seq = 0;
		try {
			m_seq = sqlSession.selectOne("member.checkLogin", vo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		return m_seq;
	}
	
	public String getM_nickname(int m_seq) {
		return sqlSession.selectOne("member.getM_nickname", m_seq);
	}
	
	public MemberVO mypage(int m_seq) {
		return sqlSession.selectOne("member.mypage", m_seq);
	}
	
	public int updatePw(MemberVO vo) {
		return sqlSession.update("member.updatePw", vo);
	}
	
	public int updateProfile(MemberVO vo) {
		return sqlSession.update("member.updateProfile", vo);
	}
	
	public int nowM_Seq() {
		return sqlSession.selectOne("member.nowM_Seq");
	}
	
	public Map<String , Object> m_info(int m_seq){
		return sqlSession.selectOne("member.m_info", m_seq);
	}
	
	public List<Map<String, Object>> rv_a1list(int m_seq){
		return sqlSession.selectList("member.rv_a1list", m_seq);
	}
	
	public List<Addr1VO> slog_a1list(SlogVO vo){
		return sqlSession.selectList("member.slog_a1list", vo);
	}
	
	public String selectM_email(int m_seq) {
		return sqlSession.selectOne("member.selectM_email", m_seq);
	}
	
	public int selectM_seq2(String m_code) {
		return sqlSession.selectOne("member.selectM_seq2", m_code);
	}
	
//	public int selectM_seq2(Map<String, Object> map) {
//		return sqlSession.selectOne("member.selectM_seq2", map);
//	}
	
	public int inputRecom_code(MemberVO vo) {
		return sqlSession.update("member.inputRecom_code", vo);
	}
	
	

	
	//[새미]**************************************************************
	public MemberVO getMember(int m_seq) {
		return sqlSession.selectOne("member.getMember", m_seq);
	}
	
	public int updateScore(int m_report_seq) {
		return sqlSession.update("member.updateScore",m_report_seq);
	}
	public int minUpScore(int m_report_seq) {
		return sqlSession.update("member.minUpScore",m_report_seq);
	}
	
	public int deleteMember() {
		return sqlSession.update("member.deleteMember");
	}
	
	public List<MemberVO> memberList(Map<String, Object> map){
		return sqlSession.selectList("member.memberList",map);
	}
	
	public int memberTotal(Map<String, Object> map){
		return sqlSession.selectOne("member.memberTotal",map);
	}
		
	public Map<String, Object> detailMember(int m_seq){
		return sqlSession.selectOne("member.detailMember",m_seq);
	}
	
	
	
	//[재빈]**************************************************************
	public MemberVO mInfo(int m_seq) {
		return sqlSession.selectOne("mInfo", m_seq);
	}
	
	
	//[희지]**************************************************************
	public int myLevel(int m_seq) {
		return sqlSession.selectOne("member.myLevel", m_seq);
	}
	
	public int levelUp(MemberVO vo) {
		return sqlSession.update("member.levelUp", vo);
	}
}
