package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.Tip_KeywordVO;

public class Tip_KeywordDAO {

	private SqlSession sqlSession;
	
	public Tip_KeywordDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<String> tip_keyword(){
		return sqlSession.selectList("tip_keyword.tip_keyword");
	}
	
}
