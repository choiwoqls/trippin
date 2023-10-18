package dao.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ticket.Include_ItemsVO;

public class Include_ItemsDAO {

	private SqlSession sqlSession;
	
	public Include_ItemsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insert(Include_ItemsVO vo) {
		return sqlSession.insert("incl_itms.insert", vo);
	}
	
	public int update(Include_ItemsVO vo) {
		return sqlSession.update("incl_itms.update", vo);
	}
	
	public int deleteInclItms(int include_items_seq) {
		return sqlSession.delete("incl_itms.deleteInclItms", include_items_seq);
	}
	
	public List<Include_ItemsVO> inclItmsList(){
		return sqlSession.selectList("incl_itms.selectInclItmsList");
	}
}
