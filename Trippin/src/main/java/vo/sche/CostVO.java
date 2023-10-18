package vo.sche;

public class CostVO {

	private int cost_seq;
	private int s_seq;
	private int m_seq;
	private int day_no;
	private int num;
	private String content;
	private int kind;
	private int tot_money;
	private String place_name;
	private int alone;
	private int payment;
	private String cost_img;
	
	public CostVO() {

	}
	
	public CostVO(int cost_seq, int s_seq, int m_seq, int day_no, int num, String content, int kind, int tot_money, String place_name, int alone, int payment, String cost_img) {
		this.cost_seq=cost_seq;
		this.s_seq=s_seq;
		this.m_seq=m_seq;
		this.day_no=day_no;
		this.num=num;
		this.content=content;
		this.kind=kind;
		this.tot_money=tot_money;
		this.place_name=place_name;
		this.alone=alone;
		this.payment=payment;
		this.cost_img=cost_img;
	}
	
	public CostVO(int s_seq, int m_seq, int day_no, int num, String content, int kind, int tot_money, String place_name, int alone, int payment, String cost_img) {		
		this.s_seq=s_seq;
		this.m_seq=m_seq;
		this.day_no=day_no;
		this.num=num;
		this.content=content;
		this.kind=kind;
		this.tot_money=tot_money;
		this.place_name=place_name;
		this.alone=alone;
		this.payment=payment;
		this.cost_img=cost_img;
	}

	public int getCost_seq() {
		return cost_seq;
	}

	public void setCost_seq(int cost_seq) {
		this.cost_seq = cost_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getTot_money() {
		return tot_money;
	}

	public void setTot_money(int tot_money) {
		this.tot_money = tot_money;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public int getAlone() {
		return alone;
	}

	public void setAlone(int alone) {
		this.alone = alone;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getCost_img() {
		return cost_img;
	}

	public void setCost_img(String cost_img) {
		this.cost_img = cost_img;
	}
	
	
	
	
	
	
}
