package vo.accom;

public class InfoVO {

	private int info_seq;
	private int f_seq;
	private int info_cate_seq;
	private String info_content;
	
	public InfoVO() {
		
	}
	
	public InfoVO(int info_seq, int f_seq, int info_cate_seq, String info_content) {
		this.info_seq = info_seq;
		this.f_seq = f_seq;
		this.info_cate_seq = info_cate_seq;
		this.info_content = info_content;
	}

	public int getInfo_seq() {
		return info_seq;
	}

	public void setInfo_seq(int info_seq) {
		this.info_seq = info_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getInfo_cate_seq() {
		return info_cate_seq;
	}

	public void setInfo_cate_seq(int info_cate_seq) {
		this.info_cate_seq = info_cate_seq;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
}
