package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.ReportVO;

public class ReportDAO {

	private SqlSession sqlSession;
	
	public ReportDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//희지***********************************************************
	public int insert(ReportVO vo) {
		return sqlSession.insert("report.insert", vo);
	}
	
	
	
	//새미***********************************************************
	public List<Map<String, Object>> reviewReportList(Map<String, Object>map){
		return sqlSession.selectList("report.reviewReportList",map);
	}
	
	public int reportTotal(Map<String, Object> map){
		return sqlSession.selectOne("report.reportTotal",map);
				
	}
	
	public Map<String, Object> rvContent(int rv_seq){
		return sqlSession.selectOne("report.rvContent",rv_seq);
				
	}
	public Map<String, Object> rv_cmtContent(int rv_cmt_seq){
		return sqlSession.selectOne("report.rv_cmtContent",rv_cmt_seq);
				
	}
	
	public int rpUpdate(ReportVO rpvo) {
		return sqlSession.update("report.rpUpdate",rpvo);
	}


	//현지***********************************************************
	public int updateNo(int f_seq) {
		return sqlSession.update("report.updateNo", f_seq);
	}
	
	
	
}
