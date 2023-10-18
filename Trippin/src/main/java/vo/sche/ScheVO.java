package vo.sche;

import java.sql.Date;

public class ScheVO {

	private int s_seq;
	private String title;
	private String partnerlist;
	private String nugu_seq;
	private String style_seq;
	private Date firstday;
	private Date lastday;
	
	public ScheVO() {

	}
	
	public ScheVO(int s_seq, String title, String partnerlist, String nugu_seq, String style_seq, Date firstday,Date lastday) {
		this.s_seq=s_seq;
		this.title=title;
		this.partnerlist=partnerlist;
		this.nugu_seq=nugu_seq;
		this.style_seq=style_seq;
		this.firstday=firstday;
		this.lastday=lastday;
	}
	
	public ScheVO(String title, String partnerlist, String nugu_seq, String style_seq, Date firstday,Date lastday) {
		this.title=title;
		this.partnerlist=partnerlist;
		this.nugu_seq=nugu_seq;
		this.style_seq=style_seq;
		this.firstday=firstday;
		this.lastday=lastday;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPartnerlist() {
		return partnerlist;
	}

	public void setPartnerlist(String partnerlist) {
		this.partnerlist = partnerlist;
	}

	public String getNugu_seq() {
		return nugu_seq;
	}

	public void setNugu_seq(String nugu_seq) {
		this.nugu_seq = nugu_seq;
	}

	public String getStyle_seq() {
		return style_seq;
	}

	public void setStyle_seq(String style_seq) {
		this.style_seq = style_seq;
	}

	public Date getFirstday() {
		return firstday;
	}

	public void setFirstday(Date firstday) {
		this.firstday = firstday;
	}

	public Date getLastday() {
		return lastday;
	}

	public void setLastday(Date lastday) {
		this.lastday = lastday;
	}
	
	
	
	
	
	
	
	
	
}
