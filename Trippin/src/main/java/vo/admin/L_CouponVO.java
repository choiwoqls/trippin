package vo.admin;


public class L_CouponVO {

	private int l_coupon_seq;
	private String name;	
	private int level_no;
	private int valid_date;
	private int type;
	private int amount;
	private int max_min;
	private int use;
	private int status;
	
	public L_CouponVO() {
		
	}

	public L_CouponVO(int l_coupon_seq, String name, int level_no, int valid_date, int type, int amount, int max_min,
			int use, int status) {
		this.l_coupon_seq = l_coupon_seq;
		this.name = name;
		this.level_no = level_no;
		this.valid_date = valid_date;
		this.type = type;
		this.amount = amount;
		this.max_min = max_min;
		this.use = use;
		this.status = status;
	}

	public int getL_coupon_seq() {
		return l_coupon_seq;
	}

	public void setL_coupon_seq(int l_coupon_seq) {
		this.l_coupon_seq = l_coupon_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public int getValid_date() {
		return valid_date;
	}

	public void setValid_date(int valid_date) {
		this.valid_date = valid_date;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMax_min() {
		return max_min;
	}

	public void setMax_min(int max_min) {
		this.max_min = max_min;
	}

	public int getUse() {
		return use;
	}

	public void setUse(int use) {
		this.use = use;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	//====================================
	
	public int coupon_seq;

	public int getCoupon_seq() {
		return coupon_seq;
	}

	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}
	
	
	
	
	
	


}