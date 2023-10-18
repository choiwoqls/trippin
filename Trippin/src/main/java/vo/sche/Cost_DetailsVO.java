package vo.sche;

public class Cost_DetailsVO {
	
	private int cost_details_seq;
	private int cost_seq;
	private int m_seq;
	private int paymen;
	private int dutch;
	private int pay_money;
	private int dutch_money;

	public Cost_DetailsVO() {
	
	}
	
	public Cost_DetailsVO(int cost_details_seq, int cost_seq, int m_seq, int paymen, int dutch, int pay_money, int dutch_money) {
		this.cost_details_seq=cost_details_seq;
		this.cost_seq=cost_seq;
		this.m_seq=m_seq;
		this.paymen=paymen;
		this.dutch=dutch;
		this.pay_money=pay_money;
		this.dutch_money=dutch_money;
	}
	
	public Cost_DetailsVO(int cost_seq, int m_seq, int paymen, int dutch, int pay_money, int dutch_money) {
		this.cost_seq=cost_seq;
		this.m_seq=m_seq;
		this.paymen=paymen;
		this.dutch=dutch;
		this.pay_money=pay_money;
		this.dutch_money=dutch_money;
	}

	public int getCost_details_seq() {
		return cost_details_seq;
	}

	public void setCost_details_seq(int cost_details_seq) {
		this.cost_details_seq = cost_details_seq;
	}

	public int getCost_seq() {
		return cost_seq;
	}

	public void setCost_seq(int cost_seq) {
		this.cost_seq = cost_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getPaymen() {
		return paymen;
	}

	public void setPaymen(int paymen) {
		this.paymen = paymen;
	}

	public int getDutch() {
		return dutch;
	}

	public void setDutch(int dutch) {
		this.dutch = dutch;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public int getDutch_money() {
		return dutch_money;
	}

	public void setDutch_money(int dutch_money) {
		this.dutch_money = dutch_money;
	}
	
	
}
