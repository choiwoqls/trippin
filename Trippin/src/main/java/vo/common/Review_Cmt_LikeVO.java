package vo.common;

public class Review_Cmt_LikeVO {
	
	private int rv_cmtlike_seq;
	private int rv_cmt_seq;
	private int m_seq;
	
	public Review_Cmt_LikeVO() {
	}

	public Review_Cmt_LikeVO(int rv_cmtlike_seq, int rv_cmt_seq, int m_seq) {
		super();
		this.rv_cmtlike_seq = rv_cmtlike_seq;
		this.rv_cmt_seq = rv_cmt_seq;
		this.m_seq = m_seq;
	}

	public int getRv_cmtlike_seq() {
		return rv_cmtlike_seq;
	}

	public void setRv_cmtlike_seq(int rv_cmtlike_seq) {
		this.rv_cmtlike_seq = rv_cmtlike_seq;
	}

	public int getRv_cmt_seq() {
		return rv_cmt_seq;
	}

	public void setRv_cmt_seq(int rv_cmt_seq) {
		this.rv_cmt_seq = rv_cmt_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	
	
	
}
