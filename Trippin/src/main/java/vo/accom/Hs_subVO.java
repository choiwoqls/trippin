package vo.accom;

public class Hs_subVO {
	
	private int hs_sub_seq;
	private int hs_seq;
	private String hs_sub_name;
	
	public Hs_subVO() {
		
	}
	
	public Hs_subVO(int hs_sub_seq, int hs_seq, String hs_sub_name) {
		this.hs_sub_seq = hs_sub_seq;
		this.hs_seq = hs_seq;
		this.hs_sub_name = hs_sub_name;
	}

	public int getHs_sub_seq() {
		return hs_sub_seq;
	}

	public void setHs_sub_seq(int hs_sub_seq) {
		this.hs_sub_seq = hs_sub_seq;
	}

	public int getHs_seq() {
		return hs_seq;
	}

	public void setHs_seq(int hs_seq) {
		this.hs_seq = hs_seq;
	}

	public String getHs_sub_name() {
		return hs_sub_name;
	}

	public void setHs_sub_name(String hs_sub_name) {
		this.hs_sub_name = hs_sub_name;
	}
	
	
}
