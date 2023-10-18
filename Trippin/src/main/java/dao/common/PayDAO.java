package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.PayVO;

public class PayDAO {

	private SqlSession sqlSession;
	
	public PayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<PayVO> pay(){
		return sqlSession.selectList("pay.pay");
	}
	
}
