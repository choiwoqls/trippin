package vo.sche;

public class StyleVO {
	
	private int style_seq;
	private String style_what;
	
	public StyleVO() {
		
	}
	public StyleVO(int style_seq, String style_what) {
		this.style_seq=style_seq;
		this.style_what=style_what;
	}
	public int getStyle_seq() {
		return style_seq;
	}
	public void setStyle_seq(int style_seq) {
		this.style_seq = style_seq;
	}
	public String getStyle_what() {
		return style_what;
	}
	public void setStyle_what(String style_what) {
		this.style_what = style_what;
	}
	
	

}
