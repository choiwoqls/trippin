package dao.hotple;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.hotple.H_CateVO;

public class H_CateDAO {

	private SqlSession sqlSession;
	
	public H_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<H_CateVO> h_cate(){
		return sqlSession.selectList("h_cate.h_cate");
	}
	
}
