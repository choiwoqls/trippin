package vo.ticket;

public class TkjjimVO {
	
	private int tkjjim_seq;
	private int m_seq;
	private int ticket_seq;
	private String memo;
	
	public TkjjimVO() {
	}

	public TkjjimVO(int tkjjim_seq, int m_seq, int ticket_seq, String memo) {
		this.tkjjim_seq = tkjjim_seq;
		this.m_seq = m_seq;
		this.ticket_seq = ticket_seq;
		this.memo = memo;
	}

	public int getTkjjim_seq() {
		return tkjjim_seq;
	}

	public void setTkjjim_seq(int tkjjim_seq) {
		this.tkjjim_seq = tkjjim_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getTicket_seq() {
		return ticket_seq;
	}

	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	

}
