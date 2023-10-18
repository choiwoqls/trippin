package dao.tour;

import org.apache.ibatis.session.SqlSession;

import vo.tour.TourVO;

public class TourDAO {

	private SqlSession sqlSession;
	
	
	public TourDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public String selectTerm(int f_seq) {
		return sqlSession.selectOne("tour.selectTerm", f_seq);
	}

	public int insert(TourVO vo) {
		return sqlSession.insert("tour.insert", vo);
	}
}
