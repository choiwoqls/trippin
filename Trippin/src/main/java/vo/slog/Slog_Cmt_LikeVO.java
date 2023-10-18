package vo.slog;

public class Slog_Cmt_LikeVO {
	
	private int slog_cmt_like_seq;
	private int slog_cmt_seq;
	private int m_seq;

	public Slog_Cmt_LikeVO() {
		
	}
	
	public Slog_Cmt_LikeVO(int slog_cmt_like_seq, int slog_cmt_seq, int m_seq) {
		this.slog_cmt_like_seq=slog_cmt_like_seq;
		this.slog_cmt_seq=slog_cmt_seq;
		this.m_seq=m_seq;
	}
	
	public Slog_Cmt_LikeVO(int slog_cmt_seq, int m_seq) {
		this.slog_cmt_seq=slog_cmt_seq;
		this.m_seq=m_seq;
	}

	public int getSlog_cmt_like_seq() {
		return slog_cmt_like_seq;
	}

	public void setSlog_cmt_like_seq(int slog_cmt_like_seq) {
		this.slog_cmt_like_seq = slog_cmt_like_seq;
	}

	public int getSlog_cmt_seq() {
		return slog_cmt_seq;
	}

	public void setSlog_cmt_seq(int slog_cmt_seq) {
		this.slog_cmt_seq = slog_cmt_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	
	
	
}
