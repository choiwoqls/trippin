package vo.common;

import org.springframework.web.multipart.MultipartFile;

public class FormVO {


	private int f_seq;
	private int cate_seq;
	private int kind;
	private String name;
	private String intro;
	private int addr2_seq;
	private String addr;
	private String addr_detail;
	private String wi;
	private String kyung;
	private String way;
	private String tel;
	private String website;
	private String main_img;
	
	private MultipartFile photo;
	
	
	//--------------------------------------------------------
	private String cate_name;
	
	
	
	public FormVO() {
		
	}

	public FormVO(int f_seq, int cate_seq, int kind, String name, String intro, int addr2_seq, String addr,
			String addr_detail, String wi, String kyung, String way, String tel, String website, String main_img) {
		this.f_seq = f_seq;
		this.cate_seq = cate_seq;
		this.kind = kind;
		this.name = name;
		this.intro = intro;
		this.addr2_seq = addr2_seq;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.wi = wi;
		this.kyung = kyung;
		this.way = way;
		this.tel = tel;
		this.website = website;
		this.main_img = main_img;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getCate_seq() {
		return cate_seq;
	}

	public void setCate_seq(int cate_seq) {
		this.cate_seq = cate_seq;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getAddr2_seq() {
		return addr2_seq;
	}

	public void setAddr2_seq(int addr2_seq) {
		this.addr2_seq = addr2_seq;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getWi() {
		return wi;
	}

	public void setWi(String wi) {
		this.wi = wi;
	}

	public String getKyung() {
		return kyung;
	}

	public void setKyung(String kyung) {
		this.kyung = kyung;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	
	

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	//--------------------------------------------------------
	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	//==================================================
	
	private int addr1_seq;

	public int getAddr1_seq() {
		return addr1_seq;
	}

	public void setAddr1_seq(int addr1_seq) {
		this.addr1_seq = addr1_seq;
	}
	
		

}
