package vo.member;


public class M_Report_CateVO {

	private int m_report_cate_seq;
	private String m_report_cate_name;
	private int score;
	
	public M_Report_CateVO() {
		
	}

	public M_Report_CateVO(int m_report_cate_seq, String m_report_cate_name, int score) {
		super();
		this.m_report_cate_seq = m_report_cate_seq;
		this.m_report_cate_name = m_report_cate_name;
		this.score = score;
	}

	public int getM_report_cate_seq() {
		return m_report_cate_seq;
	}

	public void setM_report_cate_seq(int m_report_cate_seq) {
		this.m_report_cate_seq = m_report_cate_seq;
	}

	public String getM_report_cate_name() {
		return m_report_cate_name;
	}

	public void setM_report_cate_name(String m_report_cate_name) {
		this.m_report_cate_name = m_report_cate_name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	
	
}
