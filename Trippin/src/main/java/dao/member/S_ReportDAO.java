package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.S_ReportVO;
import vo.slog.SlogVO;

public class S_ReportDAO {
	
	SqlSession sqlSession;
	
	public S_ReportDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Map<String, Object>> sreportList(Map<String, Object> map){
		return sqlSession.selectList("s_report.sreportList",map);
	}
	
	public int sreportTotal(Map<String, Object> map){
		return sqlSession.selectOne("s_report.sreportTotal",map);
	}
	
	public Map<String, Object> s_reportOne(int s_report_seq){
		
		return sqlSession.selectOne("s_report.s_reportOne",s_report_seq);
		
	}
	
	public Map<String, Object> s_report_cmtOne(int s_report_seq){
		
		return sqlSession.selectOne("s_report.s_report_cmtOne",s_report_seq);
		
	}
	
	public int spUpdate(S_ReportVO srvo) {
		return sqlSession.update("s_report.spUpdate",srvo);
	}
	public int sr_insert(S_ReportVO srvo) {
		return sqlSession.insert("s_report.sr_insert",srvo);
	}
	
	public int srSeq() {
		return sqlSession.selectOne("s_report.srSeq");
	}


}








