package dao.sche;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.MyclistVO;

public class MyclistDAO {
	
	private SqlSession sqlSession;
	
	public MyclistDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	//새미**********************************************************
	public int myclistInsert(MyclistVO mcvo) {
		return sqlSession.insert("myclist.myclistInsert",mcvo);
	}
	
	public int myClistOneCnt(Map<String, Object> map) {
		return sqlSession.selectOne("myclist.myClistOne",map);
	}
	public int deleteMyclist(Map<String, Object> map) {
		return sqlSession.delete("myclist.deleteMyclist",map);
	}
	
}
