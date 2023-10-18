package vo.slog;

public class Day_SlogVO {
	
	private int day_slog_seq;
	private int slog_seq;
	private int day_no;
	private String content;
	private String sdate;
	private String ydate;

	public Day_SlogVO() {
		
	}

	public Day_SlogVO(int day_slog_seq, int slog_seq, int day_no, String content, String sdate, String ydate) {
		this.day_slog_seq=day_slog_seq;
		this.slog_seq=slog_seq;
		this.day_no=day_no;
		this.content=content;
		this.sdate=sdate;
		this.ydate=ydate;
	}
	
	public Day_SlogVO(int slog_seq, int day_no, String content, String date, String ydate) {
		this.slog_seq=slog_seq;
		this.day_no=day_no;
		this.content=content;
		this.sdate=date;
		this.ydate=ydate;
	}
	
	
	

	public String getYdate() {
		return ydate;
	}

	public void setYdate(String ydate) {
		this.ydate = ydate;
	}

	public int getDay_slog_seq() {
		return day_slog_seq;
	}

	public void setDay_slog_seq(int day_slog_seq) {
		this.day_slog_seq = day_slog_seq;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}


	public int getSlog_seq() {
		return slog_seq;
	}

	public void setSlog_seq(int slog_seq) {
		this.slog_seq = slog_seq;
	}

	public int getDay_no() {
		return day_no;
	}

	public void setDay_no(int day_no) {
		this.day_no = day_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

}
