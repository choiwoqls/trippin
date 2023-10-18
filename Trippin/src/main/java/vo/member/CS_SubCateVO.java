package vo.member;

public class CS_SubCateVO {

	private int cs_subcate_seq;
	private int cs_cate_seq;
	private String cs_subcate_name;
	
	
	public CS_SubCateVO() {
	}


	public int getCs_subcate_seq() {
		return cs_subcate_seq;
	}


	public void setCs_subcate_seq(int cs_subcate_seq) {
		this.cs_subcate_seq = cs_subcate_seq;
	}


	public int getCs_cate_seq() {
		return cs_cate_seq;
	}


	public void setCs_cate_seq(int cs_cate_seq) {
		this.cs_cate_seq = cs_cate_seq;
	}


	public String getCs_subcate_name() {
		return cs_subcate_name;
	}


	public void setCs_subcate_name(String cs_subcate_name) {
		this.cs_subcate_name = cs_subcate_name;
	}
	
	//------------------------------------
	private String cs_cate_name;


	public String getCs_cate_name() {
		return cs_cate_name;
	}


	public void setCs_cate_name(String cs_cate_name) {
		this.cs_cate_name = cs_cate_name;
	}
	//--------------------------------------------------
	
	private int cs_seq;

	private String title;
	private String content;


	public int getCs_seq() {
		return cs_seq;
	}


	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	

}
