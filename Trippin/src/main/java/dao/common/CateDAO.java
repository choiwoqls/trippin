package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.CateVO;

public class CateDAO {

	private SqlSession sqlSession;
	
	public CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//재빈
	//2023-08-14
	public List<CateVO> cateList(){
		return sqlSession.selectList("cate.cateList");
	}
	
}
