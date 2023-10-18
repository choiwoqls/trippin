package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.Review_LikeVO;

public class Review_LikeDAO {

	private SqlSession sqlSession;
	
	public Review_LikeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[현지]****************************************************************************
	public int insert(Review_LikeVO vo) {
		return sqlSession.insert("rvl.insert", vo);
	}
	
	public int deleteRVL(Review_LikeVO vo) {
		return sqlSession.delete("rvl.deleteRVL", vo);
	}
	
	public int countRVL(int rv_seq) {
		return sqlSession.selectOne("rvl.countRVL", rv_seq);
	}
	
	public List<Map<String , Object>> RVL_Mlist(int rv_seq){
		return sqlSession.selectList("rvl.RVL_Mlist", rv_seq);
	}
	
	public Review_LikeVO checkRVL(Review_LikeVO vo) {
		return sqlSession.selectOne("rvl.checkRVL", vo);
	}
	
	
	
	//[희지]****************************************************************************
	public Map<String, Object> findReview(int rv_seq){
		return sqlSession.selectOne("rvl.findReview", rv_seq);
	}
	
	
	
	
	
}
