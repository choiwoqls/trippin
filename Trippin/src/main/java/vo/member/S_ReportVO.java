package vo.member;

import java.sql.Date;

public class S_ReportVO {

	private int s_report_seq;
	private int report_cate_seq;
	private int kind;
	private int board_no;
	private int m_seq;


	private String email;
	private String content;
	private Date datetime;
	private int result;
	private String memo;
	private Date resultdate;
	private Date plus30;
	
	
	public S_ReportVO() {
		// TODO Auto-generated constructor stub
	}


	public int getS_report_seq() {
		return s_report_seq;
	}


	public void setS_report_seq(int s_report_seq) {
		this.s_report_seq = s_report_seq;
	}


	public int getReport_cate_seq() {
		return report_cate_seq;
	}


	public void setReport_cate_seq(int report_cate_seq) {
		this.report_cate_seq = report_cate_seq;
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


	public Date getResultdate() {
		return resultdate;
	}


	public void setResultdate(Date resultdate) {
		this.resultdate = resultdate;
	}


	public Date getPlus30() {
		return plus30;
	}


	public void setPlus30(Date plus30) {
		this.plus30 = plus30;
	}
	
	public int getKind() {
		return kind;
	}


	public void setKind(int kind) {
		this.kind = kind;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	
	
	
	

}
