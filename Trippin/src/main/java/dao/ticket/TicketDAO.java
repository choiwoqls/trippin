package dao.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.TicketVO;

public class TicketDAO {
	
	private SqlSession sqlSession;
	
	public TicketDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//현지****************************************************************
	public int insert(TicketVO vo) {
		return sqlSession.insert("ticket.insert", vo);
	}
	
	public int updateTK(TicketVO vo) {
		return sqlSession.update("ticket.updateTK", vo);
	}
	
	public int nowTicket_seq() {
		return sqlSession.selectOne("ticket.nowTicket_seq");
	}
	
	public List<String> TcateNames(int ticket_seq){
		return sqlSession.selectList("ticket.TcateNames", ticket_seq);
	}
	
	public List<Map<String, Object>> ticketList(){
		return sqlSession.selectList("ticket.ticketList");
	}
	
	public int ticketCnt() {
		return sqlSession.selectOne("ticket.ticketCnt");
	}
	
	public TicketVO selectTK(int ticket_seq) {
		return sqlSession.selectOne("ticket.selectTK", ticket_seq);
	}
	
	public List<Map<String, Object>> tkList(Map<String, Object> map){
		return sqlSession.selectList("ticket.tkList", map);
	}
	
	public int tkCNT() {
		return sqlSession.selectOne("ticket.tkCNT");
	}
	
	public Map<String, Object> selectTK_m(int ticket_seq){
		return sqlSession.selectOne("ticket.selectTK_m", ticket_seq);
	}
	
	public List<Map<String, Object>> selectCCP(int ticket_seq){
		return sqlSession.selectList("ticket.selectCCP", ticket_seq);
	}
	
	
	
	
	//희지****************************************************************
	public TicketVO valid(int ticket_seq) {
		return sqlSession.selectOne("ticket.valid", ticket_seq);
	}
	
	public String ticketName(int ticket_seq) {
		return sqlSession.selectOne("ticket.ticketName", ticket_seq);
	}
	
	public int cancel_status(int ticket_seq) {
		return sqlSession.selectOne("ticket.cancel_status", ticket_seq);
	}
	
	
	
}
