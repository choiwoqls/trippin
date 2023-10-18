package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.TipsVO;

public class TipsDAO {

	private SqlSession sqlSession;
	
	public TipsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<TipsVO> findTip(Map<String, Object> map){
		return sqlSession.selectList("tips.findTip", map);
	}
	
	public int addTip(String tip) {
		return sqlSession.insert("tips.addTip", tip);
	}
	
	public int maxSeq() {
		return sqlSession.selectOne("tips.maxSeq");
	}
	
	public int sameTip(String tip) {
		return sqlSession.selectOne("tips.sameTip", tip);
	}
	
}
