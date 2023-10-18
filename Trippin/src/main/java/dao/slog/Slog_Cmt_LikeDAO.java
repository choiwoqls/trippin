package dao.slog;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Slog_Cmt_LikeVO;

public class Slog_Cmt_LikeDAO {
	
	private SqlSession sqlSession;
	
	public Slog_Cmt_LikeDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
	
	
	public Integer checkScLike(Slog_Cmt_LikeVO vo) {
		return sqlSession.selectOne("checkScLike", vo);
	}
	public int delScLike(int slog_cmt_like_seq) {
		return sqlSession.delete("delScLike", slog_cmt_like_seq);
	}
	public int newScLike(Slog_Cmt_LikeVO vo) {
		return sqlSession.insert("newScLike", vo);
	}

}
