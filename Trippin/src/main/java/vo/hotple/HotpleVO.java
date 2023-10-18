package vo.hotple;

import org.springframework.web.multipart.MultipartFile;

public class HotpleVO {

	private int h_seq;
	private int f_seq;
	private String h_busi;
	private String h_info;
	private String h_lastorder;
	private String h_runtime;
	private String h_img;

	public HotpleVO() {
		
	}
	
	public HotpleVO(int h_seq, int f_seq, String h_busi, String h_info, 
			String h_runtime, String h_lastorder, String h_img) {
		this.h_seq = h_seq;
		this.f_seq = f_seq;
		this.h_info = h_info;
		this.h_lastorder = h_lastorder;
		this.h_runtime = h_runtime;
		this.h_img = h_img;
	}

	public int getH_seq() {
		return h_seq;
	}

	public void setH_seq(int h_seq) {
		this.h_seq = h_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	
	public String getH_busi() {
		return h_busi;
	}

	public void setH_busi(String h_busi) {
		this.h_busi = h_busi;
	}

	public String getH_info() {
		return h_info;
	}

	public void setH_info(String h_info) {
		this.h_info = h_info;
	}

	public String getH_lastorder() {
		return h_lastorder;
	}

	public void setH_lastorder(String h_lastorder) {
		this.h_lastorder = h_lastorder;
	}

	public String getH_runtime() {
		return h_runtime;
	}

	public void setH_runtime(String h_runtime) {
		this.h_runtime = h_runtime;
	}

	public String getH_img() {
		return h_img;
	}

	public void setH_img(String h_img) {
		this.h_img = h_img;
	}
	
	//============================================
	
	private MultipartFile[] photos;

	public MultipartFile[] getPhotos() {
		return photos;
	}

	public void setPhotos(MultipartFile[] photos) {
		this.photos = photos;
	}
	
	
	
	
	
}

