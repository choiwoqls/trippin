package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.admin.CouponVO;


public class CouponDAO {

	private SqlSession sqlSession;
	
	public CouponDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(CouponVO vo) {
		return sqlSession.insert("coupon.insert", vo);
	}
	
	public List<CouponVO> select(Map<String, Object> map){
		return sqlSession.selectList("coupon.coupon", map);
	}
	
	public CouponVO selectOne(int coupon_seq) {
		return sqlSession.selectOne("coupon.oneCoupon", coupon_seq);
	}
	
	public int totCount() {
		return sqlSession.selectOne("coupon.totCount");
	}
	
	public int someCount(Map<String, Object> map) {
		return sqlSession.selectOne("coupon.someCount", map);
	}
	
	public List<CouponVO> welcome(){
		return sqlSession.selectList("coupon.welcome");
	}
	
	public List<Integer> new_month(int valid_date){
		return sqlSession.selectList("coupon.new_month", valid_date);
	}
	
	public List<CouponVO> new_special(){
		return sqlSession.selectList("coupon.new_special");
	}
	
	public int couponRe(int coupon_seq) {
		return sqlSession.update("coupon.couponRe", coupon_seq);
	}
	
	public int couponEnd(int coupon_seq) {
		return sqlSession.update("coupon.couponEnd", coupon_seq);
	}
	
	public int couponStop(int coupon_seq) {
		return sqlSession.update("coupon.couponStop", coupon_seq);
	}
	
	public List<Map<String, Object>> buyCoupon(Map<String, Object> map){
		return sqlSession.selectList("coupon.buyCoupon", map);
	}

}
