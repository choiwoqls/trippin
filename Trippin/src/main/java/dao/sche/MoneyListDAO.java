package dao.sche;

import org.apache.ibatis.session.SqlSession;

import vo.sche.MoneyListVO;

public class MoneyListDAO {
	
	private SqlSession sqlSession;
	
	public MoneyListDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Integer checkMNL(MoneyListVO vo) {
		return sqlSession.selectOne("checkMNL", vo);
	}
	
	public int newMoneyList(MoneyListVO vo) {
		return sqlSession.insert("newMoneyList", vo);
	}
	
	public int updateMNL(MoneyListVO vo) {
		return sqlSession.update("updateMNL", vo);
	}
	
	//2023-08-30
	public MoneyListVO zeroCheck(int moneylist_seq) {
		return sqlSession.selectOne("zeroCheck", moneylist_seq);
	}
	
	public int delMNL(int moneylist_seq) {
		return sqlSession.delete("delMNL", moneylist_seq);
	}
	
	public Integer MNLseq() {
		return sqlSession.selectOne("MNLseq");
	}
	

}
