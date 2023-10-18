package dao.common;

import org.apache.ibatis.session.SqlSession;

public class Hours_CateDAO {

	private SqlSession sqlSession;
	
	public Hours_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
