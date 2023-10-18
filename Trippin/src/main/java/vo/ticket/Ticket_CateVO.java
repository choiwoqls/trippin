package vo.ticket;


public class Ticket_CateVO {

	private int ticket_cate_seq;
	private String ticket_cate_name;

	public Ticket_CateVO() {
		
	}

	public Ticket_CateVO(int ticket_cate_seq, String ticket_cate_name) {
		super();
		this.ticket_cate_seq = ticket_cate_seq;
		this.ticket_cate_name = ticket_cate_name;
	}

	public int getTicket_cate_seq() {
		return ticket_cate_seq;
	}

	public void setTicket_cate_seq(int ticket_cate_seq) {
		this.ticket_cate_seq = ticket_cate_seq;
	}

	public String getTicket_cate_name() {
		return ticket_cate_name;
	}

	public void setTicket_cate_name(String ticket_cate_name) {
		this.ticket_cate_name = ticket_cate_name;
	}
	
	


}