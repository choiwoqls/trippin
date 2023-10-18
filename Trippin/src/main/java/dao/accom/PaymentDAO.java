package dao.accom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.accom.PaymentVO;

public class PaymentDAO {
	private SqlSession sqlSession;
	
	public PaymentDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public List<PaymentVO> accomPayList(int m_seq){
		return sqlSession.selectList("payment.accomPayList",m_seq);
	}
	
	public Map<String, Object> accomPaymentOne(int purchase_no){
		return sqlSession.selectOne("payment.accomPaymentOne",purchase_no);
		
	}

}
