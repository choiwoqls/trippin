package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.OptVO;

public class OptDAO {

	private SqlSession sqlSession;
	
	public OptDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[희지]**************************************************************
	public List<OptVO> oneOpt(int ticket_seq){
		return sqlSession.selectList("opt.oneOpt", ticket_seq);
	}
	
	public String optName(int seq) {
		return sqlSession.selectOne("opt.optName", seq);
	}
	
}
