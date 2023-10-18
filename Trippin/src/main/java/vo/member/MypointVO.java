package vo.member;

import java.sql.Date;

public class MypointVO {
	
	private int mp_seq;
	private int m_seq;
	private int p_seq;
	private int point;
	private String content_in;
	private String url_in;
	private Date datetime;
	
	
	public MypointVO() {
		// TODO Auto-generated constructor stub
	
	}
	public MypointVO(int m_seq, int p_seq, int point, String content_in, String url_in) {
		this.m_seq = m_seq;
		this.p_seq = p_seq;
		this.point = point;
		this.content_in = content_in;
		this.url_in = url_in;
	}



	public int getMp_seq() {
		return mp_seq;
	}


	public void setMp_seq(int mp_seq) {
		this.mp_seq = mp_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public int getP_seq() {
		return p_seq;
	}


	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getContent_in() {
		return content_in;
	}


	public void setContent_in(String content_in) {
		this.content_in = content_in;
	}


	public String getUrl_in() {
		return url_in;
	}


	public void setUrl_in(String url_in) {
		this.url_in = url_in;
	}


	public Date getDatetime() {
		return datetime;
	}


	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	
	
	
	

}
