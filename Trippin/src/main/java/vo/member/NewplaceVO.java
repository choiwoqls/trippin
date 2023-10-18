package vo.member;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NewplaceVO {
	
	private int newplace_seq;
	private int m_seq;
	private String name;
	private String addr;
	private int kind;
	private String reason;
	private String img;
	private String info;
	private String info_img;
	private String services;
	private String extra;
	private String email;
	private int email_status;
	private Date datetime;
	private int status;
	private String memo;
	
	private List<MultipartFile> files;
	private List<MultipartFile> files2;
	
	
	private String m_name;
	private String m_email;
	
	
	public NewplaceVO() {
	}


	public NewplaceVO(int newplace_seq, int m_seq, String name, String addr, int kind, String reason, String img,
			String info, String info_img, String services, String extra, String email, int email_status, Date datetime, int status, String memo) {
		this.newplace_seq = newplace_seq;
		this.m_seq = m_seq;
		this.name = name;
		this.addr = addr;
		this.kind = kind;
		this.reason = reason;
		this.img = img;
		this.info = info;
		this.info_img = info_img;
		this.services = services;
		this.extra = extra;
		this.email = email;
		this.email_status = email_status;
		this.datetime = datetime;
		this.status = status;
		this.memo = memo;
	}


	public int getNewplace_seq() {
		return newplace_seq;
	}


	public void setNewplace_seq(int newplace_seq) {
		this.newplace_seq = newplace_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public int getKind() {
		return kind;
	}


	public void setKind(int kind) {
		this.kind = kind;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public String getInfo_img() {
		return info_img;
	}


	public void setInfo_img(String info_img) {
		this.info_img = info_img;
	}


	public String getServices() {
		return services;
	}


	public void setServices(String services) {
		this.services = services;
	}


	public String getExtra() {
		return extra;
	}


	public void setExtra(String extra) {
		this.extra = extra;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getEmail_status() {
		return email_status;
	}


	public void setEmail_status(int email_status) {
		this.email_status = email_status;
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

	
	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public List<MultipartFile> getFiles() {
		return files;
	}


	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}


	public List<MultipartFile> getFiles2() {
		return files2;
	}


	public void setFiles2(List<MultipartFile> files2) {
		this.files2 = files2;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public String getM_email() {
		return m_email;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	
	

}
