package vo.member;

import java.sql.Date;

public class MycashVO {

	private int mycash_seq;
	private int m_seq;
	private int kind;
	private int purchase_no;
	private int cash;
	private Date cash_date;
	private int spare;
	private int what;
	private Date datetime;
	
	public MycashVO() {
		
	}

	public MycashVO(int mycash_seq, int m_seq, int kind, int purchase_no, 
			int cash, Date cash_date, int spare, int what, Date datetime) {
		super();
		this.mycash_seq = mycash_seq;
		this.m_seq = m_seq;
		this.kind = kind;
		this.purchase_no = purchase_no;
		this.cash = cash;
		this.cash_date = cash_date;
		this.spare = spare;
		this.datetime = datetime;
	}

	public int getMycash_seq() {
		return mycash_seq;
	}

	public void setMycash_seq(int mycash_seq) {
		this.mycash_seq = mycash_seq;
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

	public int getPurchase_no() {
		return purchase_no;
	}

	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public Date getCash_date() {
		return cash_date;
	}

	public void setCash_date(Date cash_date) {
		this.cash_date = cash_date;
	}

	public int getSpare() {
		return spare;
	}

	public void setSpare(int spare) {
		this.spare = spare;
	}

	public int getWhat() {
		return what;
	}

	public void setWhat(int what) {
		this.what = what;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	
	
}
