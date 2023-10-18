package vo.ticket;

public class Include_ItemsVO {
	
	private int include_items_seq;
	private String include_item;
	
	public Include_ItemsVO() {
	}

	public Include_ItemsVO(int include_items_seq, String include_item) {
		this.include_items_seq = include_items_seq;
		this.include_item = include_item;
	}

	public int getInclude_items_seq() {
		return include_items_seq;
	}

	public void setInclude_items_seq(int include_items_seq) {
		this.include_items_seq = include_items_seq;
	}

	public String getInclude_item() {
		return include_item;
	}

	public void setInclude_item(String include_item) {
		this.include_item = include_item;
	}
	
	
	
}
