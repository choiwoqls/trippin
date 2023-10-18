package vo.member;


public class Report_CateVO {

	private int  report_cate_seq;
	private String report_cate_name;
	private  int score;
	
	public Report_CateVO() {
		
	}

	public Report_CateVO(int report_cate_seq, String report_cate_name, int score) {
		super();
		this.report_cate_seq = report_cate_seq;
		this.report_cate_name = report_cate_name;
		this.score = score;
	}

	public int getReport_cate_seq() {
		return report_cate_seq;
	}

	public void setReport_cate_seq(int report_cate_seq) {
		this.report_cate_seq = report_cate_seq;
	}

	public String getReport_cate_name() {
		return report_cate_name;
	}

	public void setReport_cate_name(String report_cate_name) {
		this.report_cate_name = report_cate_name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	

	
}
