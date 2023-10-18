package vo.common;


public class PayVO {

	private int pay_seq;
	private String pay_name;
	private String dc_info;
	private String img;
	
	public PayVO() {
		
	}

	public PayVO(int pay_seq, String pay_name, String dc_info, String img) {
		super();
		this.pay_seq = pay_seq;
		this.pay_name = pay_name;
		this.dc_info = dc_info;
		this.img = img;
	}

	public int getPay_seq() {
		return pay_seq;
	}

	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public String getDc_info() {
		return dc_info;
	}

	public void setDc_info(String dc_info) {
		this.dc_info = dc_info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}