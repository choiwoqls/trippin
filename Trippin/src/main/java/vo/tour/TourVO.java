package vo.tour;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TourVO {

	private int t_seq;
	private int f_seq;
	private String info;
	private String relate_no;
	private String tour_img;
	private String use_fee;
	private String run_info;
	private String term_hours;
	
	private List<MultipartFile> files;
	
	public TourVO() {
	}


	public TourVO(int t_seq, int f_seq, String info, String relate_no, String tour_img, String use_fee, String run_info,
			String term_hours) {
		this.t_seq = t_seq;
		this.f_seq = f_seq;
		this.info = info;
		this.relate_no = relate_no;
		this.tour_img = tour_img;
		this.use_fee = use_fee;
		this.run_info = run_info;
		this.term_hours = term_hours;
	}


	public int getT_seq() {
		return t_seq;
	}


	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}


	public int getF_seq() {
		return f_seq;
	}


	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public String getRelate_no() {
		return relate_no;
	}


	public void setRelate_no(String relate_no) {
		this.relate_no = relate_no;
	}


	public String getTour_img() {
		return tour_img;
	}


	public void setTour_img(String tour_img) {
		this.tour_img = tour_img;
	}


	public String getUse_fee() {
		return use_fee;
	}


	public void setUse_fee(String use_fee) {
		this.use_fee = use_fee;
	}


	public String getRun_info() {
		return run_info;
	}


	public void setRun_info(String run_info) {
		this.run_info = run_info;
	}


	public String getTerm_hours() {
		return term_hours;
	}


	public void setTerm_hours(String term_hours) {
		this.term_hours = term_hours;
	}


	public List<MultipartFile> getFiles() {
		return files;
	}


	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
	
	
}
