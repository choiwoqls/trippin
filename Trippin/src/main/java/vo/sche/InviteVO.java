package vo.sche;

public class InviteVO {

	private int invite_seq;
	private int sender_seq;
	private int receiver_seq;
	private int s_seq;
	private int status;
	
	public InviteVO() {
		
	}

	public InviteVO(int invite_seq, int sender_seq, int receiver_seq, int s_seq, int status)  {
		this.invite_seq=invite_seq;
		this.sender_seq=sender_seq;
		this.receiver_seq=receiver_seq;
		this.s_seq=s_seq;
		this.status=status;
	}
	
	public InviteVO(int sender_seq, int receiver_seq, int s_seq, int status) {
		this.sender_seq=sender_seq;
		this.receiver_seq=receiver_seq;
		this.s_seq=s_seq;
		this.status=status;
	}

	public int getInvite_seq() {
		return invite_seq;
	}

	public void setInvite_seq(int invite_seq) {
		this.invite_seq = invite_seq;
	}

	public int getSender_seq() {
		return sender_seq;
	}

	public void setSender_seq(int sender_seq) {
		this.sender_seq = sender_seq;
	}

	public int getReceiver_seq() {
		return receiver_seq;
	}

	public void setReceiver_seq(int receiver_seq) {
		this.receiver_seq = receiver_seq;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
}
