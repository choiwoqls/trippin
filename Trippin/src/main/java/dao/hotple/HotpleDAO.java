package dao.hotple;

import org.apache.ibatis.session.SqlSession;

import vo.hotple.HotpleVO;

public class HotpleDAO {

	private SqlSession sqlSession;
	
	public HotpleDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(HotpleVO hvo) {
		return sqlSession.insert("hotple.insert", hvo);
	}
	
	public HotpleVO selectOne(int f_seq) {
		return sqlSession.selectOne("hotple.hotple", f_seq);
	}
	
	public int sameHotple(String h_busi) {
		return sqlSession.selectOne("hotple.sameHotple", h_busi);
	}
	
	public int newSeq() {
		return sqlSession.selectOne("hotple.newSeq");
	}
	
	public int updateHotple(HotpleVO vo) {
		return sqlSession.update("hotple.update", vo);
	}
	
	public String h_runInfo(int f_seq) {
		return sqlSession.selectOne("hotple.runInfo", f_seq);
	}

	
}
