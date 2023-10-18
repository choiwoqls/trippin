package dao.accom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.accom.ReservationVO;
import vo.member.MemberVO;


public class RoomDAO {

	private SqlSession sqlSession;
	
	//숙소 공통 DAO
	public RoomDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//detail 객실
	public Map<String, Object> detailRoom(int room_seq){
		return sqlSession.selectOne("accom.detailRoom", room_seq);
	}
	
	//detail 객실의 객실 benefit 혜택 카테고리
	public String benefit(int room_benefit_seq) {
		return sqlSession.selectOne("accom.benefit", room_benefit_seq);
	}
	
	//숙소 중요 정보
	public List<Map<String, Object>> infoRoom(int f_seq){
		return sqlSession.selectList("accom.infoRoom", f_seq);
	}
	
	//숙소 정책
	public List<Map<String, Object>> policy(int f_seq){
		return sqlSession.selectList("accom.policy", f_seq);
	}
	
	//숙소 보건&안전
	public List<Map<String, Object>>hs(int hs_sub_seq){
		return sqlSession.selectList("accom.hs", hs_sub_seq);
	}
	//숙소 편의시설
	public List<Map<String, Object>>cf(int cf_sub_seq){
		return sqlSession.selectList("accom.cf", cf_sub_seq);
	}
	//예약하기
	public Map<String, Object>rvRoom(int room_seq){
		return sqlSession.selectOne("accom.rvRoom", room_seq);
	}
	//예약하기 멤버 조회
	public MemberVO rvMember(int m_seq){
		return sqlSession.selectOne("accom.rvMember", m_seq);
	}
	
	//예약 insert
	public int insert(ReservationVO vo) {
		return sqlSession.insert("accom.rvinsert", vo);
	}
	public int rvseq() {
		return sqlSession.selectOne("accom.rvseq");
	}
}














