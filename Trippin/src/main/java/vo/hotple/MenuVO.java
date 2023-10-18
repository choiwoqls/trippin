package vo.hotple;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	
	private int menu_seq;
	private int f_seq;
	private String name;
	private String info;
	private String price;
	private String price_detail;
	private String menu_img;
	
	public MenuVO() {
		
	}

	public MenuVO(int menu_seq, int f_seq, String name, String info, String price, String price_detail,
			String menu_img) {
		super();
		this.menu_seq = menu_seq;
		this.f_seq = f_seq;
		this.name = name;
		this.info = info;
		this.price = price;
		this.price_detail = price_detail;
		this.menu_img = menu_img;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPrice_detail() {
		return price_detail;
	}

	public void setPrice_detail(String price_detail) {
		this.price_detail = price_detail;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	
	//===================================================
//	private List<MultipartFile> photos;
//
//	public List<MultipartFile> getPhotos() {
//		return photos;
//	}
//
//	public void setPhotos(List<MultipartFile> photos) {
//		this.photos = photos;
//	}
	
	private MultipartFile[] photos;

	public MultipartFile[] getPhotos() {
		return photos;
	}

	public void setPhotos(MultipartFile[] photos) {
		this.photos = photos;
	}

	
	

}