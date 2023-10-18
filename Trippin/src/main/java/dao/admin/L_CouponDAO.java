package dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.admin.CouponVO;
import vo.admin.L_CouponVO;


public class L_CouponDAO {

	private SqlSession sqlSession;
	
	public L_CouponDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(L_CouponVO vo) {
		return sqlSession.insert("l_coupon.insert", vo);
	}
	
	public L_CouponVO select(int coupon_seq) {
		return sqlSession.selectOne("l_coupon.l_coupon", coupon_seq);
	}
	
	public L_CouponVO selectOne(int coupon_seq) {
		return sqlSession.selectOne("l_coupon.l_oneCoupon", coupon_seq);
	}
	
	public int totCount() {
		return sqlSession.selectOne("coupon.totCount");
	}
	
	public int lc_re(int l_coupon_seq) {
		return sqlSession.update("l_coupon.lc_re", l_coupon_seq);
	}
	
	public int lc_end(int l_coupon_seq) {
		return sqlSession.update("l_coupon.lc_end", l_coupon_seq);
	}
	
	public int lc_stop(int l_coupon_seq) {
		return sqlSession.update("l_coupon.lc_stop", l_coupon_seq);
	}
	
	public List<L_CouponVO> levelCoupon(int level_no){
		return sqlSession.selectList("l_coupon.levelCoupon", level_no);
	}
	
	
}
