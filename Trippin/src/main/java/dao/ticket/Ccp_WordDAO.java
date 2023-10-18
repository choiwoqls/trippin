package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.Ccp_WordVO;

public class Ccp_WordDAO {

	private SqlSession sqlSession;
	
	public Ccp_WordDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[희지]**************************************************************
	public List<Ccp_WordVO> ccp_word_use(int ticket_seq){
		return sqlSession.selectList("ccp_word.ccp_word_use", ticket_seq);
	}
	
	public Ccp_WordVO ccp_word_end(int ticket_seq){
		return sqlSession.selectOne("ccp_word.ccp_word_end", ticket_seq);
	}
	
	public List<Ccp_WordVO> ccp_word(int ticket_seq) {
		return sqlSession.selectList("ccp_word.ccp_word", ticket_seq);
	}
	
}
