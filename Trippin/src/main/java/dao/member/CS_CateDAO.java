package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.member.CS_CateVO;

public class CS_CateDAO {
	
	private SqlSession sqlSession;
	
	public CS_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public List<CS_CateVO> csCateAll(){
		return sqlSession.selectList("cs_cate.all");
	}
	
	
	
}
