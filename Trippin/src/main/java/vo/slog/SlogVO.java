package vo.slog;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SlogVO {

	private int slog_seq;
	private String addrlist;
	private String nugu_seq;
	private String style_seq;
	private int m_seq;
	private String title;
	private String intro;
	private String img;
	private Date datetime;
	private String night;
	private String month;
	private int loca_cnt;
	private int status;
	private int score;
	private int s_seq;
	
	private List<MultipartFile> files;
	
	public SlogVO() {
	
	}

	public SlogVO(int slog_seq, String addrlist, String nugu_seq, String style_seq, int m_seq, String title,
			String intro, String img, Date datetime, String night, String month, int loca_cnt, int status, int score ,int s_seq) {
		this.slog_seq = slog_seq;
		this.addrlist = addrlist;
		this.nugu_seq = nugu_seq;
		this.style_seq = style_seq;
		this.m_seq = m_seq;
		this.title = title;
		this.intro = intro;
		this.img = img;
		this.datetime = datetime;
		this.night = night;
		this.month = month;
		this.loca_cnt = loca_cnt;
		this.status = status;
		this.score = score;
		this.s_seq = s_seq;
	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public int getS_seq() {
		return s_seq;
	}

	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}

	public int getSlog_seq() {
		return slog_seq;
	}

	public void setSlog_seq(int slog_seq) {
		this.slog_seq = slog_seq;
	}

	public String getAddrlist() {
		return addrlist;
	}

	public void setAddrlist(String addrlist) {
		this.addrlist = addrlist;
	}

	public String getNugu_seq() {
		return nugu_seq;
	}

	public void setNugu_seq(String nugu_seq) {
		this.nugu_seq = nugu_seq;
	}

	public String getStyle_seq() {
		return style_seq;
	}

	public void setStyle_seq(String style_seq) {
		this.style_seq = style_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public String getNight() {
		return night;
	}

	public void setNight(String night) {
		this.night = night;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getLoca_cnt() {
		return loca_cnt;
	}

	public void setLoca_cnt(int loca_cnt) {
		this.loca_cnt = loca_cnt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	
	
	
	
	
	
}
