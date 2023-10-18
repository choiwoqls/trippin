package dao.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.T_PurchaseVO;

public class T_PurchaseDAO {

	private SqlSession sqlSession;
	
	public T_PurchaseDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//[희지]********************************************************
	public int purchaseInsert(T_PurchaseVO vo) {
		return sqlSession.insert("t_purchase.insert", vo);
	}
	
	public  int cashSeqInsert(T_PurchaseVO vo) {
		return sqlSession.update("t_purchase.cashSeqInsert", vo);
	}
	
	public int purchaseSeq() {
		return sqlSession.selectOne("t_purchase.maxSeq");
	}
	
	public Map<String, Object> myTicket(int t_purchase_seq) {
		return sqlSession.selectOne("t_purchase.myTicket", t_purchase_seq);
	}
	
	public T_PurchaseVO ticket_seq(int t_purchase_seq) {
		return sqlSession.selectOne("t_purchase.ticket_seq", t_purchase_seq);
	}
	
	public int returnCancle(int t_purchase_seq) {
		return sqlSession.update("t_purchase.returnCancle", t_purchase_seq);
	}
	
	public List<Integer> endPurchaseSeq(){
		return sqlSession.selectList("t_purchase.endPurchaseSeq");
	}
	
	public int endPurchase() {
		return sqlSession.update("t_purchase.endPurchase");
	}
	
	public List<Map<String, Object>> ticketList(Map<String, Object> map){
		return sqlSession.selectList("t_purchase.ticketList", map);
	}
	
	public Map<String, Object> ticketOne(int t_purchase_seq){
		return sqlSession.selectOne("t_purchase.ticketOne", t_purchase_seq);
	}
	
	public int ticketCount(Map<String, Object> map) {
		return sqlSession.selectOne("t_purchase.ticketCount", map);
	}
	
	
	
	//[새미]********************************************************
	public List<T_PurchaseVO> t_purchaseList(int m_seq) {
		return sqlSession.selectList("t_purchase.t_purchaseList", m_seq);
	}

	public T_PurchaseVO t_purchaseOne(int purchase_no) {
		return sqlSession.selectOne("t_purchase.t_purchaseOne", purchase_no);
	}
	
	public T_PurchaseVO t_purchase(int purchase_no) {
		return sqlSession.selectOne("t_purchase.t_purchase", purchase_no);
	}

	
	
	
	
	
}
