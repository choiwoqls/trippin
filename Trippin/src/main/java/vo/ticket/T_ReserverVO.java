package vo.ticket;


public class T_ReserverVO {

	private int t_reserver_seq;
	private int m_seq;
	private String reserver_name;
	private String reserver_tel;
	private String reserver_email;

	public T_ReserverVO() {
		
	}

	public T_ReserverVO(int t_reserver_seq, int m_seq, String reserver_name, String reserver_tel,
			String reserver_email) {
		super();
		this.t_reserver_seq = t_reserver_seq;
		this.m_seq = m_seq;
		this.reserver_name = reserver_name;
		this.reserver_tel = reserver_tel;
		this.reserver_email = reserver_email;
	}

	public int getT_reserver_seq() {
		return t_reserver_seq;
	}

	public void setT_reserver_seq(int t_reserver_seq) {
		this.t_reserver_seq = t_reserver_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getReserver_name() {
		return reserver_name;
	}

	public void setReserver_name(String reserver_name) {
		this.reserver_name = reserver_name;
	}

	public String getReserver_tel() {
		return reserver_tel;
	}

	public void setReserver_tel(String reserver_tel) {
		this.reserver_tel = reserver_tel;
	}

	public String getReserver_email() {
		return reserver_email;
	}

	public void setReserver_email(String reserver_email) {
		this.reserver_email = reserver_email;
	}

	

}