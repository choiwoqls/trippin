package vo.member;

public class Notice_CateVO {

	private int notice_cate_seq;
	private String notice_cate_name;
	
	public Notice_CateVO() {
		
	}

	public Notice_CateVO(int notice_cate_seq, String notice_cate_name) {
		super();
		this.notice_cate_seq = notice_cate_seq;
		this.notice_cate_name = notice_cate_name;
	}

	public int getNotice_cate_seq() {
		return notice_cate_seq;
	}

	public void setNotice_cate_seq(int notice_cate_seq) {
		this.notice_cate_seq = notice_cate_seq;
	}

	public String getNotice_cate_name() {
		return notice_cate_name;
	}

	public void setNotice_cate_name(String notice_cate_name) {
		this.notice_cate_name = notice_cate_name;
	}

	
}
