package dao.common;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.RefundVO;

public class RefundDAO {

	private SqlSession sqlSession;
	
	public RefundDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int refundInsert(RefundVO vo) {
		return sqlSession.insert("refund.insert", vo);
	}
	
	public RefundVO refund(int cancel_seq) {
		return sqlSession.selectOne("refund.refund", cancel_seq);
	}
	
	public Map<String, Object> refundDetail(Map<String, Object> map){
		return sqlSession.selectOne("refund.refundDetail", map);
	}
}
