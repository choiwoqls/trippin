package dao.ticket;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.T_ReserverVO;


public class T_ReserverDAO {

	private SqlSession sqlSession;
	
	public T_ReserverDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//[희지]***********************************************************
	public T_ReserverVO oneInfo(int m_seq) {
		return sqlSession.selectOne("t_reserver.oneInfo", m_seq);
	}

	public int reserveInsert(T_ReserverVO vo) {
		return sqlSession.insert("t_reserver.insert", vo);
	}
	
	public int reserveUpdate(T_ReserverVO vo) {
		return sqlSession.update("t_reserver.update", vo);
	}
	
	
	
	//[새미]***********************************************************
	public T_ReserverVO t_reserverOne(int m_seq) {
		return sqlSession.selectOne("t_reserver.t_reserverOne",m_seq);
	}
	
}
