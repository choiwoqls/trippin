package vo.common;

public class CateVO {

	private int cate_seq;
	private String cate_name;
	
	public CateVO() {
		
	}
	
	public CateVO(int cate_seq, String cate_name) {
		this.cate_seq = cate_seq;
		this.cate_name = cate_name;
	}

	public int getCate_seq() {
		return cate_seq;
	}

	public void setCate_seq(int cate_seq) {
		this.cate_seq = cate_seq;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	


}
