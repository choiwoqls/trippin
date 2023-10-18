package vo.common;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	
	private int rv_seq;
	private int m_seq;
	private int f_seq;
	private String visitday;
	private int stars;
	private String content;
	private Date datetime;
	private String rv_img;
	private int report_status;
	private int rv_score;
	
	
	private int table_type;
	
	private List<MultipartFile> files;
	
	public ReviewVO() {
	}

	public ReviewVO(int rv_seq, int m_seq, int f_seq, String visitday, int stars, String content, Date datetime,
			 String rv_img, int report_status, int rv_score) {
		this.rv_seq = rv_seq;
		this.m_seq = m_seq;
		this.f_seq = f_seq;
		this.visitday = visitday;
		this.stars = stars;
		this.content = content;
		this.datetime = datetime;
		this.rv_img = rv_img;
		this.report_status = report_status;
		this.rv_score = rv_score;
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

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getVisitday() {
		return visitday;
	}

	public void setVisitday(String visitday) {
		this.visitday = visitday;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
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

	public String getRv_img() {
		return rv_img;
	}

	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}

	public int getReport_status() {
		return report_status;
	}
	
	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}
	
	public int getRv_score() {
		return rv_score;
	}

	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}

	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
	
	

	public int getTable_type() {
		return table_type;
	}

	public void setTable_type(int table_type) {
		this.table_type = table_type;
	}

	
	
}
