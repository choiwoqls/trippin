package vo.member;

import java.sql.Date;

public class M_ReportVO {

	private int m_report_seq;
	private int m_report_cate_seq;
	private int bad_seq;
	private int m_seq;
	private String email;
	private String content;
	private Date datetime;
	private int result;
	private String memo;
	private Date resultdate;
	

	public M_ReportVO() {
		
	}

	public M_ReportVO(int m_report_seq, int m_report_cate_seq, int bad_seq, int m_seq, String email, String content,
			Date datetime, int result, String memo, Date resultdate) {
		this.m_report_seq = m_report_seq;
		this.m_report_cate_seq = m_report_cate_seq;
		this.bad_seq = bad_seq;
		this.m_seq = m_seq;
		this.email = email;
		this.content = content;
		this.datetime = datetime;
		this.result = result;
		this.memo = memo;
		this.resultdate = resultdate;
	}

	public int getM_report_seq() {
		return m_report_seq;
	}

	public void setM_report_seq(int m_report_seq) {
		this.m_report_seq = m_report_seq;
	}

	public int getM_report_cate_seq() {
		return m_report_cate_seq;
	}

	public void setM_report_cate_seq(int m_report_cate_seq) {
		this.m_report_cate_seq = m_report_cate_seq;
	}

	public int getBad_seq() {
		return bad_seq;
	}

	public void setBad_seq(int bad_seq) {
		this.bad_seq = bad_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
//----------------------------------------------
	private String m_report_cate_name;
	private int score;
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getM_report_cate_name() {
		return m_report_cate_name;
	}

	public void setM_report_cate_name(String m_report_cate_name) {
		this.m_report_cate_name = m_report_cate_name;
	}
	
	
	public Date getResultdate() {
		return resultdate;
	}

	public void setResultdate(Date resultdate) {
		this.resultdate = resultdate;
	}

	//----------------------------------------------
	private String m_nickname;

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	
	
	
	
}
