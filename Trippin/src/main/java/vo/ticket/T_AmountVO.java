package vo.ticket;


public class T_AmountVO {

	private int t_amount_seq;
	private int subopt_seq;
	private int sum_price;
	private int amount;

	public T_AmountVO() {
		
	}

	public T_AmountVO(int t_amount_seq, int subopt_seq, int sum_price, int amount) {
		super();
		this.t_amount_seq = t_amount_seq;
		this.subopt_seq = subopt_seq;
		this.sum_price = sum_price;
		this.amount = amount;
	}

	public int getT_amount_seq() {
		return t_amount_seq;
	}

	public void setT_amount_seq(int t_amount_seq) {
		this.t_amount_seq = t_amount_seq;
	}

	public int getSubopt_seq() {
		return subopt_seq;
	}

	public void setSubopt_seq(int subopt_seq) {
		this.subopt_seq = subopt_seq;
	}

	public int getSum_price() {
		return sum_price;
	}

	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	//===============================================
	
	private String subopt_name;

	public String getSubopt_name() {
		return subopt_name;
	}

	public void setSubopt_name(String subopt_name) {
		this.subopt_name = subopt_name;
	}
	
	private String opt_name;

	public String getOpt_name() {
		return opt_name;
	}

	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	
}