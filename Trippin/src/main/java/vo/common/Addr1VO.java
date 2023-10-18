package vo.common;

public class Addr1VO {

	private int addr1_seq;
	private String addr1_name;	
	
	public Addr1VO() {
		
	}
	
	public Addr1VO(int addr1_seq, String addr1_name) {
		this.addr1_seq = addr1_seq;
		this.addr1_name = addr1_name;
	}

	public int getAddr1_seq() {
		return addr1_seq;
	}

	public void setAddr1_seq(int addr1_seq) {
		this.addr1_seq = addr1_seq;
	}

	public String getAddr1_name() {
		return addr1_name;
	}

	public void setAddr1_name(String addr1_name) {
		this.addr1_name = addr1_name;
	}
	
}
