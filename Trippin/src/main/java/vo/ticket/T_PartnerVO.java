package vo.ticket;


public class T_PartnerVO {

	private int t_partner_seq;
	private String t_partner_name;
	private String t_partner_intro;
	private String t_partner_info;
	private String t_partner_img;
	private String t_partner_tel;

	public T_PartnerVO() {
		
	}

	public T_PartnerVO(int t_partner_seq, String t_partner_name, String t_partner_intro, String t_partner_info,
			String t_partner_img, String t_partner_tel) {
		super();
		this.t_partner_seq = t_partner_seq;
		this.t_partner_name = t_partner_name;
		this.t_partner_intro = t_partner_intro;
		this.t_partner_info = t_partner_info;
		this.t_partner_img = t_partner_img;
		this.t_partner_tel = t_partner_tel;
	}

	public int getT_partner_seq() {
		return t_partner_seq;
	}

	public void setT_partner_seq(int t_partner_seq) {
		this.t_partner_seq = t_partner_seq;
	}

	public String getT_partner_name() {
		return t_partner_name;
	}

	public void setT_partner_name(String t_partner_name) {
		this.t_partner_name = t_partner_name;
	}

	public String getT_partner_intro() {
		return t_partner_intro;
	}

	public void setT_partner_intro(String t_partner_intro) {
		this.t_partner_intro = t_partner_intro;
	}

	public String getT_partner_info() {
		return t_partner_info;
	}

	public void setT_partner_info(String t_partner_info) {
		this.t_partner_info = t_partner_info;
	}

	public String getT_partner_img() {
		return t_partner_img;
	}

	public void setT_partner_img(String t_partner_img) {
		this.t_partner_img = t_partner_img;
	}

	public String getT_partner_tel() {
		return t_partner_tel;
	}

	public void setT_partner_tel(String t_partner_tel) {
		this.t_partner_tel = t_partner_tel;
	}
	

}