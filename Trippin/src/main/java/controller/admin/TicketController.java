package controller.admin;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import common.ViewPath;
import service.admin.TicketService;
import service.admin.TourService;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.ticket.Include_ItemsVO;
import vo.ticket.T_PartnerVO;
import vo.ticket.TicketVO;
import vo.ticket.Ticket_CateVO;

@Configuration
@PropertySource(value= {"classpath:config/globals.properties"})

@Controller
public class TicketController {
	
	private TicketService ticketService;
	private TourService tourService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	public TicketController(TicketService ticketService,
							TourService tourService) {
		this.ticketService = ticketService;
		this.tourService = tourService;
	}
	
	

	@RequestMapping("/admin/ticket/insertForm")
	public String insertTicket(Model model) {
		
		int ticket_seq = ticketService.nowTicket_seq();
		
		List<Ticket_CateVO> tclist = ticketService.tclist();
		List<Addr1VO> addr1list = tourService.addr1();
		List<T_PartnerVO> ptnlist = ticketService.ptnlist();		
		List<Include_ItemsVO> inclItmsList = ticketService.inclItmsList();
		
		
		model.addAttribute("inclItmsList", inclItmsList);
		model.addAttribute("ptnlist", ptnlist);
		model.addAttribute("addr1list", addr1list);
		model.addAttribute("tclist", tclist);
		model.addAttribute("ticket_seq", ticket_seq);
		return ViewPath.ADTICKET + "insertTicket.jsp";
	}
	
	
	@RequestMapping("/admin/ticket/checkInsert")
	public String checkInsert(TicketVO vo, Model model, HttpServletRequest request) {
		
		TicketVO tvo = new TicketVO();
		int ticket_seq = Integer.parseInt(request.getParameter("ticket_seq"));
		tvo.setTicket_seq(ticket_seq);
		
		
		String[] ticket_cate_nos = request.getParameterValues("ticket_cate_no");
		String ticket_cate_no = "";
		for(int i = 0; i < ticket_cate_nos.length; i++) {
			ticket_cate_no += ticket_cate_nos[i];
			if(i < ticket_cate_nos.length - 1) {
				ticket_cate_no += ",";
			}
		}
		System.out.println("카테고리 넘버들?: "+ticket_cate_no);
		tvo.setTicket_cate_no(ticket_cate_no);
		
		tvo.setTicket_name(vo.getTicket_name());
		tvo.setTicket_intro(vo.getTicket_intro());
		tvo.setAddr2_seq(vo.getAddr2_seq());
		tvo.setVoucher(vo.getVoucher() == -1 ? null : vo.getVoucher());
		tvo.setCancel_status(vo.getCancel_status() == -1 ? null : vo.getCancel_status());
		tvo.setUsemethod(vo.getUsemethod());
		tvo.setT_partner_seq(vo.getT_partner_seq());
		tvo.setTitle(vo.getTitle());
		tvo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
		
		java.util.Date sellDate = vo.getSell_date();
		java.sql.Date sqlSellDate = null;
		if (sellDate != null) {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    String dateString = dateFormat.format(sellDate);
		    try {
		        java.util.Date parsedDate = dateFormat.parse(dateString);
		        sqlSellDate = new java.sql.Date(parsedDate.getTime());
		    } catch (java.text.ParseException e) {
		        e.printStackTrace();
		    }
		}
		String dateComparison = (sqlSellDate != null) ? sqlSellDate.toString() : "";
		tvo.setSell_date("9999-12-31".equals(dateComparison) ? null : sqlSellDate);
		tvo.setValid_type(vo.getValid_type() == -1 ? null : vo.getValid_type());
		
		String[] valid_dates = request.getParameterValues("valid_date") == null? null : request.getParameterValues("valid_date");
		String valid_date = "";
		if(valid_dates != null) {
			for(int i = 0; i < valid_dates.length; i++) {
				valid_date += valid_dates[i];
				if(i < valid_dates.length - 1) {
					valid_date += ",";
				}
			}
		}
		System.out.println("유효기간 날짜들?: " + valid_date);
		tvo.setValid_date(valid_date);
		
		tvo.setMin_pp(vo.getMin_pp() == -1 ? null : vo.getMin_pp());
		tvo.setTour_type(vo.getTour_type());
		
		String[] languages = request.getParameterValues("language");
		String language = "";
		if(languages.length != 0) {
			for(int i = 0; i < languages.length; i++) {
				language += languages[i];
				if(i < languages.length - 1) {
					language += ", ";
				}
			}
		}
		
		tvo.setLanguage(language);
		
		tvo.setUse_condition(vo.getUse_condition());
		tvo.setTicket_summer(vo.getTicket_summer());
		tvo.setSpecial_info(vo.getSpecial_info() == "-1" ? null : vo.getSpecial_info().replaceAll("\r\n", "<br>"));
		tvo.setUse_info(vo.getUse_info().replaceAll("\r\n", "<br>"));
		
		String[] includes = request.getParameterValues("include");
		String include = "";
		if(includes.length != 0) {
			for(int i = 0; i < includes.length; i++) {
				include += includes[i];
				if(i < includes.length - 1) {
					include += ",";
				}
			}
			if(includes[0] == "on") {
				include = "";
			}
		}
		
		tvo.setInclude(include);

		String[] not_includes = request.getParameterValues("not_include") == null ?  null : request.getParameterValues("not_include");
		String not_include = "";
		if(not_includes != null) {
			for(int i = 0; i < not_includes.length; i++) {
				not_include += not_includes[i];
				if(i < not_includes.length - 1) {
					not_include += ",";
				}
			}
			
		}
		tvo.setNot_include(not_include);
		
		tvo.setMore_info(vo.getMore_info().replaceAll("\r\n", "<br>"));
		tvo.setFaq(vo.getFaq().replaceAll("\r\n", "<br>"));
		
		String savePath = FILEPATH + "/Ticket/" + ticket_seq;
		String realPath = "/Ticket/" + ticket_seq + "/";
		
		List<MultipartFile> list = vo.getFiles();
		
		String filename = null;
		
		if(list != null & list.size() != 0) {
			for(MultipartFile file : list) {
				filename = file.getOriginalFilename();
				if(!filename.equals("")) {
					File saveFile = new File(savePath, filename);
					
					if(!saveFile.exists()) {
						saveFile.mkdirs();
					}else {
						long time = System.currentTimeMillis();
						filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time, filename.substring(filename.lastIndexOf(".")));
						saveFile = new File(saveFile, filename);
					}
					try {
						file.transferTo(saveFile);
					}catch(IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					tvo.setTicket_img(realPath);
				}
			}
		}
		
		int su = ticketService.insert(tvo);
		
		String msg = "";
		String url = "";
		
		if(su != 0) {
			msg = "상품 등록";
			url = "/admin/ticketList";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		model.addAttribute("su", su);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	
	@RequestMapping("/summer_image2")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, @RequestParam("ticket_seq") int ticket_seq) throws IOException {
	    JsonObject json = new JsonObject();

	    String fileRoot = FILEPATH + "/Ticket/"+"/"+ticket_seq+"/Summernote/copy/";
	    String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
	    String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자

	    String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
	    File targetFile = new File(fileRoot + savedFileName);	
	    System.out.println(targetFile);
	    try {
	        // 파일 저장
	        InputStream fileStream = multipartFile.getInputStream();
	        FileUtils.copyInputStreamToFile(fileStream, targetFile);	
	        
	        // 파일을 열기위하여 common/getImg.do 호출 / 파라미터로 savedFileName 보냄.
//	        json.addProperty("url", "/trippin/admin/tour/getImg?savedFileName="+savedFileName);  
	        json.addProperty("url", "/trippin/admin/ticket/getImg?savedFileName="+savedFileName+"&ticket_seq="+ticket_seq);  
	        json.addProperty("responseCode", "success");
	   
	    } catch (IOException e) {
	        FileUtils.deleteQuietly(targetFile);	
	        json.addProperty("responseCode", "error");
	        e.printStackTrace();
	    }
	    String jsonvalue = json.toString();

	    return jsonvalue;
	}
	
	
	@RequestMapping(value="/admin/ticket/getImg", method=RequestMethod.GET)
	public void getImg(@RequestParam(value="savedFileName") String savedFileName, @RequestParam("ticket_seq") int ticket_seq, HttpServletResponse response) throws Exception{
		
		String filePath;
		String DIR = FILEPATH + "/Ticket/"+"/"+ticket_seq+"/Summernote/copy/";
		filePath = DIR + savedFileName;
		getImage(filePath, response);
		
	}
	
	@RequestMapping(value="/admin/tour/getImgLoad/{ticket_seq}", method=RequestMethod.GET)
	public void getImgCopy(@RequestParam(value="savedFileName") String savedFileName, @PathVariable("ticket_seq") int ticket_seq, HttpServletResponse response) throws Exception{
		String filePath;
		String DIR = FILEPATH + "/Ticket/"+"/"+ticket_seq+"/Summernote/" + ticket_seq;
		
		filePath = DIR + savedFileName;
		getImage(filePath, response);
	}
	
	
	private void getImage(String filePath, HttpServletResponse response) throws IOException{
		File file = new File(filePath);
		if(!file.isFile()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script type='text/javascript'>alert('조회된 정보가 없습니다.'); self.close();</script>");
			out.flush();
			return;
		}
		
		FileInputStream fis = null;
		
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try {
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			
			int imgByte;
			while((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}
			
			String type = "";
			String ext = FilenameUtils.getExtension(file.getName());
			
			if(ext != null && !"".equals(ext)) {
				if("jpg".equals(ext.toLowerCase())) {
					type = "image/jpeg";
				}else {
					type = "image/" + ext.toLowerCase();
				}
			}else {
				System.err.println("Image fileType is null.");
			}
			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());
			
			bStream.writeTo(response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(bStream != null) {
				try {
					bStream.close();
				}catch(Exception est) {
					est.printStackTrace();
				}
			}
			if(in != null) {
				try {
					in.close();
				}catch(Exception ei) {
					ei.printStackTrace();
				}
			}
			if(fis != null) {
				try {
					fis.close();
				}catch(Exception efis) {
					efis.printStackTrace();
				}
			}
		}
	}
	
	
	public Map<String, Object> summerCopy(List<String> fileList, int ticket_seq) throws Exception{
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		//원본 파일 경로
		for(int i = 0; i < fileList.size(); i++) {
			String oriFilePath = FILEPATH + "\\Ticket\\"+ticket_seq+"\\Summernote\\copy\\" + fileList.get(i);
			
			//복사될 파일 경로
			String copyFilePath = FILEPATH + "\\Ticket\\" + ticket_seq + "\\Summernote\\" + fileList.get(i);
			File copy = new File(FILEPATH + "\\Ticket\\" + ticket_seq + "\\Summernote\\");
			
			if(!copy.exists()) {	//경로에 파일이 없으면
				copy.mkdirs();
			}
			
			try {
				FileInputStream fis = new FileInputStream(oriFilePath);	//읽을 파일
				FileOutputStream fos = new FileOutputStream(copyFilePath); //복사할 파일
				int data = 0;
				while((data=fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			File del = new File(oriFilePath);
			del.delete();
		}
		
		result.put("SUCCESS", true);
		return result;
	}
	
	
	@RequestMapping("/admin/ticket/updateTK")
	public String updateTK(@RequestParam("ticket_seq") int ticket_seq, Model model) {
		
		TicketVO vo = ticketService.selectTK(ticket_seq);
		String cates = vo.getTicket_cate_no();
		System.out.println("cates?: "+cates);
		
		String[] cate_seqs = cates.split(",");
		List<Integer> cate_seq = new ArrayList<Integer>();
		for (int j = 0; j < cate_seqs.length; j++) {
			cate_seq.add(j, Integer.parseInt(cate_seqs[j]));
		}
		
//		if(nugulist.contains(",")) {
//			String[] nugu_seq = nugulist.split(",");
//			
//			List<String> who = new ArrayList<String>();
//			for (int j = 0; j < nugu_seq.length; j++) {
//				who.add(j, "#"+memberService.selectWho(Integer.parseInt(nugu_seq[j]))+" ");
//			}
//			m_SlogList.get(i).put("nugulist", who);
		
		
		List<Ticket_CateVO> tclist = ticketService.tclist();
		List<Addr1VO> addr1list = tourService.addr1();
		List<T_PartnerVO> ptnlist = ticketService.ptnlist();		
		List<Include_ItemsVO> inclItmsList = ticketService.inclItmsList();
		
		int addr1_seq = ticketService.addrInfo(vo.getAddr2_seq());
		String addr2_name = ticketService.addr2Name(vo.getAddr2_seq());
		
		model.addAttribute("addr2_name", addr2_name);
		model.addAttribute("addr1_seq", addr1_seq);
		model.addAttribute("cate_seqList", cate_seq);
		model.addAttribute("inclItmsList", inclItmsList);
		model.addAttribute("ptnlist", ptnlist);
		model.addAttribute("addr1list", addr1list);
		model.addAttribute("tclist", tclist);
		model.addAttribute("vo", vo);
		return ViewPath.ADTICKET + "updateTKform.jsp";
	}
	
		
	@RequestMapping("/ticket/t_partner")
	public String t_partner(@RequestParam("t_partner_seq") int t_partner_seq, Model model) {
		
		return ViewPath.ADTICKET + "t_PTNinfo.jsp";
	}
	
	
	
}
