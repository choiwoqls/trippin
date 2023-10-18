package dao.member;

import org.apache.ibatis.session.SqlSession;

import vo.member.M_ReportVO;

public class CashDAO {

	private SqlSession sqlSession;
	
	public CashDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int percent(int kind) {
		return sqlSession.selectOne("cash.percent", kind);
	}
}
