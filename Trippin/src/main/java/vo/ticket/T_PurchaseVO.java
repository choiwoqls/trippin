package vo.ticket;

import java.sql.Date;

public class T_PurchaseVO {

	private int t_purchase_seq;
	private int m_seq;
	private int ticket_seq;
	private int coupon_kind;
	private int coupon_no;
	private Date use_date;
	private Date end_date;
	private String t_amount_no;
	private int tot_money;
	private int pay_money;
	private int use_cash;
	
	private String reserver_name;
	private String reserver_tel;
	private String reserver_email;
	private String repre_name;
	private String repre_tel;
	
	private int pay_seq;
	private String serial_no;
	private Date datetime;
	private int status;
	
	
	//----
	private String ticket_name;
	
	//----------
	private int kind;

	
	
	
	public T_PurchaseVO() {
		
	}

	public T_PurchaseVO(int t_purchase_seq, int m_seq, int ticket_seq, int coupon_kind, int coupon_no, Date use_date,
			Date end_date, String t_amount_no, int tot_money, int pay_money, int use_cash,
			String reserver_name, String reserver_tel, String reserver_email, String repre_name, String repre_tel,
			int pay_seq, String serial_no, Date datetime, int status) {
		super();
		this.t_purchase_seq = t_purchase_seq;
		this.m_seq = m_seq;
		this.ticket_seq = ticket_seq;
		this.coupon_kind = coupon_kind;
		this.coupon_no = coupon_no;
		this.use_date = use_date;
		this.end_date = end_date;
		this.t_amount_no = t_amount_no;
		this.tot_money = tot_money;
		this.pay_money = pay_money;
		this.use_cash = use_cash;
		this.reserver_name = reserver_name;
		this.reserver_tel = reserver_tel;
		this.reserver_email = reserver_email;
		this.repre_name = repre_name;
		this.repre_tel = repre_tel;
		this.pay_seq = pay_seq;
		this.serial_no = serial_no;
		this.datetime = datetime;
		this.status = status;
	}

	public int getT_purchase_seq() {
		return t_purchase_seq;
	}

	public void setT_purchase_seq(int t_purchase_seq) {
		this.t_purchase_seq = t_purchase_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getTicket_seq() {
		return ticket_seq;
	}

	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}

	public int getCoupon_kind() {
		return coupon_kind;
	}

	public void setCoupon_kind(int coupon_kind) {
		this.coupon_kind = coupon_kind;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public Date getUse_date() {
		return use_date;
	}

	public void setUse_date(Date use_date) {
		this.use_date = use_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getT_amount_no() {
		return t_amount_no;
	}

	public void setT_amount_no(String t_amount_no) {
		this.t_amount_no = t_amount_no;
	}

	public int getTot_money() {
		return tot_money;
	}

	public void setTot_money(int tot_money) {
		this.tot_money = tot_money;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public int getUse_cash() {
		return use_cash;
	}

	public void setUse_cash(int use_cash) {
		this.use_cash = use_cash;
	}

	public String getReserver_name() {
		return reserver_name;
	}

	public void setReserver_name(String reserver_name) {
		this.reserver_name = reserver_name;
	}

	public String getReserver_tel() {
		return reserver_tel;
	}

	public void setReserver_tel(String reserver_tel) {
		this.reserver_tel = reserver_tel;
	}

	public String getReserver_email() {
		return reserver_email;
	}

	public void setReserver_email(String reserver_email) {
		this.reserver_email = reserver_email;
	}

	public String getRepre_name() {
		return repre_name;
	}

	public void setRepre_name(String repre_name) {
		this.repre_name = repre_name;
	}

	public String getRepre_tel() {
		return repre_tel;
	}

	public void setRepre_tel(String repre_tel) {
		this.repre_tel = repre_tel;
	}

	public int getPay_seq() {
		return pay_seq;
	}

	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}

	public String getSerial_no() {
		return serial_no;
	}

	public void setSerial_no(String serial_no) {
		this.serial_no = serial_no;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	//----------
	public String getTicket_name() {
		return ticket_name;
	}

	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	
	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	
}