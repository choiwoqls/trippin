package dao.member;

import org.apache.ibatis.session.SqlSession;

public class PointDAO {
	
	private SqlSession sqlSession;
	
	public PointDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public String point(String p_table) {
		return sqlSession.selectOne("point.point", p_table);
	}
	
	public int point_seq(String p_table) {
		return sqlSession.selectOne("point.p_seq", p_table);
	}


}
