package dao.slog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Day_SlogVO;

public class Day_SlogDAO {
	
	private SqlSession sqlSession;
	
	public Day_SlogDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}

	public int day_slogSeq() {
		return sqlSession.selectOne("day_slogSeq");
	}
	
	public int newDaySlog(Day_SlogVO vo) {
		return sqlSession.insert("newDaySlog", vo);
	}
	
	public List<Map<String, Object>> daySlogList(int slog_seq){
		return sqlSession.selectList("daySlogList", slog_seq);
	}
	
	public int reDaySlogContent(Day_SlogVO vo) {
		return sqlSession.update("reDaySlogContent", vo);
	}
	
}
