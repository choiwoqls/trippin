package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.Ticket_CateVO;

public class Ticket_CateDAO {
	
	private SqlSession sqlSession;
	
	
	public Ticket_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(Ticket_CateVO vo) {
		return sqlSession.insert("tc.insert", vo);
	}
	
	public int update(Ticket_CateVO vo) {
		return sqlSession.update("tc.update", vo);
	}
	
	public int deleteTC(int ticket_cate_seq) {
		return sqlSession.delete("tc.deleteTC", ticket_cate_seq);
	}
	
	public List<Ticket_CateVO> tclist(){
		return sqlSession.selectList("tc.selectTClist");
	}
	
	public String tkcateName(int ticket_cate_seq) {
		return sqlSession.selectOne("tc.tkcateName", ticket_cate_seq);
	}
	
}
