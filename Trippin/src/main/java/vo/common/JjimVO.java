package vo.common;

public class JjimVO {
	
	private int jjim_seq;
	private int m_seq;
	private int f_seq;
	private String memo;
	
	public JjimVO() {
	}

	public JjimVO(int jjim_seq, int m_seq, int f_seq, String memo) {
		this.jjim_seq = jjim_seq;
		this.m_seq = m_seq;
		this.f_seq = f_seq;
		this.memo = memo;
	}

	public int getJjim_seq() {
		return jjim_seq;
	}

	public void setJjim_seq(int jjim_seq) {
		this.jjim_seq = jjim_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
	
}
