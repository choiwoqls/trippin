package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.Cancel_CateVO;

public class Cancel_CateDAO {

	private SqlSession sqlSession;
	
	public Cancel_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Cancel_CateVO> cancel_cate(){
		return sqlSession.selectList("cancel_cate.cancel_cate");
	}
	
}
