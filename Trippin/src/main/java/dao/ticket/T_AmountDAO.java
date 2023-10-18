package dao.ticket;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.T_AmountVO;

public class T_AmountDAO {

	private SqlSession sqlSession;
	
	public T_AmountDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[희지]**************************************************************
	public int insert(T_AmountVO vo) {
		return sqlSession.insert("t_amount.insert", vo);
	}
	
	public int maxSeq() {
		return sqlSession.selectOne("t_amount.maxSeq");
	}
	
	public T_AmountVO pickList(int t_amount_seq) {
		return sqlSession.selectOne("t_amount.pickList", t_amount_seq);
	}
	
}
