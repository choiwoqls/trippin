package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.Cost_DetailsVO;

public class Cost_DetailsDAO {
	
	private SqlSession sqlSession;
	
	public Cost_DetailsDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}

	public int newCostDetails(Cost_DetailsVO vo) {
		return sqlSession.insert("newCostDetails", vo);
	}
	
	public int costDetailsSeq() {
		return sqlSession.selectOne("costDetailsSeq");
	}
	
	public int delCD(int cost_details_seq) {
		return sqlSession.delete("delCD", cost_details_seq);
	}
	
	public List<Integer> cdMList(Map<String, Object> map){
		return sqlSession.selectList("cdMList", map);
	}
	
	public int delCostDetails(int cost_seq) {
		return sqlSession.delete("delCostDetails", cost_seq);
	}
	
}
