package dao.sche;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.sche.StyleVO;

public class StyleDAO {
	
	private SqlSession sqlSession;
	
	public StyleDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	
	//[재빈]***********************************************************
	public List<StyleVO> styleList(){
		return sqlSession.selectList("styleList");
	}
	
	
	//[현지]***********************************************************
	public String selectWhat(int style_seq) {
		return sqlSession.selectOne("style.selectWhat", style_seq);
	}
	

}
