package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.MypointVO;

public class MypointDAO {
	
	SqlSession sqlSession;
	
	public MypointDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public int pointInsert(MypointVO vo) {
		return sqlSession.insert("mypoint.insert", vo);
	}
	
	public int rvPoint(MypointVO vo) {
		return sqlSession.selectOne("mypoint.rvPoint", vo);
	}
	
	public int pointCount(Map<String, Object> map) {
		return sqlSession.selectOne("mypoint.pointCount", map);
	}
	
	public List<Map<String, Object>> mypoint (int m_seq){
		return sqlSession.selectList("mypoint.mypoint", m_seq);
	}
	
	public int point(int m_seq) {
		return sqlSession.selectOne("mypoint.point", m_seq);
	}
	
}
