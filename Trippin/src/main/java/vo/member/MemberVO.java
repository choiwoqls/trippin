package vo.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private int m_seq;
	private String m_email;
	private String m_name;
	private String m_nickname;
	private String m_pw;
	private String m_profile;
	private int m_level;
	private String m_code;
	private String recom_code;
	private String m_tel;
	private Date m_joindate;
	private int m_status;
	private int m_score;
	
	
	private MultipartFile photo;
	
	
	public MemberVO() {
		
	}


	public MemberVO(int m_seq, String m_email, String m_name, String m_nickname, String m_pw, String m_profile,
			int m_level, String m_code, String recom_code, String m_tel, Date m_joindate, int m_status, int m_score) {
		this.m_seq = m_seq;
		this.m_email = m_email;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_pw = m_pw;
		this.m_profile = m_profile;
		this.m_level = m_level;
		this.m_code = m_code;
		this.recom_code = recom_code;
		this.m_tel = m_tel;
		this.m_joindate = m_joindate;
		this.m_status = m_status;
		this.m_score = m_score;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public String getM_email() {
		return m_email;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public String getM_nickname() {
		return m_nickname;
	}


	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}


	public String getM_pw() {
		return m_pw;
	}


	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}


	public String getM_profile() {
		return m_profile;
	}


	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}


	public int getM_level() {
		return m_level;
	}


	public void setM_level(int m_level) {
		this.m_level = m_level;
	}


	public String getM_code() {
		return m_code;
	}


	public void setM_code(String m_code) {
		this.m_code = m_code;
	}


	public String getRecom_code() {
		return recom_code;
	}


	public void setRecom_code(String recom_code) {
		this.recom_code = recom_code;
	}


	public String getM_tel() {
		return m_tel;
	}


	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}


	public Date getM_joindate() {
		return m_joindate;
	}


	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}


	public int getM_status() {
		return m_status;
	}


	public void setM_status(int m_status) {
		this.m_status = m_status;
	}


	public int getM_score() {
		return m_score;
	}


	public void setM_score(int m_score) {
		this.m_score = m_score;
	}


	public MultipartFile getPhoto() {
		return photo;
	}


	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}


	
	
	
	
	
	
}
