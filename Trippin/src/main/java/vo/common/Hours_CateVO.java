package vo.common;

public class Hours_CateVO {

	private int hours_cate_seq;
	private String hours_cate_name;
	
	public Hours_CateVO() {
		
	}
	
	public Hours_CateVO(int hours_cate_seq, String hours_cate_name) {
		this.hours_cate_seq = hours_cate_seq;
		this.hours_cate_name = hours_cate_name;
	}

	public int getHours_cate_seq() {
		return hours_cate_seq;
	}

	public void setHours_cate_seq(int hours_cate_seq) {
		this.hours_cate_seq = hours_cate_seq;
	}

	public String getHours_cate_name() {
		return hours_cate_name;
	}

	public void setHours_cate_name(String hours_cate_name) {
		this.hours_cate_name = hours_cate_name;
	}
	
	
}
