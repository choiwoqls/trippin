package vo.ticket;


public class Ccp_WordVO {

	private int ccp_word_seq;
	private int ticket_seq;
	private int ccp_seq;
	private String word;

	public Ccp_WordVO() {
		
	}

	public Ccp_WordVO(int ccp_word_seq, int ticket_seq, int ccp_seq, String word) {
		super();
		this.ccp_word_seq = ccp_word_seq;
		this.ticket_seq = ticket_seq;
		this.ccp_seq = ccp_seq;
		this.word = word;
	}

	public int getCcp_word_seq() {
		return ccp_word_seq;
	}

	public void setCcp_word_seq(int ccp_word_seq) {
		this.ccp_word_seq = ccp_word_seq;
	}

	public int getTicket_seq() {
		return ticket_seq;
	}

	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}

	public int getCcp_seq() {
		return ccp_seq;
	}

	public void setCcp_seq(int ccp_seq) {
		this.ccp_seq = ccp_seq;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	

}