package vo.common;


public class TipsVO {

	private int tips_seq;
	private String tip;
	
	public TipsVO() {
		
	}
	
	public TipsVO(int tips_seq, String tip) {
		this.tips_seq = tips_seq;
		this.tip = tip;
	}

	public int getTips_seq() {
		return tips_seq;
	}

	public void setTips_seq(int tips_seq) {
		this.tips_seq = tips_seq;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	
	
	

	
	
	

	
	


}