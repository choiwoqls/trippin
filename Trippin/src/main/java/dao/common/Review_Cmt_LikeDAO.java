package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.Review_CmtVO;
import vo.common.Review_Cmt_LikeVO;

public class Review_Cmt_LikeDAO {
	
	private SqlSession sqlSession;
	
	public Review_Cmt_LikeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//[현지]****************************************************************************
	public int insert(Review_Cmt_LikeVO vo) {
		return sqlSession.insert("rcl.insert", vo);
	}
	
	public int deleteRCL(Review_Cmt_LikeVO vo) {
		return sqlSession.delete("rcl.deleteRCL", vo);
	}
	
	public int countRCL(int rv_cmt_seq) {
		return sqlSession.selectOne("rcl.countRCL", rv_cmt_seq);
	}
	
	public List<Map<String , Object>> RCL_Mlist(int rv_cmt_seq){
		return sqlSession.selectList("rcl.RCL_Mlist", rv_cmt_seq);
	}
	
	public Review_Cmt_LikeVO checkRCL(Review_Cmt_LikeVO vo) {
		return sqlSession.selectOne("rcl.checkRCL", vo);
	}
	
	
	
	//[희지]****************************************************************************
	public Review_CmtVO rv_seq(Review_Cmt_LikeVO vo) {
		return sqlSession.selectOne("rcl.rv_seq", vo);
	}
	
	
	
	
	
	
}
