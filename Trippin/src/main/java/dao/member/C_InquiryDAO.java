package dao.member;

import org.apache.ibatis.session.SqlSession;

import vo.member.C_InquiryVO;
import vo.member.InquiryVO;

public class C_InquiryDAO {
	
	private SqlSession sqlSession;
	
	
	public C_InquiryDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insertc_Inquiry(C_InquiryVO ciqvo ) {
		return sqlSession.insert("c_inquiry.insertc_Inquiry",ciqvo);
	}

}
