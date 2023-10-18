package vo.accom;

public class PensionVO {
	private int pension_seq;
	private int f_seq;
	private String hs_sub_seq;
	private String cf_sub_seq;
	private String pension_eng_name;
	private String pension_pickup;
	private String pension_pr;
	private String pension_explanation;
	private String pension_notice;
	
	public PensionVO(){
		
	}
	public PensionVO(int pension_seq, int f_seq, String hs_sub_seq, String cf_sub_seq, String pension_eng_name, 
			String pension_pickup, String pension_pr, String pension_explanation, String pension_notice) {
		this.pension_seq = pension_seq;
		this.f_seq = f_seq;
		this.hs_sub_seq = hs_sub_seq;
		this.cf_sub_seq = cf_sub_seq;
		this.pension_eng_name = pension_eng_name;
		this.pension_pickup = pension_pickup;
		this.pension_pr = pension_pr;
		this.pension_explanation = pension_explanation;
		this.pension_notice = pension_notice;
	}
	
	
	public int getPension_seq() {
		return pension_seq;
	}
	public void setPension_seq(int pension_seq) {
		this.pension_seq = pension_seq;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getHs_sub_seq() {
		return hs_sub_seq;
	}
	public void setHs_sub_seq(String hs_sub_seq) {
		this.hs_sub_seq = hs_sub_seq;
	}
	public String getCf_sub_seq() {
		return cf_sub_seq;
	}
	public void setCf_sub_seq(String cf_sub_seq) {
		this.cf_sub_seq = cf_sub_seq;
	}
	public String getPension_eng_name() {
		return pension_eng_name;
	}
	public void setPension_eng_name(String pension_eng_name) {
		this.pension_eng_name = pension_eng_name;
	}
	public String getPension_pickup() {
		return pension_pickup;
	}
	public void setPension_pickup(String pension_pickup) {
		this.pension_pickup = pension_pickup;
	}
	public String getPension_pr() {
		return pension_pr;
	}
	public void setPension_pr(String pension_pr) {
		this.pension_pr = pension_pr;
	}
	public String getPension_explanation() {
		return pension_explanation;
	}
	public void setPension_explanation(String pension_explanation) {
		this.pension_explanation = pension_explanation;
	}
	public String getPension_notice() {
		return pension_notice;
	}
	public void setPension_notice(String pension_notice) {
		this.pension_notice = pension_notice;
	}
}
