package vo.sche;

public class MoneyListVO {

	private int moneylist_seq;
	private int s_seq;
	private int m_seq;
	private int m_tot_pay;
	private int m_tot_dutch;

	public MoneyListVO() {
		
	}
	
	public MoneyListVO(int moneylist_seq, int s_seq, int m_seq, int m_tot_pay, int m_tot_dutch) {
		this.moneylist_seq=moneylist_seq;
		this.s_seq=s_seq;
		this.m_seq=m_seq;
		this.m_tot_pay=m_tot_pay;
		this.m_tot_dutch=m_tot_dutch;
	}
	
	public MoneyListVO(int s_seq, int m_seq, int m_tot_pay, int m_tot_dutch) {
		this.s_seq=s_seq;
		this.m_seq=m_seq;
		this.m_tot_pay=m_tot_pay;
		this.m_tot_dutch=m_tot_dutch;
	}

	public int getMoneylist_seq() {
		return moneylist_seq;
	}

	public void setMoneylist_seq(int moneylist_seq) {
		this.moneylist_seq = moneylist_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getM_tot_pay() {
		return m_tot_pay;
	}

	public void setM_tot_pay(int m_tot_pay) {
		this.m_tot_pay = m_tot_pay;
	}

	public int getM_tot_dutch() {
		return m_tot_dutch;
	}

	public void setM_tot_dutch(int m_tot_dutch) {
		this.m_tot_dutch = m_tot_dutch;
	}
	
	
}
