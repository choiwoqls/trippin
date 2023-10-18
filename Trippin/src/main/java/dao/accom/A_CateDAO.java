package dao.accom;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.accom.A_CateVO;

public class A_CateDAO {

	private SqlSession sqlSession;
	
	public A_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<A_CateVO> a_cate(){
		return sqlSession.selectList("a_cate.a_cate");
	}
	
}
