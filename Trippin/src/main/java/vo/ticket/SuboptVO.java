package vo.ticket;


public class SuboptVO {

	private int subopt_seq;
	private int opt_seq;
	private String subopt_name;
	private String subopt_info;
	private int subopt_price;
	private int dc_rate;

	public SuboptVO() {
		
	}

	public SuboptVO(int subopt_seq, int opt_seq, String subopt_name, String subopt_info, int subopt_price, int dc_rate) {
		super();
		this.subopt_seq = subopt_seq;
		this.opt_seq = opt_seq;
		this.subopt_name = subopt_name;
		this.subopt_info = subopt_info;
		this.subopt_price = subopt_price;
		this.dc_rate =  dc_rate;
	}

	public int getSubopt_seq() {
		return subopt_seq;
	}

	public void setSubopt_seq(int subopt_seq) {
		this.subopt_seq = subopt_seq;
	}

	public int getOpt_seq() {
		return opt_seq;
	}

	public void setOpt_seq(int opt_seq) {
		this.opt_seq = opt_seq;
	}

	public String getSubopt_name() {
		return subopt_name;
	}

	public void setSubopt_name(String subopt_name) {
		this.subopt_name = subopt_name;
	}

	public String getSubopt_info() {
		return subopt_info;
	}

	public void setSubopt_info(String subopt_info) {
		this.subopt_info = subopt_info;
	}

	public int getSubopt_price() {
		return subopt_price;
	}

	public void setSubopt_price(int subopt_price) {
		this.subopt_price = subopt_price;
	}

	public int getDc_rate() {
		return dc_rate;
	}

	public void setDc_rate(int dc_rate) {
		this.dc_rate = dc_rate;
	}
	
	
	
}