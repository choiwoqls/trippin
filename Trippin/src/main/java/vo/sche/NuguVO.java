package vo.sche;

public class NuguVO {
	
	private int nugu_seq;
	private String nugu_who;
	
	public NuguVO() {
		
	}
	public NuguVO(int nugu_seq, String nugu_who) {
		this.nugu_seq=nugu_seq;
		this.nugu_who=nugu_who;
	}
	public int getNugu_seq() {
		return nugu_seq;
	}
	public void setNugu_seq(int nugu_seq) {
		this.nugu_seq = nugu_seq;
	}
	public String getNugu_who() {
		return nugu_who;
	}
	public void setNugu_who(String nugu_who) {
		this.nugu_who = nugu_who;
	}

	
}
