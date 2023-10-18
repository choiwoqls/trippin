package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.M_ReportVO;

public class M_ReportDAO {

	private SqlSession sqlSession;
	
	
	public M_ReportDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//희지**********************************************************
	public int insert(M_ReportVO vo) {
		return sqlSession.insert("m_report.insert", vo);
	}
	
	
	
	//새미**********************************************************
	public List<M_ReportVO> mReportLsit(Map<String, Object>map){	
		return sqlSession.selectList("m_report.mReportLsit",map);
	}
	
	public int mlistTotal(Map<String, Object>map){	
		return sqlSession.selectOne("m_report.mlistTotal",map);
	}
	public int mrpUpResult(M_ReportVO mrpvo) {
		return sqlSession.update("m_report.mrpUpResult",mrpvo);
	}
	
	public int mrpUpMemo(M_ReportVO mrpvo) {
		return sqlSession.update("m_report.mrpUpMemo",mrpvo);
	}
	
	public Map<String, Object> m_reportOne(Map<String, Object> map){
		return sqlSession.selectOne("m_report.m_reportOne",map);
		
	}

	
	
	
	
	
	
}
