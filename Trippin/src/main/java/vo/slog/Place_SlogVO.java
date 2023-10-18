package vo.slog;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Place_SlogVO {
	
	private int place_slog_seq;
	private int slog_seq;
	private int day_slog_seq;
	private int stars;
	private String content;
	private String img;
	private int day_no;
	private int num;
	private int place;
	private int board_no;
	private String memo;
	
	private List<MultipartFile> files;

	public Place_SlogVO() {

	}
	
	public Place_SlogVO(int place_slog_seq, int slog_seq, int day_slog_seq, int stars, String content, String img, int day_no, int num, int place, int board_no, String memo) {
		this.place_slog_seq=place_slog_seq;
		this.slog_seq=slog_seq;
		this.day_slog_seq=day_slog_seq;
		this.stars=stars;
		this.content=content;
		this.img=img;
		this.day_no=day_no;
		this.num=num;
		this.place=place;
		this.board_no=board_no;
		this.memo=memo;
	}
	
	public Place_SlogVO(int slog_seq, int day_slog_seq, int stars, String content, String img, int day_no, int num, int place, int board_no, String memo) {
		this.slog_seq=slog_seq;
		this.day_slog_seq=day_slog_seq;
		this.stars=stars;
		this.content=content;
		this.img=img;
		this.day_no=day_no;
		this.num=num;
		this.place=place;
		this.board_no=board_no;
		this.memo=memo;
	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public int getPlace_slog_seq() {
		return place_slog_seq;
	}

	public void setPlace_slog_seq(int place_slog_seq) {
		this.place_slog_seq = place_slog_seq;
	}

	public int getSlog_seq() {
		return slog_seq;
	}

	public void setSlog_seq(int slog_seq) {
		this.slog_seq = slog_seq;
	}

	public int getDay_slog_seq() {
		return day_slog_seq;
	}

	public void setDay_slog_seq(int day_slog_seq) {
		this.day_slog_seq = day_slog_seq;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public int getPlace() {
		return place;
	}

	public void setPlace(int place) {
		this.place = place;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
}
