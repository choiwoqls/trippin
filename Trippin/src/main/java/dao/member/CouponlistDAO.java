package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.admin.L_CouponVO;
import vo.member.CouponlistVO;

public class CouponlistDAO {

	private SqlSession sqlSession;
	
	public CouponlistDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertCoupon(CouponlistVO vo) {
		return sqlSession.insert("couponlist.insert", vo);
	}
	
	public int deleteCoupon() {
		return sqlSession.update("couponlist.delete");
	}
	
	public int useCoupon(CouponlistVO vo) {
		return sqlSession.update("couponlist.use", vo);
	}
	
	public CouponlistVO returnCouponOk(CouponlistVO vo) {
		return sqlSession.selectOne("couponlist.returnCouponOk", vo);
	}
	
	public int returnCoupon(int couponlist_seq) {
		return sqlSession.update("couponlist.returnCoupon", couponlist_seq);
	}
	
	public int couponBye(Map<String, Object> map) {
		return sqlSession.selectOne("couponlist.couponBye", map);
	}
	
	public int spareDay(Map<String, Object> map) {
		return sqlSession.selectOne("couponlist.spareDay", map);
	}
	
	public int l_already(List<L_CouponVO> list) {
		return sqlSession.selectOne("couponlist.l_already", list);
	}
	
	
	//[현지]******************************************************************
	public List<Map<String, Object>> myCoupon(int m_seq){
		return sqlSession.selectList("couponlist.myCoupon", m_seq);
	}
	
	
	
	
	
}
