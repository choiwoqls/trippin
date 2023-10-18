package vo.ticket;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TicketVO {

	private int ticket_seq;
	private String ticket_cate_no;
	private String ticket_img;
	private String ticket_name;
	private String ticket_intro;
	private int addr2_seq;
	private Integer voucher;
	private Integer cancel_status;
	private String usemethod;
	private int t_partner_seq;
	private String title;
	private String content;
	private Date sell_date;
	private Integer valid_type;
	private String valid_date;
	private Integer min_pp;
	private String tour_type;
	private String language;
	private String use_condition;
	private String ticket_summer;
	private String special_info;
	private String use_info;
	private String include;
	private String not_include;
	private String more_info;
	private String faq;
	
//	private List<TicketVO> tvolist;
	
	
	private List<MultipartFile> files;
	
	

	public TicketVO() {
		
	}



	public TicketVO(int ticket_seq, String ticket_cate_no, String ticket_img, String ticket_name, String ticket_intro,
			int addr2_seq, int voucher, int cancel_status, String usemethod, int t_partner_seq, String title,
			String content, Date sell_date, int valid_type, String valid_date, int min_pp, String tour_type,
			String language, String use_condition, String ticket_summer, String special_info, String use_info,
			String include, String not_include, String more_info, String faq) {
		this.ticket_seq = ticket_seq;
		this.ticket_cate_no = ticket_cate_no;
		this.ticket_img = ticket_img;
		this.ticket_name = ticket_name;
		this.ticket_intro = ticket_intro;
		this.addr2_seq = addr2_seq;
		this.voucher = voucher;
		this.cancel_status = cancel_status;
		this.usemethod = usemethod;
		this.t_partner_seq = t_partner_seq;
		this.title = title;
		this.content = content;
		this.sell_date = sell_date;
		this.valid_type = valid_type;
		this.valid_date = valid_date;
		this.min_pp = min_pp;
		this.tour_type = tour_type;
		this.language = language;
		this.use_condition = use_condition;
		this.ticket_summer = ticket_summer;
		this.special_info = special_info;
		this.use_info = use_info;
		this.include = include;
		this.not_include = not_include;
		this.more_info = more_info;
		this.faq = faq;
		/* this.tvolist = tvolist; */
	}



	public int getTicket_seq() {
		return ticket_seq;
	}



	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}



	public String getTicket_cate_no() {
		return ticket_cate_no;
	}



	public void setTicket_cate_no(String ticket_cate_no) {
		this.ticket_cate_no = ticket_cate_no;
	}



	public String getTicket_img() {
		return ticket_img;
	}



	public void setTicket_img(String ticket_img) {
		this.ticket_img = ticket_img;
	}



	public String getTicket_name() {
		return ticket_name;
	}



	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}



	public String getTicket_intro() {
		return ticket_intro;
	}



	public void setTicket_intro(String ticket_intro) {
		this.ticket_intro = ticket_intro;
	}



	public int getAddr2_seq() {
		return addr2_seq;
	}



	public void setAddr2_seq(int addr2_seq) {
		this.addr2_seq = addr2_seq;
	}



	public Integer getVoucher() {
		return voucher;
	}



	public void setVoucher(Integer voucher) {
		this.voucher = voucher;
	}



	public Integer getCancel_status() {
		return cancel_status;
	}



	public void setCancel_status(Integer cancel_status) {
		this.cancel_status = cancel_status;
	}



	public String getUsemethod() {
		return usemethod;
	}



	public void setUsemethod(String usemethod) {
		this.usemethod = usemethod;
	}



	public int getT_partner_seq() {
		return t_partner_seq;
	}



	public void setT_partner_seq(int t_partner_seq) {
		this.t_partner_seq = t_partner_seq;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getSell_date() {
		return sell_date;
	}



	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}



	public Integer getValid_type() {
		return valid_type;
	}



	public void setValid_type(Integer valid_type) {
		this.valid_type = valid_type;
	}



	public String getValid_date() {
		return valid_date;
	}



	public void setValid_date(String valid_date) {
		this.valid_date = valid_date;
	}



	public Integer getMin_pp() {
		return min_pp;
	}



	public void setMin_pp(Integer min_pp) {
		this.min_pp = min_pp;
	}



	public String getTour_type() {
		return tour_type;
	}



	public void setTour_type(String tour_type) {
		this.tour_type = tour_type;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public String getUse_condition() {
		return use_condition;
	}



	public void setUse_condition(String use_condition) {
		this.use_condition = use_condition;
	}



	public String getTicket_summer() {
		return ticket_summer;
	}



	public void setTicket_summer(String ticket_summer) {
		this.ticket_summer = ticket_summer;
	}



	public String getSpecial_info() {
		return special_info;
	}



	public void setSpecial_info(String special_info) {
		this.special_info = special_info;
	}



	public String getUse_info() {
		return use_info;
	}



	public void setUse_info(String use_info) {
		this.use_info = use_info;
	}



	public String getInclude() {
		return include;
	}



	public void setInclude(String include) {
		this.include = include;
	}



	public String getNot_include() {
		return not_include;
	}



	public void setNot_include(String not_include) {
		this.not_include = not_include;
	}



	public String getMore_info() {
		return more_info;
	}



	public void setMore_info(String more_info) {
		this.more_info = more_info;
	}



	public String getFaq() {
		return faq;
	}



	public void setFaq(String faq) {
		this.faq = faq;
	}



	public List<MultipartFile> getFiles() {
		return files;
	}



	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}



//	public List<TicketVO> getTvolist() {
//		return tvolist;
//	}
//
//
//
//	public void setTvolist(List<TicketVO> tvolist) {
//		this.tvolist = tvolist;
//	}


	


	
	
}