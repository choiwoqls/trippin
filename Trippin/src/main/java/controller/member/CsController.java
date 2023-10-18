package controller.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.ViewPath;
import service.member.CsService;
import service.member.MemberService;
import vo.accom.PaymentVO;
import vo.member.CSVO;
import vo.member.CS_CateVO;
import vo.member.CS_SubCateVO;
import vo.member.C_InquiryVO;
import vo.member.InquiryVO;
import vo.member.MemberVO;
import vo.ticket.T_PurchaseVO;
import common.Paging;

@Configuration
@PropertySource(value = { "classpath:config/globals.properties" })

@Controller
public class CsController {
	private MemberService memberService;
	private CsService csService;

	@Value("${globals.dir}")
	private String FILEPATH;

	public CsController(CsService csService, MemberService memberService) {
		this.csService = csService;
		this.memberService = memberService;

	}

	@RequestMapping("/member/cs")
	public String CS(Model model,HttpServletRequest request) {

		List<CS_CateVO> csCateList = csService.csCateAll();
		
		Integer login = (Integer)request.getSession().getAttribute("login"); 
		
		if(login == null) {
			return ViewPath.LOGIN+"goLogin.jsp";
		}

		model.addAttribute("csCateList", csCateList);
		model.addAttribute("login", login);

		return ViewPath.MEMBER + "cs/home.jsp";
	}

	@RequestMapping("/member/cs/all")
	public String CSAll(Model model, String word, Integer page) {

		if (page == null) {
			page = 1;
		}

		List<CS_CateVO> csCateList = csService.csCateAll();
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("word", word);

		int boardCount = csService.cgetTotal(map);

		Paging paging = new Paging(page, boardCount);

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		
		
		model.addAttribute("csCateList",csCateList);
		model.addAttribute("paging", paging);

		return ViewPath.MEMBER + "cs/all.jsp";
	}
	
	

	@RequestMapping("/member/cs/content/{cs_seq}")
	public String CS_content(Model model, @PathVariable("cs_seq") int cs_seq) {
		

		Map<String, Object> csvo = csService.getContent(cs_seq);

	

		model.addAttribute("csvo", csvo);
	
		
		return ViewPath.MEMBER + "cs/content.jsp";
	}

	// AJAX

	@RequestMapping(value ="/member/cs/getCSContent")
	@ResponseBody
	public List<CSVO> getCSContent(String what) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("what", what);

