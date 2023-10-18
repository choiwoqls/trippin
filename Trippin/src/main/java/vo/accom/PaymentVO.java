package vo.accom;

import java.sql.Date;

public class PaymentVO {
	private int payment_seq;
	private int room_seq;
	private int m_seq;
	private int coupon_seq;
	private int pay_seq;
	private String reservation_name;
	private String reservation_tel;
	private String reservation_mail;
	private String stay_last_name;
	private String stay_first_name;
	private int stay_sex;
	private String stay_birth;
	private Date start_date;
	private Date end_date;
	private int personnel_seq;
	private String traffic;
	private String request;
	private String p_pickup;
	private int r_number;
	private Date pay_date;
	private int approval;
	


	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}


	public int getPayment_seq() {
		return payment_seq;
	}


	public void setPayment_seq(int payment_seq) {
		this.payment_seq = payment_seq;
	}


	public int getRoom_seq() {
		return room_seq;
	}


	public void setRoom_seq(int room_seq) {
		this.room_seq = room_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public int getCoupon_seq() {
		return coupon_seq;
	}


	public void setCoupon_seq(int coupon_seq) {
		this.coupon_seq = coupon_seq;
	}


	public int getPay_seq() {
		return pay_seq;
	}


	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}


	public String getReservation_name() {
		return reservation_name;
	}


	public void setReservation_name(String reservation_name) {
		this.reservation_name = reservation_name;
	}


	public String getReservation_tel() {
		return reservation_tel;
	}


	public void setReservation_tel(String reservation_tel) {
		this.reservation_tel = reservation_tel;
	}


	public String getReservation_mail() {
		return reservation_mail;
	}


	public void setReservation_mail(String reservation_mail) {
		this.reservation_mail = reservation_mail;
	}


	public String getStay_last_name() {
		return stay_last_name;
	}


	public void setStay_last_name(String stay_last_name) {
		this.stay_last_name = stay_last_name;
	}


	public String getStay_first_name() {
		return stay_first_name;
	}


	public void setStay_first_name(String stay_first_name) {
		this.stay_first_name = stay_first_name;
	}


	public int getStay_sex() {
		return stay_sex;
	}


	public void setStay_sex(int stay_sex) {
		this.stay_sex = stay_sex;
	}


	public String getStay_birth() {
		return stay_birth;
	}


	public void setStay_birth(String stay_birth) {
		this.stay_birth = stay_birth;
	}


	public Date getStart_date() {
		return start_date;
	}


	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	public Date getEnd_date() {
		return end_date;
	}


	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	public int getPersonnel_seq() {
		return personnel_seq;
	}


	public void setPersonnel_seq(int personnel_seq) {
		this.personnel_seq = personnel_seq;
	}


	public String getTraffic() {
		return traffic;
	}


	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}


	public String getRequest() {
		return request;
	}


	public void setRequest(String request) {
		this.request = request;
	}


	public String getP_pickup() {
		return p_pickup;
	}


	public void setP_pickup(String p_pickup) {
		this.p_pickup = p_pickup;
	}


	public int getR_number() {
		return r_number;
	}


	public void setR_number(int r_number) {
		this.r_number = r_number;
	}


	public Date getPay_date() {
		return pay_date;
	}


	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}


	public int getApproval() {
		return approval;
	}


	public void setApproval(int approval) {
		this.approval = approval;
	}
	
	
	
	
	//-----------------------
	
	private String name;
	
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	

}
