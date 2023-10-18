package dao.slog;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.slog.Slog_CmtVO;

public class Slog_CmtDAO {
	
	private SqlSession sqlSession;
	
	public Slog_CmtDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
	
	
	//[새미]***********************************************************
	//여행기 댓글 숨김 
	public int HiddenSLC(Slog_CmtVO slcvo) {
		return sqlSession.update("slog_cmt.HiddenSLC",slcvo);
		
	}
	//여행기 댓글 숨김해제
	public int DefaultSLC(Slog_CmtVO slcvo) {
		return sqlSession.update("slog_cmt.DefaultSLC",slcvo);
		
	}
	//여행기댓글 삭제
	public int deleteSLC() {
		return sqlSession.update("slog_cmt.deleteSLC");
		
	}
	//여행기댓글 신고 점수 누적
	public int scoreSLC(Map<String, Object> map) {
		return sqlSession.update("slog_cmt.scoreSLC",map);
		
		
	}
	//여행기댓글 신고 점수 리셋(부적격)
	
	public int scoreResetSLC(int slog_cmt_seq) {
		return sqlSession.update("slog_cmt.scoreResetSLC",slog_cmt_seq);
		
	}
	
	
	
	//[재빈]***********************************************************
	public int newSlogCmt(Slog_CmtVO vo) {
		return this.sqlSession.insert("newSlogCmt", vo);
	}
	
	//[희지]***********************************************************
	public Slog_CmtVO scmtSome(int slog_cmt_seq) {
		return sqlSession.selectOne("slog_cmt.scmtSome", slog_cmt_seq);
	}
	
	
	

}
