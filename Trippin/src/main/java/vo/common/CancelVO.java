package vo.common;

import java.sql.Date;

public class CancelVO {

	private int cancel_seq;
	private int m_seq;
	private int kind;
	private int purchase_no;
	private int cancel_cate_seq;
	private String content;
	private int cancel_percent;
	private Date datetime;
	private int status;
	
	public CancelVO() {
		
	}

	public CancelVO(int cancel_seq, int m_seq, int kind, int purchase_no, int cancel_cate_seq, String content,
			int cancel_percent, Date datetime, int status) {
		super();
		this.cancel_seq = cancel_seq;
		this.m_seq = m_seq;
		this.kind = kind;
		this.purchase_no = purchase_no;
		this.cancel_cate_seq = cancel_cate_seq;
		this.content = content;
		this.cancel_percent = cancel_percent;
		this.datetime = datetime;
		this.status = status;
	}

	public int getCancel_seq() {
		return cancel_seq;
	}

	public void setCancel_seq(int cancel_seq) {
		this.cancel_seq = cancel_seq;
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

	public int getCancel_cate_seq() {
		return cancel_cate_seq;
	}

	public void setCancel_cate_seq(int cancel_cate_seq) {
		this.cancel_cate_seq = cancel_cate_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCancel_percent() {
		return cancel_percent;
	}

	public void setCancel_percent(int cancel_percent) {
		this.cancel_percent = cancel_percent;
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

}