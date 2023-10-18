package vo.common;

public class Addr2VO {

	private int addr2_seq;
	private int addr1_seq;
	private String addr2_name;	
	
	public Addr2VO() {
		
	}
	
	public Addr2VO(int addr2_seq, int addr1_seq, String addr2_name) {
		this.addr2_seq = addr2_seq;
		this.addr1_seq = addr1_seq;
		this.addr2_name = addr2_name;
	}

	public int getaddr2_seq() {
		return addr2_seq;
	}

	public void setaddr2_seq(int addr2_seq) {
		this.addr2_seq = addr2_seq;
	}

	public int getAddr1_seq() {
		return addr1_seq;
	}

	public void setAddr1_seq(int addr1_seq) {
		this.addr1_seq = addr1_seq;
	}

	public String getaddr2_name() {
		return addr2_name;
	}

	public void setaddr2_name(String addr2_name) {
		this.addr2_name = addr2_name;
	}
}
