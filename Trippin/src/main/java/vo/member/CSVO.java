package vo.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CSVO {
	
	private int cs_seq;
	private int cs_cate_seq;
	private int cs_subcate_seq;
	private String title;
	private String content;
	private String cs_img; //폴더명
	
	
	
	public String getCs_img() {
		return cs_img;
	}

	public void setCs_img(String cs_img) {
		this.cs_img = cs_img;
	}

	//이미지 파일을 받기 위한 클래스
	private MultipartFile photo;
	
	private List<MultipartFile> files;
	
	private List<String> fileList;
	
	//------------------------------
	

	private String cs_cate_name;
	private String cs_subcate_name;
	
	
	
	


	public CSVO() {
		// TODO Auto-generated constructor stub
	}

	public int getCs_seq() {
		return cs_seq;
	}

	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
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
	
	//---------------------------------------------------------------
	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public List<String> getFileList() {
		return fileList;
	}

	public void setFileList(List<String> fileList) {
		this.fileList = fileList;
	}


}
