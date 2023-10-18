package vo.slog;

public class Slog_AddVO {
	
	private int slog_add_seq;
	private int slog_seq;
	private int m_seq;

	public Slog_AddVO() {
	
	}
	
	public Slog_AddVO(int slog_add_seq, int slog_seq, int m_seq) {
		this.slog_add_seq=slog_add_seq;
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
	}
	
	public Slog_AddVO(int slog_seq, int m_seq) {
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
	}

	public int getSlog_add_seq() {
		return slog_add_seq;
	}

	public void setSlog_add_seq(int slog_add_seq) {
		this.slog_add_seq = slog_add_seq;
	}

	public int getSlog_seq() {
		return slog_seq;
	}

	public void setSlog_seq(int slog_seq) {
		this.slog_seq = slog_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	
	
	
	
}
