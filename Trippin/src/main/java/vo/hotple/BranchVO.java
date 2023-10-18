package vo.hotple;


public class BranchVO {

	private int branch_seq;
	private int f_seq;
	private String branch_no;
	
	public BranchVO() {
		
	}
	
	public BranchVO(int branch_seq, int f_seq, String branch_no) {
		this.branch_seq = branch_seq;
		this.f_seq = f_seq;
		this.branch_no = branch_no;
	}

	public int getBranch_seq() {
		return branch_seq;
	}

	public void setBranch_seq(int branch_seq) {
		this.branch_seq = branch_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getBranch_no() {
		return branch_no;
	}

	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}
	
	

	
	
	
	
	


}