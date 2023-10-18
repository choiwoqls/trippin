package dao.common;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.F_TipsVO;


public class F_TipsDAO {
	
	private SqlSession sqlSession;
	
	public F_TipsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int tipInsert(F_TipsVO vo) {
		return sqlSession.insert("f_tips.insert", vo);
	}
	
	public List<Map<String, Object>> oneTip(int f_seq){
		return sqlSession.selectList("f_tips.oneTip", f_seq);
	}
	
	public int sameTip(F_TipsVO vo) {
		return sqlSession.selectOne("f_tips.sameTip", vo);
	}
	
	public int updateTip(F_TipsVO vo) {
		return sqlSession.update("f_tips.updateTip", vo);
	}
	
	public int deleteTip(Map<String, Object> map) {
		return sqlSession.delete("f_tips.deleteTip", map);
	}
	
}
