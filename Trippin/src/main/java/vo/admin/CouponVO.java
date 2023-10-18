package vo.admin;


public class CouponVO {

	private int coupon_seq;
	private String name;
	private int kind;
	private int valid_date;
	private int type;
	private int amount;
	private int max_min;
	private int use;
	private int addr1_seq;
	private int board_no;
	private int status;
	
	public CouponVO() {
		
	}
	
	public CouponVO(int coupon_seq, String name, int kind, int valid_date, int type, int amount,
			int max_min, int use, int addr1_seq, int board_no, int status) {
		this.coupon_seq = coupon_seq;
		this.name = name;
		this.kind = kind;
		this.valid_date = valid_date;
		this.type = type;
		this.amount = amount;
		this.max_min = max_min;
		this.use = use;
		this.addr1_seq = addr1_seq;
		this.board_no = board_no;
		this.status = status;
	}

	public int getCoupon_seq() {
		return coupon_seq;
	}

	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
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

	public int getAddr1_seq() {
		return addr1_seq;
	}

	public void setAddr1_seq(int addr1_seq) {
		this.addr1_seq = addr1_seq;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
//===========================================
	
	private int table_type;

	public int getTable_type() {
		return table_type;
	}

	public void setTable_type(int table_type) {
		this.table_type = table_type;
	}
	
	
	private int l_coupon_seq;

	public int getL_coupon_seq() {
		return l_coupon_seq;
	}

	public void setL_coupon_seq(int l_coupon_seq) {
		this.l_coupon_seq = l_coupon_seq;
	}
	
	
	
	


}