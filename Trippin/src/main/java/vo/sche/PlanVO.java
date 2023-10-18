package vo.sche;

public class PlanVO {

	private int plan_seq;
	private int s_seq;
	private int day_no;
	private int num;
	private int f_seq;
	private String memo;
	private String time;
	
	public PlanVO() {
	
	}
	
	public PlanVO(int plan_seq, int s_seq, int day_no, int num, int f_seq, String memo, String time) {
		this.plan_seq=plan_seq;
		this.s_seq=s_seq;
		this.day_no=day_no;
		this.num=num;
		this.f_seq=f_seq; 
		this.memo=memo;
		this.time=time;
	}
	
	public PlanVO(int s_seq, int day_no, int num, int f_seq, String memo, String time) {
		this.s_seq=s_seq;
		this.day_no=day_no;
		this.num=num;
		this.f_seq=f_seq;
		this.memo=memo;
		this.time=time;
	}

	public int getPlan_seq() {
		return plan_seq;
	}

	public void setPlan_seq(int plan_seq) {
		this.plan_seq = plan_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getDay_no() {
		return day_no;
	}

	public void setDay_no(int day_no) {
		this.day_no = day_no;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
	
}
