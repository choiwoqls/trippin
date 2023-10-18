package dao.tour;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.tour.Tour_CateVO;

public class Tour_CateDAO {
	
	private SqlSession sqlSession;
	
	public Tour_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Tour_CateVO> selectT_Cate(){
		return sqlSession.selectList("tour_cate.selectT_Cate");
	}
}
