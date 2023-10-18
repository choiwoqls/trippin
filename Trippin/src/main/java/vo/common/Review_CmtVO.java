package vo.common;

import java.sql.Date;

public class Review_CmtVO {
	
	private int rv_cmt_seq;
	private int rv_seq;
	private int m_seq;
	private String content;
	private Date datetime;
	private int cmt_no;
	private int m_seq2;
	private int depth;
	private int report_status;
	private int rv_cmt_score;
	
	
	private int table_type;
	
	public Review_CmtVO() {
	}


	public Review_CmtVO(int rv_cmt_seq, int rv_seq, int m_seq, String content, Date datetime, int cmt_no, int m_seq2,
			int depth, int report_status, int rv_cmt_score) {
		this.rv_cmt_seq = rv_cmt_seq;
		this.rv_seq = rv_seq;
		this.m_seq = m_seq;
		this.content = content;
		this.datetime = datetime;
		this.cmt_no = cmt_no;
		this.m_seq2 = m_seq2;
		this.depth = depth;
		this.report_status = report_status;
		this.rv_cmt_score = rv_cmt_score;
	}


	public int getRv_cmt_seq() {
		return rv_cmt_seq;
	}


	public void setRv_cmt_seq(int rv_cmt_seq) {
		this.rv_cmt_seq = rv_cmt_seq;
	}


	public int getRv_seq() {
		return rv_seq;
	}


	public void setRv_seq(int rv_seq) {
		this.rv_seq = rv_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
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


	public int getCmt_no() {
		return cmt_no;
	}


	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}


	public int getM_seq2() {
		return m_seq2;
	}


	public void setM_seq2(int m_seq2) {
		this.m_seq2 = m_seq2;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public int getReport_status() {
		return report_status;
	}


	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}


	public int getRv_cmt_score() {
		return rv_cmt_score;
	}


	public void setRv_cmt_score(int rv_cmt_score) {
		this.rv_cmt_score = rv_cmt_score;
	}
	
	
	
	
	
	public int getTable_type() {
		return table_type;
	}


	public void setTable_type(int table_type) {
		this.table_type = table_type;
	}
	
	
	
	

}
