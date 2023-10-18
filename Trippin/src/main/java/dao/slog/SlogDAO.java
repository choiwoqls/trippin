package dao.slog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.slog.SlogVO;

public class SlogDAO {
	
	private SqlSession sqlSession;
	
	public SlogDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	//[현지]**********************************************************
	public List<Map<String, Object>> m_SlogList(int m_seq){
		return sqlSession.selectList("slog.m_SlogList", m_seq);
	}
	
	
	public int slog_rpCnt(int m_seq) {
		return sqlSession.selectOne("slog.slog_rpCnt", m_seq);
	}
	
	
	//[새미]**********************************************************
	//여행기 숨김 
	public int HiddenSL(SlogVO slvo) {
		return sqlSession.update("slog.HiddenSL",slvo);
		
	}
	//여행기 숨김해제
	public int DefaultSL(SlogVO slvo) {
		return sqlSession.update("slog.DefaultSL",slvo);
		
	}
	//여행기 삭제
	public int deleteSL(int slog_seq) {
		return sqlSession.update("slog.deleteSL",slog_seq);
		
	}
	//여행기 삭제 시퀀스 뽑기
	public List<Map<String, Object>> slseqDelete(){
		return sqlSession.selectList("slog.slseqDelete");
	}
	//여행기 신고 점수 누적
	public int scoreSL(Map<String, Object> map) {
		return sqlSession.update("slog.scoreSL",map);
		
	}
	//여행기 신고 점수 리셋(부적격)
	public int scoreReset(int slog_seq) {
		return sqlSession.update("slog.scoreReset",slog_seq);
		
	}
	
	
	//[희지]**********************************************************
	public SlogVO slogSome(int slog_seq) {
		return sqlSession.selectOne("slog.slogSome", slog_seq);
	}
	   
	public Map<String, Object> slogCount(int slog_seq){
		return sqlSession.selectOne("slog.slogCount", slog_seq);
	}
			
	
	//[재빈]**********************************************************
	public SlogVO checkSlog(SlogVO vo){
		return sqlSession.selectOne("checkSlog", vo);
	}
	
	public int newSlog(SlogVO vo) {
		return sqlSession.insert("newSlog", vo);
	}
	
	public int slogSeq() {
		return sqlSession.selectOne("slogSeq");
	}
	
	public int delSlog(int slog_seq) {
		return sqlSession.delete("delSlog", slog_seq);
	}
	
	public Map<String, Object> slogInfo(int slog_seq){
		return sqlSession.selectOne("slogInfo", slog_seq);
	}
	
	public int reSlogTitle(SlogVO vo) {
		return sqlSession.update("reSlogTitle", vo);
	}
	
	public int reSlogIntro(SlogVO vo) {
		return sqlSession.update("reSlogIntro", vo);
	}
	
	public int reSlogImg(SlogVO vo) {
		return sqlSession.update("reSlogImg", vo);
	}

	public int changeStatus(SlogVO vo) {
		return sqlSession.update("changeStatus", vo);
	}
	
	/*2023-09-15*/
	
	public Map<String, Object> slogInfoPlus(int slog_seq){
		return sqlSession.selectOne("slogInfoPlus", slog_seq);
	}
	
	public List<Map<String, Object>> slogCmtList(int slog_seq){
		return sqlSession.selectList("slogCmtList", slog_seq);
	}
	
	/*2023-09-22*/
	
	public List<Map<String, Object>> slogList(){
		return sqlSession.selectList("slogList");
	}
	
	

}
