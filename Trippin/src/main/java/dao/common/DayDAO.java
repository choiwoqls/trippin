package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.DayVO;

public class DayDAO {

	private SqlSession sqlSession;
	
	public DayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<DayVO> day(){
		return sqlSession.selectList("day.day");
	}
	
}
