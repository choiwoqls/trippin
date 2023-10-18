package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.member.Report_CateVO;

public class Report_CateDAO {

	private SqlSession sqlSession;
	
	
	//희지*************************************************************
	public Report_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Report_CateVO> select(){
		return sqlSession.selectList("report_cate.report_cate");
	}
	
	
	
}
