package vo.common;

public class HoursVO {
	
	private int hours_seq;
	private int f_seq;
	private int day_seq;
	private int hours_cate_seq;
	private String time;
	
	
	private String day_name;
	
	public HoursVO() {
	}

	public HoursVO(int hours_seq, int f_seq, int day_seq, int hours_cate_seq, String time) {
		this.hours_seq = hours_seq;
		this.f_seq = f_seq;
		this.day_seq = day_seq;
		this.hours_cate_seq = hours_cate_seq;
		this.time = time;
	}

	public int getHours_seq() {
		return hours_seq;
	}

	public void setHours_seq(int hours_seq) {
		this.hours_seq = hours_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getDay_seq() {
		return day_seq;
	}

	public void setDay_seq(int day_seq) {
		this.day_seq = day_seq;
	}

	public int getHours_cate_seq() {
		return hours_cate_seq;
	}

	public void setHours_cate_seq(int hours_cate_seq) {
		this.hours_cate_seq = hours_cate_seq;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	


	public String getDay_name() {
		return day_name;
	}

	public void setDay_name(String day_name) {
		this.day_name = day_name;
	}
	
	
	
}
