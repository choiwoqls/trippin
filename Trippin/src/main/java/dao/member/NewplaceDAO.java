package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.NewplaceVO;

public class NewplaceDAO {
	
	private SqlSession sqlSession;
	
	public NewplaceDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//현지*****************************************************************
	public int insert(NewplaceVO vo) {
		return sqlSession.insert("newplace.insert", vo);
	}
	
	public int selectNP_seq() {
		return sqlSession.selectOne("newplace.selectNP_seq");
	}
	
	public List<NewplaceVO> selectNPList(Map<String, Object> map){
		return sqlSession.selectList("newplace.selectNPList", map);
	}
	
	public int getTotal(Map<String, Object> map) {
		return sqlSession.selectOne("newplace.getTotal", map);
	}
	
	
	
	//새미*****************************************************************
	public NewplaceVO npOne(int newplace_seq) {
		return sqlSession.selectOne("newplace.npOne",newplace_seq);
	}
	
	public int npStatus(NewplaceVO npvo) {
		return sqlSession.update("newplace.npStatus",npvo);
	}
	
	
	
}
