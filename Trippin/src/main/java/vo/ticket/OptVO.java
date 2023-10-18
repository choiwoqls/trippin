package vo.ticket;


public class OptVO {

	private int opt_seq;
	private int ticket_seq;
	private String opt_name;
	private String opt_info;

	public OptVO() {
		
	}

	public OptVO(int opt_seq, int ticket_seq, String opt_name, String opt_info) {
		super();
		this.opt_seq = opt_seq;
		this.ticket_seq = ticket_seq;
		this.opt_name = opt_name;
		this.opt_info = opt_info;
	}

	public int getOpt_seq() {
		return opt_seq;
	}

	public void setOpt_seq(int opt_seq) {
		this.opt_seq = opt_seq;
	}

	public int getTicket_seq() {
		return ticket_seq;
	}

	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}

	public String getOpt_name() {
		return opt_name;
	}

	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}

	public String getOpt_info() {
		return opt_info;
	}

	public void setOpt_info(String opt_info) {
		this.opt_info = opt_info;
	}
	
}