package dao.slog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Slog_LikeVO;

public class Slog_LikeDAO {
	
	private SqlSession sqlSession;
	
	public Slog_LikeDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}

	
	//[현지]*******************************************************************
	public int insert(Slog_LikeVO vo) {
		return sqlSession.insert("slog_like.insert", vo);
	}
	
	public int deleteSLike(Slog_LikeVO vo) {
		return sqlSession.delete("slog_like.deleteSLike", vo);
	}
	
	public int countSLike(int slog_seq) {
		return sqlSession.selectOne("slog_like.countSLike", slog_seq);
	}
	
	public List<Map<String, Object>> SLike_Mlist(int slog_seq){
		return sqlSession.selectList("slog_like.SLike_Mlist", slog_seq);
	}
	
	public Slog_LikeVO checkSLike(Slog_LikeVO vo) {
		return sqlSession.selectOne("slog_like.checkSLike", vo);
	}
	
	
	
}
