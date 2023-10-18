package vo.slog;

public class Slog_LikeVO {
	
	private int slog_like_seq;
	private int slog_seq;
	private int m_seq;

	public Slog_LikeVO() {
	
	}
	
	public Slog_LikeVO(int slog_like_seq, int slog_seq, int m_seq) {
		this.slog_like_seq=slog_like_seq;
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
	}
	
	public Slog_LikeVO(int slog_seq, int m_seq) {
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
	}

	public int getSlog_like_seq() {
		return slog_like_seq;
	}

	public void setSlog_like_seq(int slog_like_seq) {
		this.slog_like_seq = slog_like_seq;
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
