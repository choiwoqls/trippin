package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.CostVO;

public class CostDAO {

	private SqlSession sqlSession;
	
	public CostDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public int costSeq() {
		return sqlSession.selectOne("costSeq");
	}
	
	//2023-08-16
	public List<Map<String, Object>> dayCostList(Map<String, Object> map){
		return sqlSession.selectList("dayCostList", map);
	}
	

	//2023-08-17
	public List<Map<String, Object>> dayCostAlone(Map<String, Object> map){
		return sqlSession.selectList("dayCostAlone", map);
	}

	public Integer totMoney(Map<String, Object> map) {
		return sqlSession.selectOne("totMoney", map);
	}
	
	public Integer totMoneyAlone(Map<String, Object> map) {
		return sqlSession.selectOne("totMoneyAlone", map);
	}
	
	public Integer totDayMoney(Map<String, Object> map) {
		return sqlSession.selectOne("totDayMoney", map);
	}
	
	public Integer totDayMoneyAlone(Map<String, Object> map) {
		return sqlSession.selectOne("totDayMoneyAlone", map);
	}

	//2023-08-18
	public Integer costDayNum(Map<String, Object> map) {
		return sqlSession.selectOne("costDayNum", map);
	}
	
	public int insertCost(CostVO vo) {
		return sqlSession.insert("insertCost", vo);
	}
	
	public int delCost(int cost_seq) {
		return sqlSession.delete("delCost", cost_seq);
	}
	
	//2023-08-23
	public CostVO costInfo(int cost_seq) {
		return sqlSession.selectOne("costInfo", cost_seq);
	}
	
	public List<Map<String, Object>> reCostMList(Map<String, Object> map){
		return sqlSession.selectList("reCostMList", map);
	}
	
	public int reCost(CostVO vo) {
		return sqlSession.update("reCost", vo);
	}

	public Integer fMoney(int cost_seq) {
		return sqlSession.selectOne("fmoney", cost_seq);
	}

	//2023-08-29
	public List<Map<String, Object> > kindPer(int s_seq){
		return sqlSession.selectList("kindPer", s_seq);
	}
	
	public Integer maxKind(int s_seq) {
		return sqlSession.selectOne("maxKind", s_seq);
	}
	
	public String sumMon(int s_seq) {
		return sqlSession.selectOne("sumMon", s_seq);
	}
	
	//2023-08-30
	public List<Map<String, Object>> kindDetail(Map<String, Object> map){
		return sqlSession.selectList("kindDetail", map);
	}
	
	public String kindTM(Map<String, Object>map) {
		return sqlSession.selectOne("kindTM", map);
	}
	
	public List<Integer> ckList(int s_seq) {
		return sqlSession.selectList("ckList", s_seq);
	}
	
	public List<Map<String, Object>> calculateList(int s_seq){
		return sqlSession.selectList("calculateList", s_seq);
	}
	
	
	
	
}
