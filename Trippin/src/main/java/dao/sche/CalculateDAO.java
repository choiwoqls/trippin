package dao.sche;

import org.apache.ibatis.session.SqlSession;

public class CalculateDAO {

	private SqlSession sqlSession;
	
	public CalculateDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
}
