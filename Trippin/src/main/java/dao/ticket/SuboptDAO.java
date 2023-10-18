package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.SuboptVO;

public class SuboptDAO {

	private SqlSession sqlSession;
	
	public SuboptDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//[희지]**************************************************************
	public List<SuboptVO> oneSubopt(int opt_seq){
		return sqlSession.selectList("subopt.oneSubopt", opt_seq);
	}
	
}
