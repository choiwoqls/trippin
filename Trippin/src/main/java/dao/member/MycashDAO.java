package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.MycashVO;

public class MycashDAO {

	private SqlSession sqlSession;
	
	public MycashDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int cashInsert(MycashVO vo) {
		return sqlSession.insert("mycash.insert", vo);
	}
	
	public int mycashSeq() {
		return sqlSession.selectOne("mycash.mycashSeq");
	}
	
	// 적립예정에서 적립으로 변경
	public int updateEarn() {
		return sqlSession.update("mycash.updateEarn");
	}
	
	// 나의 소멸 대상 캐시 얼마인지
	public int endCash(int m_seq) {
		return sqlSession.selectOne("mycash.endCash", m_seq); 
	}
	
	// 나의 소멸 예정 캐시 얼마인지
	public int soonEnd(int m_seq) {
		return sqlSession.selectOne("mycash.soonEnd", m_seq);
	}
	
	// 나의 소멸 대상 캐시 소멸시키기
	public int updateEnd(int m_seq) {
		return sqlSession.update("mycash.updateEnd", m_seq);
	}
	
	// 사용 가능 캐시 내역
	public List<MycashVO> canUseList(int m_seq) {
		return sqlSession.selectList("mycash.canUseList", m_seq);
	}
	
	// 사용 가능한 캐시 금액
	public int canUse(int m_seq) {
		return sqlSession.selectOne("mycash.canUse", m_seq);
	}
	
	// 사용 가능 중 사용 캐시 차감
	public int updateUse(MycashVO vo) {
		return sqlSession.update("mycash.updateUse", vo);
	}
	
	// 예매 취소 시 적립 예정 캐시 취소
	public int cancelCash(MycashVO vo) {
		return sqlSession.update("mycash.cancelCash", vo);
	}
	
	// 내 캐시내역
	public List<Map<String, Object>> mycash(int m_seq){
		return sqlSession.selectList("mycash.mycash", m_seq);
	}
	
}
