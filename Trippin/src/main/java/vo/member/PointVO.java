package vo.member;

public class PointVO {
	
	
	private int p_seq; 
	private String p_standard; 
	private String p_table;
	private String p_content; 
	private String p_url; 
	private String p_score;
	
	public PointVO() {
	}

	public PointVO(int p_seq, String p_standard, String p_table, String p_content, String p_url, String p_score) {
		this.p_seq = p_seq;
		this.p_standard = p_standard;
		this.p_table = p_table;
		this.p_content = p_content;
		this.p_url = p_url;
		this.p_score = p_score;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getP_standard() {
		return p_standard;
	}

	public void setP_standard(String p_standard) {
		this.p_standard = p_standard;
	}

	public String getP_table() {
		return p_table;
	}

	public void setP_table(String p_table) {
		this.p_table = p_table;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_url() {
		return p_url;
	}

	public void setP_url(String p_url) {
		this.p_url = p_url;
	}

	public String getP_score() {
		return p_score;
	}

	public void setP_score(String p_score) {
		this.p_score = p_score;
	}

	
	
	

}
