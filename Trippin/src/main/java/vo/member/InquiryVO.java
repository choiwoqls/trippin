package vo.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class InquiryVO {


	private int inquiry_seq;
	private int cs_cate_seq;
	private int cs_subcate_seq;
	private int m_seq;
	private String email;
	private String tel;
	private String title;
	private String content;
	private String datetime;
	private int answer;
	private String inquiry_img;
	private String do_answer;
	private String do_answer_date;




	//--------------
	private MultipartFile[] photos;
	
	
	//---------------------------------
	
	private String m_nickname;
	private String cs_cate_name;
	private String cs_subcate_name;
	
	//---------------
	
	private int purchase_no;
	private String ticket_name;
	private String serial_no;
	private Date tpDate;
	
	
	

	public int getPurchase_no() {
		return purchase_no;
	}


	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
	}


	public String getTicket_name() {
		return ticket_name;
	}


	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}


	public String getSerial_no() {
		return serial_no;
	}


	public void setSerial_no(String serial_no) {
		this.serial_no = serial_no;
	}


	public Date getTpDate() {
		return tpDate;
	}


	public void setTpDate(Date tpDate) {
		this.tpDate = tpDate;
	}


	public String getM_nickname() {
		return m_nickname;
	}


	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}


	public String getCs_cate_name() {
		return cs_cate_name;
	}


	public void setCs_cate_name(String cs_cate_name) {
		this.cs_cate_name = cs_cate_name;
	}


	public String getCs_subcate_name() {
		return cs_subcate_name;
	}


	public void setCs_subcate_name(String cs_subcate_name) {
		this.cs_subcate_name = cs_subcate_name;
	}


	public InquiryVO() {
		// TODO Auto-generated constructor stub
	}


	public int getInquiry_seq() {
		return inquiry_seq;
	}


	public void setInquiry_seq(int inquiry_seq) {
		this.inquiry_seq = inquiry_seq;
	}


	public int getCs_cate_seq() {
		return cs_cate_seq;
	}


	public void setCs_cate_seq(int cs_cate_seq) {
		this.cs_cate_seq = cs_cate_seq;
	}


	public int getCs_subcate_seq() {
		return cs_subcate_seq;
	}


	public void setCs_subcate_seq(int cs_subcate_seq) {
		this.cs_subcate_seq = cs_subcate_seq;
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


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getDatetime() {
		return datetime;
	}


	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}


	public int getAnswer() {
		return answer;
	}


	public void setAnswer(int answer) {
		this.answer = answer;
	}


	public String getInquiry_img() {
		return inquiry_img;
	}


	public void setInquiry_img(String inquiry_img) {
		this.inquiry_img = inquiry_img;
	}
	
	public String getDo_answer() {
		return do_answer;
	}


	public void setDo_answer(String do_answer) {
		this.do_answer = do_answer;
	}

	
	public String getDo_answer_date() {
		return do_answer_date;
	}


	public void setDo_answer_date(String do_answer_date) {
		this.do_answer_date = do_answer_date;
	}

	//------------------------
	
	public MultipartFile[] getPhotos() {
		return photos;
	}


	public void setPhotos(MultipartFile[] photos) {
		this.photos = photos;
	}

	
	
	

}
