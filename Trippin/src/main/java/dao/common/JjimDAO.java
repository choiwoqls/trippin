package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.JjimVO;

public class JjimDAO {
	
	private SqlSession sqlSession;
	
	public JjimDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int insert(JjimVO vo) {
		return sqlSession.insert("jjim.insert", vo);
	}
	
	public int update(JjimVO vo) {
		return sqlSession.update("jjim.update", vo);
	}
	
	public int deleteJJIM(JjimVO vo) {
		return sqlSession.delete("jjim.deleteJJIM", vo);
	}
	
	public int countjjim(int f_seq) {
		return sqlSession.selectOne("jjim.countjjim", f_seq);
	}
	
	public List<JjimVO> myjjimlist(int m_seq){
		return sqlSession.selectList("jjim.myjjimlist", m_seq);
	}
	
	public JjimVO checkJJIM(JjimVO vo) {
		return sqlSession.selectOne("jjim.checkJJIM", vo);
	}
	
}
