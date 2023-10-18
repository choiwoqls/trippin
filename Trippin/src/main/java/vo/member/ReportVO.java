package vo.member;

import java.sql.Date;

public class ReportVO {

	private int report_seq;
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
	



	public ReportVO() {
		
	}

	public ReportVO(int report_seq, int report_cate_seq, int kind, int board_no, int m_seq, String email, String content,
			Date datetime, int result, String memo) {
		super();
		this.report_seq = report_seq;
		this.report_cate_seq = report_cate_seq;
		this.kind = kind;
		this.board_no = board_no;
		this.m_seq = m_seq;
		this.email = email;
		this.content = content;
		this.datetime = datetime;
		this.result = result;
		this.memo = memo;
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public int getReport_cate_seq() {
		return report_cate_seq;
	}

	public void setReport_cate_seq(int report_cate_seq) {
		this.report_cate_seq = report_cate_seq;
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

	//---------------------------------------------------
	private String report_cate_name;
	private String m_nickname;

	public String getReport_cate_name() {
		return report_cate_name;
	}

	public void setReport_cate_name(String report_cate_name) {
		this.report_cate_name = report_cate_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
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

	//------------------------------------------------------

	
	
	
	
	
}
