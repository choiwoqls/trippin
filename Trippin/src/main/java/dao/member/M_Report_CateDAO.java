package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.member.M_Report_CateVO;

public class M_Report_CateDAO {

	private SqlSession sqlSession;
	
	
	public M_Report_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	//희지***********************************************************************
	public List<M_Report_CateVO> select(){
		return sqlSession.selectList("m_report_cate.m_report_cate");
	}
	
	
	//새미***********************************************************************
	public List<M_Report_CateVO> mRepCtName(){
		return sqlSession.selectList("m_report_cate.mRepCtName");
	}
	
	
	
	
	
	
	
	
}
