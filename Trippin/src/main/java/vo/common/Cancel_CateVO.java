package vo.common;


public class Cancel_CateVO {

	private int cancel_cate_seq;
	private String cancel_cate_name;
	
	public Cancel_CateVO() {
		
	}

	public Cancel_CateVO(int cancel_cate_seq, String cancel_cate_name) {
		super();
		this.cancel_cate_seq = cancel_cate_seq;
		this.cancel_cate_name = cancel_cate_name;
	}

	public int getCancel_cate_seq() {
		return cancel_cate_seq;
	}

	public void setCancel_cate_seq(int cancel_cate_seq) {
		this.cancel_cate_seq = cancel_cate_seq;
	}

	public String getCancel_cate_name() {
		return cancel_cate_name;
	}

	public void setCancel_cate_name(String cancel_cate_name) {
		this.cancel_cate_name = cancel_cate_name;
	}
	
}