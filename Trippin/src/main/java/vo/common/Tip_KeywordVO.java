package vo.common;


public class Tip_KeywordVO {

	private int tip_key_seq;
	private String tip_key;
	
	public Tip_KeywordVO() {
		
	}
	
	public Tip_KeywordVO(int tip_key_seq, String tip_key) {
		this.tip_key_seq = tip_key_seq;
		this.tip_key = tip_key;
	}

	public int getTip_key_seq() {
		return tip_key_seq;
	}

	public void setTip_key_seq(int tip_key_seq) {
		this.tip_key_seq = tip_key_seq;
	}

	public String getTip_key() {
		return tip_key;
	}

	public void setTip_key(String tip_key) {
		this.tip_key = tip_key;
	}
	
	
	

	
	


}