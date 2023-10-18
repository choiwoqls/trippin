package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.ReviewVO;

public class ReviewDAO {

	private SqlSession sqlSession;
	
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[현지]*******************************************************************
	public int insert(ReviewVO vo) {
		return sqlSession.insert("review.insert", vo);
	}
	
	public int updateRV(ReviewVO vo) {
		return sqlSession.update("review.updateRV", vo);
	}
	
	public int deleteMyRV(int rv_seq) {
		return sqlSession.delete("review.deleteMyRV", rv_seq);
	}
	
	public String selectRVImg(int rv_seq) {
		return sqlSession.selectOne("review.selectRVImg", rv_seq);
	}
	
//	public int getM_seq(int rv_seq) {
//		return sqlSession.selectOne("review.getM_seq", rv_seq);
//	}
	
	public int nowRV_Seq() {
		return sqlSession.selectOne("review.nowRV_Seq");
	}
	
	public int RVcntForOne(int f_seq) {
		return sqlSession.selectOne("review.RVcntForOne", f_seq);
	}
	
	public List<Map<String , Object>> selectRVList(Map<String, Object> map){
		return sqlSession.selectList("review.selectRVList", map);
	}
	
	public Map<String, Object> selectRV(int rv_seq){
		return sqlSession.selectOne("review.selectRV", rv_seq);
	}
	
	public List<Map<String, Object>> m_RVlist(int m_seq){
		return sqlSession.selectList("review.m_RVlist", m_seq);
	}
	
	public int rpCnt(int m_seq) {
		return sqlSession.selectOne("review.rpCnt", m_seq);
	}
	
	
	
	//[새미]*******************************************************************
	public int HiddenRV(ReviewVO vo) {
		return sqlSession.update("review.HiddenRV", vo);
	}
	
	public int defaultRV(ReviewVO vo) {
		return sqlSession.update("review.defaultRV", vo);
	}
	
	public int deleteRV(int rv_seq) {
		return sqlSession.delete("review.deleteRV", rv_seq);
	}
	public List<Map<String, Object>> rv_seqDelete(){
		return sqlSession.selectList("review.rv_seqDelete");
	}
	public int scoreRV(Map<String, Object> map) {
		return sqlSession.update("review.scoreRV", map);
	}
	
	public int scoreReset(int rv_seq) {
		return sqlSession.update("review.scoreReset", rv_seq);
	}
	
	
	
	//[희지]*******************************************************************
	public Map<String, Object> rv_someInfo(int rv_seq){
		return sqlSession.selectOne("review.someInfo", rv_seq);
	}
	
	public int whoRv(int rv_seq) {
		return sqlSession.selectOne("review.whoRv", rv_seq);
	}
	
	
	
	
	
}
