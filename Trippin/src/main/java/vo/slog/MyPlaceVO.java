package vo.slog;

public class MyPlaceVO {
	
	private int myplace_seq;
	private int m_seq;
	private String name;
	private String addr;
	private int kind;
	private int myplace_status;
	private int wi;
	private int kyung;
	
	public MyPlaceVO() {
		
	}
	
	public MyPlaceVO(int myplace_seq, int m_seq, String name, String addr, int kind, int myplace_status, int wi, int kyung) {
		this.myplace_seq=myplace_seq;
		this.m_seq=m_seq;
		this.name=name;
		this.addr=addr;
		this.kind=kind;
		this.myplace_status=myplace_status;
		this.wi=wi;
		this.kyung=kyung;
	}
	
	public MyPlaceVO( int m_seq, String name, String addr, int kind, int myplace_status, int wi, int kyung) {
		this.m_seq=m_seq;
		this.name=name;
		this.addr=addr;
		this.kind=kind;
		this.myplace_status=myplace_status;
		this.wi=wi;
		this.kyung=kyung;
	}

	public int getMyplace_seq() {
		return myplace_seq;
	}

	public void setMyplace_seq(int myplace_seq) {
		this.myplace_seq = myplace_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getMyplace_status() {
		return myplace_status;
	}

	public void setMyplace_status(int myplace_status) {
		this.myplace_status = myplace_status;
	}

	public int getWi() {
		return wi;
	}

	public void setWi(int wi) {
		this.wi = wi;
	}

	public int getKyung() {
		return kyung;
	}

	public void setKyung(int kyung) {
		this.kyung = kyung;
	}
	
	
	

}
