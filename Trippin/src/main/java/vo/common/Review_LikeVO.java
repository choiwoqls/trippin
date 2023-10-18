package vo.common;

public class Review_LikeVO {

	private int rvlike_seq;
	private int rv_seq;
	private int m_seq;
	
	
	public Review_LikeVO() {
	}


	public Review_LikeVO(int rvlike_seq, int rv_seq, int m_seq) {
		this.rvlike_seq = rvlike_seq;
		this.rv_seq = rv_seq;
		this.m_seq = m_seq;
	}


	public int getRvlike_seq() {
		return rvlike_seq;
	}


	public void setRvlike_seq(int rvlike_seq) {
		this.rvlike_seq = rvlike_seq;
	}


	public int getRv_seq() {
		return rv_seq;
	}


	public void setRv_seq(int rv_seq) {
		this.rv_seq = rv_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	
	
	
	
}
