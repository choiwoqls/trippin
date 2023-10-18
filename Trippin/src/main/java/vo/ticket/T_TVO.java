package vo.ticket;


public class T_TVO {

	private int t_t_seq;
	private int f_seq;
	private String ticket__seq;

	public T_TVO() {
		
	}

	public T_TVO(int t_t_seq, int f_seq, String ticket__seq) {
		super();
		this.t_t_seq = t_t_seq;
		this.f_seq = f_seq;
		this.ticket__seq = ticket__seq;
	}

	public int getT_t_seq() {
		return t_t_seq;
	}

	public void setT_t_seq(int t_t_seq) {
		this.t_t_seq = t_t_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getTicket__seq() {
		return ticket__seq;
	}

	public void setTicket__seq(String ticket__seq) {
		this.ticket__seq = ticket__seq;
	}
	

}