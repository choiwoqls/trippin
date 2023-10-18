package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.ScheVO;


public class ScheDAO {
	
	private SqlSession sqlSession;
	
	public ScheDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	
	//[재빈]*********************************************************************
	//회원 일정 날짜 리스트
	public List<ScheVO> m_Sche_Day(int receiver_seq){
		return sqlSession.selectList("m_sche_day", receiver_seq);
	}

	//시퀀스
	public int sche_seq() {
		return sqlSession.selectOne("sche_seq");
	}
	
	//새로운 일정 데이터
	public int newSche(ScheVO vo) {
		return sqlSession.insert("newSche", vo);
	}
	
	//일정 정보
	public Map<String, Object> scheInfo(int s_seq) {
		return sqlSession.selectOne("scheInfo", s_seq);
	}
	
	//일정 데이터 삭제
	public int delSche(int s_seq) {
		return sqlSession.delete("delSche", s_seq);
	}
	
	//일정 제목 수정
	public int reTitle(ScheVO vo) {
		return sqlSession.update("reTitle", vo);
	}
	
	//일정 파트너리스트 출력
	public String selectPartner(int s_seq) {
		return sqlSession.selectOne("selectPartner", s_seq);
	}
	
	//일정 파트너리스트 수정
	public int rePartner(ScheVO vo) {
		return sqlSession.update("rePartner", vo);
	}
	
	//회원 일정 리스트
	public List<Map<String, Object>> mScheList(int m_seq){
		return sqlSession.selectList("mScheList", m_seq);
	}

	//2023-08-16
	public int scheDay(int s_seq) {
		return sqlSession.selectOne("scheDay", s_seq);
	}
	
	public Map<String, Object> schedy(Map<String, Object> map){
		return sqlSession.selectOne("schedy", map);
		
	}
	
	//2023-08-30
	public List<Map<String, Object>> lastSche(int m_seq){
		return sqlSession.selectList("lastSche", m_seq);
	}
	
	
	//[새미]**********************************************************
	public ScheVO schSelectOne(int s_seq) {
		return sqlSession.selectOne("sche.schSelectOne",s_seq);
	}
	
	

	//[현지]**********************************************************
	public Map<String, Object> fromScheToSlog(int s_seq) {
		return sqlSession.selectOne("sche.fromScheToSlog", s_seq);
	}
	
	
	
	//[희지]**********************************************************
	// 여행 제목 가져오기
	public String scheTitle(int s_seq) {
		return sqlSession.selectOne("sche.scheTitle", s_seq);
	}
	
	// 완료되지 않은 여행 정보
	public List<Map<String, Object>> myIngSche(int m_seq){
		return sqlSession.selectList("sche.myIngSche", m_seq);
	}
	
	
}
