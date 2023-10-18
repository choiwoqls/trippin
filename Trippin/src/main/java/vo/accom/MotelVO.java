package vo.accom;

public class MotelVO {

	private int motel_seq;
	private int f_seq;
	private String hs_sub_seq;
	private String cf_sub_seq;
	private String motel_eng_name;
	private String motel_pickup;
	private String motel_explanation;
	private String motel_notice;
	private String motel_img;
	
	public MotelVO() {
		
	}
	
	public MotelVO(int motel_seq, int f_seq, String hs_sub_seq, String cf_sub_seq, 
			String motel_eng_name, String motel_pickup, String motel_explanation
			, String motel_notice, String motel_img) {
		this.motel_seq = motel_seq;
		this.f_seq = f_seq;
		this.hs_sub_seq = hs_sub_seq;
		this.cf_sub_seq = cf_sub_seq;
		this.motel_eng_name = motel_eng_name;
		this.motel_pickup = motel_pickup;
		this.motel_explanation = motel_explanation;
		this.motel_notice = motel_img;
	}

	public int getMotel_seq() {
		return motel_seq;
	}

	public void setMotel_seq(int motel_seq) {
		this.motel_seq = motel_seq;
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

	public String getMotel_eng_name() {
		return motel_eng_name;
	}

	public void setMotel_eng_name(String motel_eng_name) {
		this.motel_eng_name = motel_eng_name;
	}

	public String getMotel_pickup() {
		return motel_pickup;
	}

	public void setMotel_pickup(String motel_pickup) {
		this.motel_pickup = motel_pickup;
	}

	public String getMotel_explanation() {
		return motel_explanation;
	}

	public void setMotel_explanation(String motel_explanation) {
		this.motel_explanation = motel_explanation;
	}

	public String getMotel_notice() {
		return motel_notice;
	}

	public void setMotel_notice(String motel_notice) {
		this.motel_notice = motel_notice;
	}

	public String getMotel_img() {
		return motel_img;
	}

	public void setMotel_img(String motel_img) {
		this.motel_img = motel_img;
	}
	
	
}
