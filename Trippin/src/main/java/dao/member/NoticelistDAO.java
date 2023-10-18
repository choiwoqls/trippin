package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.NoticelistVO;

public class NoticelistDAO {

	private SqlSession sqlSession;
	
	public NoticelistDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int preNotice(Map<String, Object> map) {
		return sqlSession.selectOne("noticelist.preNotice", map);
	}
	
	public int noticeInsert(NoticelistVO vo) {
		return sqlSession.insert("noticelist.insert", vo);
	}
	
	public List<Map<String, Object>> myNotice(int m_seq) {
		return sqlSession.selectList("noticelist.myNotice", m_seq);
	}
	
	public int readThis(int noticelist_seq) {
		return sqlSession.update("noticelist.readThis", noticelist_seq);
	}
	
	public int sameNotice(NoticelistVO vo) {
		return sqlSession.selectOne("noticelist.sameNotice", vo);
	}
}
