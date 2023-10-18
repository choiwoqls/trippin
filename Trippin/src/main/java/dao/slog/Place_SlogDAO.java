package dao.slog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Place_SlogVO;

public class Place_SlogDAO {
	
	private SqlSession sqlSession;
	
	public Place_SlogDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
	
	public int newPlaceSlog(Place_SlogVO vo) {
		return sqlSession.insert("newPlaceSlog", vo);
	}

	public List<Map<String, Object>> placeSlogList(int day_slog_seq){
		return sqlSession.selectList("placeSlogList", day_slog_seq);
	}
	
	public int rePlaceSlog(Place_SlogVO vo) {
		return sqlSession.update("rePlaceSlog", vo);
	}
	
	public Integer selectS_seq(int place_slog_seq) {
		return sqlSession.selectOne("selectS_seq", place_slog_seq);
	}
	
}
