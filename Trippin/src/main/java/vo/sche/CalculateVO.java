package vo.sche;

public class CalculateVO {

	private int calculate_seq;
	private int b_sender_seq;
	private int b_receiver_seq;
	private int send_money;
	private int s_seq;
	
	public CalculateVO() {
		
	}
	
	public CalculateVO(int calculate_seq, int b_sender_seq, int b_receiver_seq, int send_money, int s_seq) {
		this.calculate_seq=calculate_seq;
		this.b_sender_seq=b_sender_seq;
		this.b_receiver_seq=b_receiver_seq;
		this.send_money=send_money;
		this.s_seq=s_seq;
	}
	
	public CalculateVO(int b_sender_seq, int b_receiver_seq, int send_money, int s_seq) {
		this.b_sender_seq=b_sender_seq;
		this.b_receiver_seq=b_receiver_seq;
		this.send_money=send_money;
		this.s_seq=s_seq;
	}
	
	

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getCalculate_seq() {
		return calculate_seq;
	}

	public void setCalculate_seq(int calculate_seq) {
		this.calculate_seq = calculate_seq;
	}

	public int getB_sender_seq() {
		return b_sender_seq;
	}

	public void setB_sender_seq(int b_sender_seq) {
		this.b_sender_seq = b_sender_seq;
	}

	public int getB_receiver_seq() {
		return b_receiver_seq;
	}

	public void setB_receiver_seq(int b_receiver_seq) {
		this.b_receiver_seq = b_receiver_seq;
	}

	public int getSend_money() {
		return send_money;
	}

	public void setSend_money(int send_money) {
		this.send_money = send_money;
	}
	
	
	
}
