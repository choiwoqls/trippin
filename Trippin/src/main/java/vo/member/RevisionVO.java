package vo.member;

import java.sql.Date;


import org.springframework.web.multipart.MultipartFile;

public class RevisionVO {
	
	private int revision_seq;
	private int revision_cate_seq;
	private int m_seq;
	private int f_seq;
	private String content;
	private Date datetime;
	private int status;	
	private String memo;

	private String revision_img;
	private String checkdate;

	
	//--form------------------------
	private String intro;






	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	//-----------------------------------------
	private String revision_cate_name;
	public String getM_nickname() {
		return m_nickname;
	}


	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}


	private String cate_name;
	private String m_nickname;
	
	
	
	public String getRevision_cate_name() {
		return revision_cate_name;
	}


	public void setRevision_cate_name(String revision_cate_name) {
		this.revision_cate_name = revision_cate_name;
	}


	public String getCate_name() {
		return cate_name;
	}


	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}


	public RevisionVO() {
		// TODO Auto-generated constructor stub
	}


	public int getRevision_seq() {
		return revision_seq;
	}


	public void setRevision_seq(int revision_seq) {
		this.revision_seq = revision_seq;
	}


	public int getRevision_cate_seq() {
		return revision_cate_seq;
	}


	public void setRevision_cate_seq(int revision_cate_seq) {
		this.revision_cate_seq = revision_cate_seq;
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


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getCheckdate() {
		return checkdate;
	}


	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}
	
	public String getRevision_img() {
		return revision_img;
	}


	public void setRevision_img(String revision_img) {
		this.revision_img = revision_img;
	}
	
	//----------------------------------
	private MultipartFile[] photos;
	private int cate_seq;





	public int getCate_seq() {
		return cate_seq;
	}


	public void setCate_seq(int cate_seq) {
		this.cate_seq = cate_seq;
	}


	public MultipartFile[] getPhotos() {
		return photos;
	}


	public void setPhotos(MultipartFile[] photos) {
		this.photos = photos;
	}


	//-------------------------
	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}




}
