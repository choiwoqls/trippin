package vo.hotple;


public class H_TipsVO {

	private int h_tips_seq;
	private int h_seq;
	private int tips_seq;
	private String h_tip;
	private int num;
	
	public H_TipsVO() {
		
	}
	
	public H_TipsVO(int h_tips_seq, int h_seq, int tips_seq,
			String h_tip, int num) {
		this.h_tips_seq = h_tips_seq;
		this.h_seq = h_seq;
		this.tips_seq = tips_seq;
		this.h_tip = h_tip;
		this.num = num;
	}

	public int getH_tips_seq() {
		return h_tips_seq;
	}

	public void setH_tips_seq(int h_tips_seq) {
		this.h_tips_seq = h_tips_seq;
	}

	public int getH_seq() {
		return h_seq;
	}

	public void setH_seq(int h_seq) {
		this.h_seq = h_seq;
	}

	public int getTips_seq() {
		return tips_seq;
	}

	public void setTips_seq(int tips_seq) {
		this.tips_seq = tips_seq;
	}

	public String getH_tip() {
		return h_tip;
	}

	public void setH_tip(String h_tip) {
		this.h_tip = h_tip;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	


}