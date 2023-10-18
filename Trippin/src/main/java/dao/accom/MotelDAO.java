package dao.accom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class MotelDAO {
	
	private SqlSession sqlSession;
	
	public MotelDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//모텔 전체 리스트
	public List<Map<String, Object>> selectMlist(){
		return sqlSession.selectList("accom.selectMlist");
	}
	
	//모텔 selectOne
	public Map<String, Object> selectMot(int f_seq){
		return sqlSession.selectOne("accom.selectMot", f_seq);
	}
	
	//모텔 selectList
	public List<Map<String, Object>> selectRoom(int f_seq){
		return sqlSession.selectList("accom.selectRoom", f_seq);
	}
	
}
