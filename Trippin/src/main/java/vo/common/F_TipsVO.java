package vo.common;


public class F_TipsVO {

	private int f_tips_seq;
	private int f_seq;
	private int tips_seq;
	private String f_tip;
	
	public F_TipsVO() {
		
	}

	public F_TipsVO(int f_tips_seq, int f_seq, int tips_seq, String f_tip) {
		super();
		this.f_tips_seq = f_tips_seq;
		this.f_seq = f_seq;
		this.tips_seq = tips_seq;
		this.f_tip = f_tip;
	}

	public int getF_tips_seq() {
		return f_tips_seq;
	}

	public void setF_tips_seq(int f_tips_seq) {
		this.f_tips_seq = f_tips_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getTips_seq() {
		return tips_seq;
	}

	public void setTips_seq(int tips_seq) {
		this.tips_seq = tips_seq;
	}

	public String getF_tip() {
		return f_tip;
	}

	public void setF_tip(String f_tip) {
		this.f_tip = f_tip;
	}

}