package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.RevisionVO;
import vo.member.Revision_CateVO;

public class RevisionDAO {
	
	
	private SqlSession sqlSession;
	
	public RevisionDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	
	public List<Revision_CateVO> revisionCateList() {
		return sqlSession.selectList("revision_cate.revisionCateList");
	}
	
	
	public int revInsert(RevisionVO revo) {
		return sqlSession.insert("revision.revInsert",revo);
	}
	
	
	public int upStatusRev(int revision_seq) {
		return sqlSession.insert("revision.upStatusRev",revision_seq);
	}
	
	
	public List<Map<String, Object>> appAllRevq(Map<String, Object> map) {
		return sqlSession.selectList("revision.appAllRev",map);
	}
	
	public int revisionTotal(Map<String, Object> map) {
		return sqlSession.selectOne("revision.revisionTotal",map);
	}
	
	
	public RevisionVO getRevq(int revision_seq) {
		return sqlSession.selectOne("revision.getRev",revision_seq);
	}
	
	
	//<!-- 승인으로 -->
	public int appUpStatus(RevisionVO revo) {
		return sqlSession.update("revision.appUpStatus",revo);
	}
	
	//<!-- 부적격으로 -->
	public int NonAppUpStatus(RevisionVO revo) {
		return sqlSession.update("revision.NonAppUpStatus",revo);
	}
	
	//정보수정제안 seq
	public int revSeqOne() {
		return sqlSession.selectOne("revision.revSeqOne");
	}
	
	//[희지]**************************************************************
	public Map<String, Object> r_someInfo(int revision_seq){
		return sqlSession.selectOne("revision.someInfo", revision_seq);
	}






}