		List<CSVO> data = csService.cateAjaxCs(map);
		return data;
	}

	// 1:1문의
	@RequestMapping("/member/cs/accomInquiry")
	public String accomInquiry(Model model,HttpSession session) {

		int login = (Integer) session.getAttribute("login");

		MemberVO mvo = memberService.getMember(login);

		List<CS_SubCateVO> csSubCateList1 = csService.csSubCateAll1();

		model.addAttribute("csSubCateList1", csSubCateList1);
		model.addAttribute("mvo", mvo);

		return ViewPath.MEMBER + "cs/accomInquiry.jsp";

	}

	@RequestMapping("/member/cs/ticketInquiry")
	public String ticketInquiry(Model model, HttpSession session) {

		int login = (Integer) session.getAttribute("login");

		MemberVO mvo = memberService.getMember(login);

		List<CS_SubCateVO> csSubCateList2 = csService.csSubCateAll2();

		model.addAttribute("csSubCateList2", csSubCateList2);

		model.addAttribute("mvo", mvo);
		model.addAttribute("login", login);

		return ViewPath.MEMBER + "cs/ticketInquiry.jsp";

	}

	@RequestMapping("/member/cs/serviceInquiry")
	public String serviceInquiry(Model model, HttpSession session) {
		List<CS_SubCateVO> csSubCateList3 = csService.csSubCateAll3();

		int login = (Integer) session.getAttribute("login");
		MemberVO mvo = memberService.getMember(login);

		model.addAttribute("csSubCateList3", csSubCateList3);
		model.addAttribute("mvo", mvo);

		return ViewPath.MEMBER + "cs/serviceInquiry.jsp";

	}

	@RequestMapping("/member/cs/terms1")
	public String openTerms1() {

		return ViewPath.MEMBER + "cs/terms1.jsp";
	}

	@RequestMapping("/member/cs/terms2")
	public String openTerms2() {

		return ViewPath.MEMBER + "cs/terms2.jsp";
	}

	// AJAX 티켓 리스트
	@RequestMapping(value = "/member/cs/selectTicket")
	@ResponseBody
	public List<T_PurchaseVO> tpurchaseList(int m_seq) {

		List<T_PurchaseVO> data = csService.t_purchaseList(m_seq);
		if (data.size() == 0) {

			data = null;

		}

		return data;
	}

	
	  @RequestMapping(value="/member/csContents")	  
	  @ResponseBody 
	  public List<CS_SubCateVO> csSubCateList(String what,String last,String type,String word){


		 
		List<CS_SubCateVO> data = new ArrayList<CS_SubCateVO>();
		  
		 Map<String, Object> map = new HashMap<String, Object>();
		
		 map.put("what", what);
		 map.put("last", last);
		 map.put("type", type);
		 map.put("word", word);
		
		 
		 
		 if(what != null && what.equals("all")) {
			 data = csService.allClist(map);
			
			if(data.size()==0) {
				data=null;
			}
		  }else if(what != null && what.equals("search")) {
			  data = csService.allClist(map);
				if(data.size()==0) {
					data=null;
				}
		  }
		 else {
	
		   data = csService.csSubCateAllaj(map);

		  
		  if(data.size()==0) {
			  data =null;
		  }
		  
		  }
	  
	  return data; 
	  
	  }
	  
	  @RequestMapping(value="/member/csContentsTitle")
	  @ResponseBody
	  public List<CSVO> csContentsTitle( int cs_cate_seq,int cs_subcate_seq,String what){
		  
	
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  map.put("what", what);
		  map.put("cs_cate_seq", cs_cate_seq);
		  map.put("cs_subcate_seq", cs_subcate_seq);
		  
		  List<CSVO> data  = csService.csTitleAjax(map);
		  if(data.size()==0) {
			  data =null;
		  }
		  
		  return data;
	  }
	 
	 
	
	// 티켓 1:1문의 다중 사진 저장
	public String InquiryTourPhotos(InquiryVO iqvo, int inquiry_seq) {

		String realPath = "/cs/inquiry/tour/" + inquiry_seq+"/";
		String savePath = FILEPATH + realPath;

		MultipartFile[] photos = iqvo.getPhotos();

		String filename = null;

		for (MultipartFile photo : photos) {
			if (!photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File saveFile = new File(savePath, filename);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					String firstName = filename.substring(0, filename.lastIndexOf("."));
					String extension = filename.substring(filename.lastIndexOf("."));
					int count = 1;

					while (saveFile.exists()) {
						filename = String.format("%s%d%s", firstName + "_", count, extension);
						saveFile = new File(savePath, filename);
						count++;
					}
				}
				try {
					photo.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				realPath = null;
			}
		}

		return realPath;

	}

	@RequestMapping("/member/cs/tInsert")
	public String ticketInsert(Integer purchase_no,int cs_subcate_seq, int kind, InquiryVO iqvo, C_InquiryVO ciqvo,
			
			Model model, HttpServletRequest request) {
		
		iqvo.setContent(iqvo.getContent().replaceAll("\r\n", "<br>"));
		iqvo.setTel(iqvo.getTel().replaceAll("-", ""));

		int inquiry_seq = csService.inquirySeqOne();

		iqvo.setInquiry_seq(inquiry_seq);
		String Path = InquiryTourPhotos(iqvo, inquiry_seq);
		iqvo.setInquiry_img(Path);

		int su = csService.insertInquiry(iqvo);

		if (su != 0) {

			// 문의유형 취소,환불 일때 취수환불 문의 테이블 insert
			if (cs_subcate_seq == 9) {
				ciqvo.setInquiry_seq(inquiry_seq);
				ciqvo.setKind(kind);
				ciqvo.setPurchase_no(purchase_no);

				csService.insertc_Inquiry(ciqvo);
			}
		}

		int login = (Integer) request.getSession().getAttribute("login");
		model.addAttribute("su", su);
		model.addAttribute("url", "/member/cs?login=" + login);
		model.addAttribute("msg", "문의 등록");

		return ViewPath.MEMBER + "result.jsp";
	}

	// 서비스일반 1:1문의 다중 사진 저장
	public String InquiryServicePhotos(InquiryVO iqvo, int inquiry_seq) {

		String realPath = "/cs/inquiry/service/" + inquiry_seq+"/";
		String savePath = FILEPATH + realPath;

		MultipartFile[] photos = iqvo.getPhotos();

		String filename = null;

		for (MultipartFile photo : photos) {
			if (!photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File saveFile = new File(savePath, filename);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					String firstName = filename.substring(0, filename.lastIndexOf("."));
					String extension = filename.substring(filename.lastIndexOf("."));
					int count = 1;

					while (saveFile.exists()) {
						filename = String.format("%s%d%s", firstName + "_", count, extension);
						saveFile = new File(savePath, filename);
						count++;
					}
				}
				try {
					photo.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				realPath = null;
			}
		}

		return realPath;

	}

	@RequestMapping("/member/cs/sInsert")
	public String ServiceInsert(InquiryVO iqvo, Model model, HttpServletRequest request) {

		iqvo.setContent(iqvo.getContent().replaceAll("\r\n", "<br>"));
		iqvo.setTel(iqvo.getTel().replaceAll("-", ""));

		int inquiry_seq = csService.inquirySeqOne();

		iqvo.setInquiry_seq(inquiry_seq);

		String Path = InquiryServicePhotos(iqvo, inquiry_seq);
		iqvo.setInquiry_img(Path);

		int su = csService.insertInquiry(iqvo);

		int login = (Integer) request.getSession().getAttribute("login");

		model.addAttribute("su", su);
		model.addAttribute("url", "/member/cs?login=" + login);
		model.addAttribute("msg", "문의 등록");

		return ViewPath.MEMBER + "result.jsp";
	}

	// AJAX 숙소리스트
	@RequestMapping(value = "/member/cs/selectAccom")
	@ResponseBody
	public List<PaymentVO> ApurchaseList(int m_seq) {

		List<PaymentVO> data = csService.accomPayList(m_seq);
		if (data.size() == 0) {

			data = null;

		}

		return data;
	}

	// 숙소 1:1문의 다중 사진 저장
	public String InquiryAccomPhotos(InquiryVO iqvo, int inquiry_seq) {

		String realPath = "/cs/inquiry/accom/" + inquiry_seq+"/";
		String savePath = FILEPATH + realPath;

		MultipartFile[] photos = iqvo.getPhotos();

		String filename = null;

		for (MultipartFile photo : photos) {
			if (!photo.isEmpty()) {
				filename = photo.getOriginalFilename();
				File saveFile = new File(savePath, filename);

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					String firstName = filename.substring(0, filename.lastIndexOf("."));
					String extension = filename.substring(filename.lastIndexOf("."));
					int count = 1;

					while (saveFile.exists()) {
						filename = String.format("%s%d%s", firstName + "_", count, extension);
						saveFile = new File(savePath, filename);
						count++;
					}
				}
				try {
					photo.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				realPath = null;
			}
		}

		return realPath;

	}

	@RequestMapping("/member/cs/AInsert")
	public String AccomInsert(int payment_seq, int cs_subcate_seq, int kind, InquiryVO iqvo, C_InquiryVO ciqvo,
			Model model, HttpServletRequest request) {

		//System.out.println("payment_seq");

		iqvo.setContent(iqvo.getContent().replaceAll("\r\n", "<br>"));
		iqvo.setTel(iqvo.getTel().replaceAll("-", ""));

		int inquiry_seq = csService.inquirySeqOne();

		iqvo.setInquiry_seq(inquiry_seq);
		String Path = InquiryAccomPhotos(iqvo, inquiry_seq);
		iqvo.setInquiry_img(Path);

		int su = csService.insertInquiry(iqvo);

		if (su != 0) {

			// 문의유형 취소,환불 일때 취수환불 문의 테이블 insert
			if (cs_subcate_seq == 6) {
				ciqvo.setInquiry_seq(inquiry_seq);
				ciqvo.setKind(kind);
				ciqvo.setPurchase_no(payment_seq);

				csService.insertc_Inquiry(ciqvo);
			}
		}

		int login = (Integer) request.getSession().getAttribute("login");
		model.addAttribute("su", su);
		model.addAttribute("url", "/member/cs?login=" + login);
		model.addAttribute("msg", "문의 등록");

		return ViewPath.MEMBER + "result.jsp";
	}
	
	//내 문의 내역
	@RequestMapping("/member/cs/Iqcontent")
	public String myIqContent(int login,Model model) {
		

		model.addAttribute("login",login);
		
		return ViewPath.MEMBER+"cs/iqcontent.jsp";
	}
	
	//내 문의내역 ajax
	
	@RequestMapping(value="member/cs/selectInqList")
	@ResponseBody
	public List<InquiryVO> selectInqList(int m_seq, String what,String last){
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("what", what);
		map.put("m_seq", m_seq);
		map.put("last", last);
		
	
		
		List<InquiryVO> data = csService.inquiryMyList(map);
		
		return data;
		
		
		
		
	}
	


}





















