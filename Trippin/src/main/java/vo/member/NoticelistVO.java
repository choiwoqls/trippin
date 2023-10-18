package vo.member;

import java.sql.Date;

public class NoticelistVO {

	private int noticelist_seq;
	private int m_seq;
	private int notice_seq;
	private String content;
	private String url_in;
	private int notice_check;
	private Date datetime; 
	
	public NoticelistVO() {
		
	}

	public NoticelistVO(int noticelist_seq, int m_seq, int notice_seq, String content, String url_in, int notice_check,
			Date datetime) {
		super();
		this.noticelist_seq = noticelist_seq;
		this.m_seq = m_seq;
		this.notice_seq = notice_seq;
		this.content = content;
		this.url_in = url_in;
		this.notice_check = notice_check;
		this.datetime = datetime;
	}

	public int getNoticelist_seq() {
		return noticelist_seq;
	}

	public void setNoticelist_seq(int noticelist_seq) {
		this.noticelist_seq = noticelist_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl_in() {
		return url_in;
	}

	public void setUrl_in(String url_in) {
		this.url_in = url_in;
	}

	public int getNotice_check() {
		return notice_check;
	}

	public void setNotice_check(int notice_check) {
		this.notice_check = notice_check;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

}
