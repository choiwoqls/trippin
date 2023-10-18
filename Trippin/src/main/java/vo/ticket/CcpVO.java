package vo.ticket;


public class CcpVO {

	private int ccp_seq;
	private String sentence;

	public CcpVO() {
		
	}

	public CcpVO(int ccp_seq, String sentence) {
		super();
		this.ccp_seq = ccp_seq;
		this.sentence = sentence;
	}

	public int getCcp_seq() {
		return ccp_seq;
	}

	public void setCcp_seq(int ccp_seq) {
		this.ccp_seq = ccp_seq;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	
}