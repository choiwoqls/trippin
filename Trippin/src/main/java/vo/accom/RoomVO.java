package vo.accom;

public class RoomVO {

	private int room_seq;
	private int f_seq;
	private String room_view_seq;
	private String room_name;
	private int room_price;
	private String cancellation;
	private String room_benefit_seq;
	private String checkin;
	private String checkout;
	private String room_condition;
	private String notice;
	private int breakfast;
	private int reservation_policy;
	private int pay;
	private int room_cnt;
	private String room_size;
	private String coupon_seq;
	private String fs_seq;
	private int maxpeople;
	private String room_img;
	private int smoke;
	
	public RoomVO() {
		
	}
	
	public RoomVO(int room_seq, int f_seq, String room_view_seq, String room_name, int room_price, String cancellation, 
			String room_benefit_seq, String checkin, String checkout, String room_condition, String notice, 
			int breakfast, int reservation_policy, int pay, int room_cnt, String room_size, String coupon_seq, 
			String fs_seq, int maxpeople, String room_img, int smoke) {
		
		this.room_seq = room_seq;
		this.f_seq = f_seq;
		this.room_view_seq = room_view_seq;
		this.room_name = room_name;
		this.room_price = room_price;
		this.cancellation = cancellation;
		this.room_benefit_seq = room_benefit_seq;
		this.checkin = checkin;
		this.checkout = checkout;
		this.room_condition = room_condition;
		this.notice = notice;
		this.breakfast = breakfast;
		this.reservation_policy = reservation_policy;
		this.pay = pay;
		this.room_cnt = room_cnt;
		this.room_size = room_size;
		this.coupon_seq = coupon_seq;
		this.fs_seq = fs_seq;
		this.maxpeople = maxpeople;
		this.room_img = room_img;
		this.smoke = smoke;
	}
	
	public int getRoom_seq() {
		return room_seq;
	}
	public void setRoom_seq(int room_seq) {
		this.room_seq = room_seq;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getRoom_view_seq() {
		return room_view_seq;
	}
	public void setRoom_view_seq(String room_view_seq) {
		this.room_view_seq = room_view_seq;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getCancellation() {
		return cancellation;
	}
	public void setCancellation(String cancellation) {
		this.cancellation = cancellation;
	}
	public String getRoom_benefit_seq() {
		return room_benefit_seq;
	}
	public void setRoom_benefit_seq(String room_benefit_seq) {
		this.room_benefit_seq = room_benefit_seq;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getRoom_condition() {
		return room_condition;
	}
	public void setRoom_condition(String room_condition) {
		this.room_condition = room_condition;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public int getReservation_policy() {
		return reservation_policy;
	}
	public void setReservation_policy(int reservation_policy) {
		this.reservation_policy = reservation_policy;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getRoom_cnt() {
		return room_cnt;
	}
	public void setRoom_cnt(int room_cnt) {
		this.room_cnt = room_cnt;
	}
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public String getCoupon_seq() {
		return coupon_seq;
	}
	public void setCoupon_seq(String coupon_seq) {
		this.coupon_seq = coupon_seq;
	}
	public String getFs_seq() {
		return fs_seq;
	}
	public void setFs_seq(String fs_seq) {
		this.fs_seq = fs_seq;
	}
	public int getMaxpeople() {
		return maxpeople;
	}
	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public int getSmoke() {
		return smoke;
	}
	public void setSmoke(int smoke) {
		this.smoke = smoke;
	}
	
	
}
