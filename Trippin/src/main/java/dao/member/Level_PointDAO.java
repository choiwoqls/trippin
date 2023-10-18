package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.member.Level_PointVO;


public class Level_PointDAO {

	private SqlSession sqlSession;
	
	public Level_PointDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Level_PointVO> level_point(){
		return sqlSession.selectList("lp.level_point");
	}
	
	public int whichLevel(int m_seq) {
		return sqlSession.selectOne("lp.whichLevel", m_seq);
	}
	
}
