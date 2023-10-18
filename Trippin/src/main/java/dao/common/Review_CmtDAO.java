package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.Review_CmtVO;

public class Review_CmtDAO {
	
	private SqlSession sqlSession;
	
	public Review_CmtDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//현지*****************************************************************
	public int insert(Review_CmtVO vo) {
		return sqlSession.insert("rc.insert", vo);
	}
	
	public int updateRC(Review_CmtVO vo) {
		return sqlSession.update("rc.updateRC", vo);
	}
	
	public int deleteRC(int rv_cmt_seq) {
		return sqlSession.delete("rc.deleteRC", rv_cmt_seq);
	}
	
	public int nowRv_cmt_seq() {
		return sqlSession.selectOne("rc.nowRv_cmt_seq");
	}
	
	public List<Map<String, Object>> selectRClist(int rv_seq){
		return sqlSession.selectList("rc.selectRClist", rv_seq);
	}
	
	
	//새미*****************************************************************
	public int scoreRVC(Map<String, Object> map) {
		return sqlSession.update("rc.scoreRVC", map);
	}
	
	
	public int HiddenRVC(Review_CmtVO vo) {
		return sqlSession.update("rc.HiddenRVC", vo);
	}//이것만 AdminService에 적음. 나머지는 MemberService
	
	public int deleteRVC() {
		return sqlSession.delete("rc.deleteRVC");
	}

	public int defaultRVC(Review_CmtVO vo) {
		return sqlSession.update("rc.defaultRVC", vo);
	}
	
	public int scoreResetRVC(int rv_cmt_seq) {
		return sqlSession.update("rc.scoreResetRVC", rv_cmt_seq);
	}

	public List<Map<String, Object>> rvcOne(Map<String, Object> map) {
		return sqlSession.selectList("rc.rvcOne",map);
	}
	
	public int rvcOneTotal(Map<String, Object> map) {
		return sqlSession.selectOne("rc.rvcOneTotal",map);
	}
	
	
	
}
