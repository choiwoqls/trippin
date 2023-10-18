package dao.sche;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.sche.InviteVO;

public class InviteDAO {
	
	private SqlSession sqlSession;
	
	public InviteDAO(SqlSession sqlSession) {
		this.sqlSession=	sqlSession;
	}
	
	//새로운 일정 초대 데이터
	public int newIv(InviteVO vo) {
		return sqlSession.insert("newIv" ,vo);
	}

	//시퀀스
	public int invite_seq() {
		return sqlSession.selectOne("invite_seq");
	}
	
	//일정 초대 거절
	public int refIv(InviteVO vo) {
		return sqlSession.update("refIv", vo);
	}
	
	//일정 초대 수락
	public int accIv(InviteVO vo) {
		return sqlSession.update("accIv", vo);
	}
	
	//일정 떠남
	public int outIv(InviteVO vo) {
		return sqlSession.update("outIv", vo);
	}
	
	//2023-08-15
	public List<Integer> IvInfo(int s_seq){
		return sqlSession.selectList("IvInfo", s_seq);
	}
	
	//일정 삭제
	public int delInvite(InviteVO vo) {
		return sqlSession.delete("delInvite", vo);
	}
}
