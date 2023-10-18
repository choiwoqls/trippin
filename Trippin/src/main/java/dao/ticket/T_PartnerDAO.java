package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.T_PartnerVO;

public class T_PartnerDAO {
	
	private SqlSession sqlSession;
	
	public T_PartnerDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insert(T_PartnerVO vo) {
		return sqlSession.insert("t_ptn.insert", vo);
	}
	
	public int update(T_PartnerVO vo) {
		return sqlSession.update("t_ptn.update", vo);
	}
	
	public int deletePTN(int t_partner_seq) {
		return sqlSession.delete("t_ptn.deletePTN", t_partner_seq);
	}
	
	public List<T_PartnerVO> ptnlist(){
		return sqlSession.selectList("t_ptn.selectPTNlist");
	}
	
}
