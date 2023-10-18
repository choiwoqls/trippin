package vo.common;

import java.sql.Date;

public class RefundVO {

	private int refund_seq;
	private int cancel_seq;
	private int fee;
	private int money;
	private String memo;
	private String datetime;
	
	public RefundVO() {
		
	}

	public RefundVO(int refund_seq, int cancel_seq, int fee, int money, String memo, String datetime) {
		super();
		this.refund_seq = refund_seq;
		this.cancel_seq = cancel_seq;
		this.fee = fee;
		this.money = money;
		this.memo = memo;
		this.datetime = datetime;
	}

	public int getRefund_seq() {
		return refund_seq;
	}

	public void setRefund_seq(int refund_seq) {
		this.refund_seq = refund_seq;
	}

	public int getCancel_seq() {
		return cancel_seq;
	}

	public void setCancel_seq(int cancel_seq) {
		this.cancel_seq = cancel_seq;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
}