package dao.slog;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Slog_AddVO;

public class Slog_AddDAO {
	
	private SqlSession sqlSession;
	
	public Slog_AddDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
	
	
	public Integer slogAddCheck(Slog_AddVO vo) {
		return sqlSession.selectOne("slogAddCheck", vo);
	}
	
	public int newSlogAdd(Slog_AddVO vo) {
		return sqlSession.insert("newSlogAdd", vo);
	}


}
