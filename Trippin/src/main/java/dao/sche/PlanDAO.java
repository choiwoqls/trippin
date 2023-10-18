package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.PlanVO;

public class PlanDAO {
	
	private SqlSession sqlSession;
	
	public PlanDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	//세부 일정 마지막 순서
	public int planLastNum(PlanVO vo) {
		return sqlSession.selectOne("planLastNum", vo);
	}
	
	//세부일정 추가
	public int newPlan(PlanVO vo) {
		return sqlSession.insert("newPlan", vo);
	}
	
	//일정 세부일정 리스트(day별)
	public List<Map<String, Object>> schePlanList(Map<String, Object> map){
		return sqlSession.selectList("schePlanList", map);
	}
	
	//세부일정 메모추가
	public int updateMemo(PlanVO vo) {
		return sqlSession.update("updateMemo", vo);
	}
	
	//세부일정 시간 추가
	public int updateTime(PlanVO vo) {
		return sqlSession.update("updateTime", vo);
	}
	
	//세부일정 메모 시간 추출
	public PlanVO planMT(int plan_seq) {
		return sqlSession.selectOne("planMT", plan_seq);
	}
	
	//세부일정 삭제
	public int delPlan(int plan_seq) {
		return sqlSession.delete("delPlan", plan_seq);
	}
	
	//2023-08-15
	public int newMemo(PlanVO vo) {
		return sqlSession.insert("newMemo", vo);
	}
	
	//2023-09-04
	public Integer planCnt(int s_seq) {
		return sqlSession.selectOne("planCnt", s_seq);
	}
	
	//2023-09-05
	public List<Map<String, Object>> slogPlan(Map<String, Object> map){
		return sqlSession.selectList("slogPlan", map);
	}
	
	//2023-09-18
	public int delDayPlan(PlanVO vo){
		return sqlSession.delete("delDayPlan", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
