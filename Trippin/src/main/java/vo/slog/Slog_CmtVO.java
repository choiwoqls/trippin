package vo.slog;

import java.sql.Date;

public class Slog_CmtVO {

	private int slog_cmt_seq;
	private int slog_seq;
	private int m_seq;
	private String content;
	private Date datetime;
	private int cmt_no;
	private int m_seq2;
	private int depth;
	private int status;
	private int score;

	
	private int table_type;
	
	public Slog_CmtVO() {

	}
	
	public Slog_CmtVO(int slog_cmt_seq, int slog_seq, int m_seq, String content, int cmt_no, int depth) {
		this.slog_cmt_seq=slog_cmt_seq;
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
		this.content=content;
		this.cmt_no=cmt_no;
		this.depth=depth;
	}
	
	public Slog_CmtVO(int slog_seq, int m_seq, String content, int cmt_no, int depth) {
		this.slog_seq=slog_seq;
		this.m_seq=m_seq;
		this.content=content;
		this.cmt_no=cmt_no;
		this.depth=depth;
	}


	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public int getM_seq2() {
		return m_seq2;
	}

	public void setM_seq2(int m_seq2) {
		this.m_seq2 = m_seq2;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getSlog_cmt_seq() {
		return slog_cmt_seq;
	}

	public void setSlog_cmt_seq(int slog_cmt_seq) {
		this.slog_cmt_seq = slog_cmt_seq;
	}

	public int getSlog_seq() {
		return slog_seq;
	}

	public void setSlog_seq(int slog_seq) {
		this.slog_seq = slog_seq;
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

	public int getCmt_no() {
		return cmt_no;
	}

	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	public int getTable_type() {
		return table_type;
	}

	public void setTable_type(int table_type) {
		this.table_type = table_type;
	}
	
	
}
