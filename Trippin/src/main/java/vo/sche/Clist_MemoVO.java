package vo.sche;

public class Clist_MemoVO {
	
	private int clist_memo_seq;
	private int s_seq;
	private int m_seq;
	private int clist_cate_seq;
	private String memo;
	
	
	public Clist_MemoVO() {
	}


	public int getClist_memo_seq() {
		return clist_memo_seq;
	}


	public void setClist_memo_seq(int clist_memo_seq) {
		this.clist_memo_seq = clist_memo_seq;
	}


	public int getS_seq() {
		return s_seq;
	}


	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public String getMemo() {
		return memo;
	}


	public int getClist_cate_seq() {
		return clist_cate_seq;
	}


	public void setClist_cate_seq(int clist_cate_seq) {
		this.clist_cate_seq = clist_cate_seq;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	

}
