package vo.member;

import java.sql.Date;

public class CouponlistVO {
	
	private int couponlist_seq;
	private int m_seq;
	private int kind;
	private int coupon_no;
	private Date downdate;
	private Date valid_date;
	private int status;
	
	public CouponlistVO() {
		
	}

	public CouponlistVO(int couponlist_seq, int m_seq, int kind, int coupon_no, Date downdate, Date valid_date,
			int status) {
		super();
		this.couponlist_seq = couponlist_seq;
		this.m_seq = m_seq;
		this.kind = kind;
		this.coupon_no = coupon_no;
		this.downdate = downdate;
		this.valid_date = valid_date;
		this.status = status;
	}

	public int getCouponlist_seq() {
		return couponlist_seq;
	}

	public void setCouponlist_seq(int couponlist_seq) {
		this.couponlist_seq = couponlist_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public Date getDowndate() {
		return downdate;
	}

	public void setDowndate(Date downdate) {
		this.downdate = downdate;
	}

	public Date getValid_date() {
		return valid_date;
	}

	public void setValid_date(Date valid_date) {
		this.valid_date = valid_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
}
