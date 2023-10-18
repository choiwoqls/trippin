package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.CancelVO;

public class CancelDAO {

	private SqlSession sqlSession;
	
	public CancelDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//[희지]*****************************************************************************
	public int cancelInsert(CancelVO vo) {
		return sqlSession.insert("cancel.insert", vo);
	}
	
	public Integer cancelStatus(CancelVO vo) {
		return sqlSession.selectOne("cancel.cancelStatus", vo);
	}
	
	public List<Map<String, Object>> cancelList(Map<String, Object> map){
		return sqlSession.selectList("cancel.cancelList", map);
	}
	
	public int cancelCount(Map<String, Object> map) {
		return sqlSession.selectOne("cancel.cancelCount", map);
	}
	
	public CancelVO cancel(CancelVO vo) {
		return sqlSession.selectOne("cancel.cancel", vo);
	}
	
	public int cancelFinish(int cancel_seq) {
		return sqlSession.update("cancel.cancelFinish", cancel_seq);
	}
}
