package vo.sche;

public class Clist_ItemsVO {
	
	private int clist_items_seq;
	private int clist_cate_seq;
	private int m_seq;
	private String item;
	private String detail;
	private int status;
	
	

	
	public Clist_ItemsVO() {
		// TODO Auto-generated constructor stub
	}


	public int getClist_items_seq() {
		return clist_items_seq;
	}


	public void setClist_items_seq(int clist_items_seq) {
		this.clist_items_seq = clist_items_seq;
	}


	public int getClist_cate_seq() {
		return clist_cate_seq;
	}


	public void setClist_cate_seq(int clist_cate_seq) {
		this.clist_cate_seq = clist_cate_seq;
	}


	public int getM_seq() {
		return m_seq;
	}


	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}


	public String getItem() {
		return item;
	}


	public void setItem(String item) {
		this.item = item;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}
	
	//------------------------------------------------------------------------
	
	private String clist_cate_name;




	public String getClist_cate_name() {
		return clist_cate_name;
	}


	public void setClist_cate_name(String clist_cate_name) {
		this.clist_cate_name = clist_cate_name;
	}
	
	

}
