package vo.member;

public class NoticeVO {

	private int notice_seq;
	private int notice_cate_seq;
	private String notice_content;
	private String url;
	
	public NoticeVO() {
		
	}

	public NoticeVO(int notice_seq, int notice_cate_seq, String notice_content, String url) {
		super();
		this.notice_seq = notice_seq;
		this.notice_cate_seq = notice_cate_seq;
		this.notice_content = notice_content;
		this.url = url;
	}

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	public int getNotice_cate_seq() {
		return notice_cate_seq;
	}

	public void setNotice_cate_seq(int notice_cate_seq) {
		this.notice_cate_seq = notice_cate_seq;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
