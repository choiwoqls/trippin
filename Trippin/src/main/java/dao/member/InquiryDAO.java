package dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.InquiryVO;

public class InquiryDAO {
	
	private SqlSession sqlSession;
	
	public InquiryDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public int insertInquiry(InquiryVO iqvo) {
		return sqlSession.insert("inquiry.insertInquiry",iqvo);
	}
	

	public int inquirySeqOne() {
		return sqlSession.selectOne("inquiry.inquirySeqOne");
	}
	
	public List<InquiryVO> inquiryList(Map<String, Object> map) {
		return sqlSession.selectList("inquiry.inquiryList",map);
	}
	
	public int getInquiryTotal(Map<String, Object> map) {
		return sqlSession.selectOne("inquiry.getInquiryTotal",map);
	}
	

	public InquiryVO inquiryOne(int inquiry_seq) {
		return sqlSession.selectOne("inquiry.inquiryOne",inquiry_seq);
	}
	

	public int doAnswerUp(InquiryVO iqvo) {
		return sqlSession.update("inquiry.doAnswerUp",iqvo);
	}
	
	
	public List<InquiryVO> inquiryMyList(Map<String, Object> map) {
		return sqlSession.selectList("inquiry.inquiryMyList",map);
	}



}
