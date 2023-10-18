package vo.tour;

public class Tour_CateVO {

	private int t_cate_seq;
	private String t_cate_name;
	
	public Tour_CateVO() {
	}

	public Tour_CateVO(int t_cate_seq, String t_cate_name) {
		this.t_cate_seq = t_cate_seq;
		this.t_cate_name = t_cate_name;
	}

	public int getT_cate_seq() {
		return t_cate_seq;
	}

	public void setT_cate_seq(int t_cate_seq) {
		this.t_cate_seq = t_cate_seq;
	}

	public String getT_cate_name() {
		return t_cate_name;
	}

	public void setT_cate_name(String t_cate_name) {
		this.t_cate_name = t_cate_name;
	}
	
	
	
}
