package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.JjimVO;
import vo.ticket.TkjjimVO;

public class TkjjimDAO {
	
	private SqlSession sqlSession;
	
	public TkjjimDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insert(TkjjimVO vo) {
		return sqlSession.insert("tkjjim.insert", vo);
	}
	
	public int update(TkjjimVO vo) {
		return sqlSession.update("tkjjim.update", vo);
	}
	
	public int deleteTKJJIM(TkjjimVO vo) {
		return sqlSession.delete("tkjjim.deleteTKJJIM", vo);
	}
	
	public int countTKjjim(int ticket_seq) {
		return sqlSession.selectOne("tkjjim.countTKjjim", ticket_seq);
	}
	
	public List<TkjjimVO> myTKjjimlist(int m_seq){
		return sqlSession.selectList("tkjjim.myTKjjimlist", m_seq);
	}
	
	public TkjjimVO checkTKJJIM(TkjjimVO vo) {
		return sqlSession.selectOne("tkjjim.checkTKJJIM", vo);
	}
	
}
