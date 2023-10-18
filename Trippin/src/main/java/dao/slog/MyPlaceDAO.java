package dao.slog;

import org.apache.ibatis.session.SqlSession;

public class MyPlaceDAO {
	private SqlSession sqlSession;
	
	public MyPlaceDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
}
