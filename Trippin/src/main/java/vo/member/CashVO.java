package vo.member;


public class CashVO {

	private int cash_seq;
	private int kind;
	private int percent;
	
	public CashVO() {
		
	}

	public CashVO(int cash_seq, int kind, int percent) {
		super();
		this.cash_seq = cash_seq;
		this.kind = kind;
		this.percent = percent;
	}

	public int getCash_seq() {
		return cash_seq;
	}

	public void setCash_seq(int cash_seq) {
		this.cash_seq = cash_seq;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

}
