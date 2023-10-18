package vo.sche;

public class CityVO {

	private int city_seq;
	private int s_seq;
	private int addr1_seq;
	private int num;
	
	public CityVO() {

	}
	
	public CityVO(int city_seq, int s_seq, int addr1_seq, int num) {
		this.city_seq=city_seq;
		this.s_seq=s_seq;
		this.addr1_seq=addr1_seq;
		this.num=num;
	}

	public CityVO(int s_seq, int addr1_seq, int num) {
		this.s_seq=s_seq;
		this.addr1_seq=addr1_seq;
		this.num=num;
	}

	public int getCity_seq() {
		return city_seq;
	}

	public void setCity_seq(int city_seq) {
		this.city_seq = city_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getAddr1_seq() {
		return addr1_seq;
	}

	public void setAddr1_seq(int addr1_seq) {
		this.addr1_seq = addr1_seq;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	
	
	
}
