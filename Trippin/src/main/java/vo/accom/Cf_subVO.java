package vo.accom;

public class Cf_subVO {
	private int cf_sub_seq;
	private int cf_seq;
	private String cf_sub_name;
	
	public Cf_subVO() {
		
	}
	
	public Cf_subVO(int cf_sub_seq, int cf_seq, String cf_sub_name) {
		this.cf_sub_seq = cf_sub_seq;
		this.cf_seq = cf_seq;
		this.cf_sub_name = cf_sub_name;
	}

	public int getCf_sub_seq() {
		return cf_sub_seq;
	}

	public void setCf_sub_seq(int cf_sub_seq) {
		this.cf_sub_seq = cf_sub_seq;
	}

	public int getCf_seq() {
		return cf_seq;
	}

	public void setCf_seq(int cf_seq) {
		this.cf_seq = cf_seq;
	}

	public String getCf_sub_name() {
		return cf_sub_name;
	}

	public void setCf_sub_name(String cf_sub_name) {
		this.cf_sub_name = cf_sub_name;
	}
	
	
}
