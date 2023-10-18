package controller.admin;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import common.ViewPath;
import service.admin.AdminService;
import service.admin.TourService;
import service.member.MemberService;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.common.DayVO;
import vo.common.FormVO;
import vo.common.HoursVO;
import vo.common.JjimVO;
import vo.common.Review_LikeVO;
import vo.tour.TourVO;
import vo.tour.Tour_CateVO;

@Configuration
@PropertySource(value= {"classpath:config/globals.properties"})

@Controller
public class TourController {
	
	private TourService tourService;
	private MemberService memberService;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	public TourController(TourService tourService, MemberService memberService) {
		this.tourService = tourService;
		this.memberService = memberService;
	}
	
	@RequestMapping("/admin/tour/insertForm")
	public String insertForm(Model model) {
		
		int f_seq = tourService.nowSeq();
		
		List<Tour_CateVO> tcatelist = tourService.selectT_Cate();
		List<Addr1VO> addr1list = tourService.addr1();
		List<DayVO> daylist = tourService.day();
		
		model.addAttribute("f_seq", f_seq);
		model.addAttribute("daylist", daylist);
		model.addAttribute("tcatelist", tcatelist);
		model.addAttribute("addr1list", addr1list);
		return ViewPath.ADTOUR + "insertTour.jsp";
	}
	
	
	@RequestMapping("/admin/area")
	@ResponseBody
	public List<Addr2VO> addr2list(int addr1_seq){
		List<Addr2VO> addr2list = tourService.addr2(addr1_seq);
		return addr2list;
	}
	
	
	@RequestMapping("/admin/tour/insert")
	public String tinsert(Model model, FormVO fvo, TourVO tvo, HttpServletRequest request) {
		
		int f_seq = tourService.nowSeq();
		
		String savePath = FILEPATH + "/Form/"+fvo.getCate_seq()+"/"+f_seq+"/Main/";
		String realPath = "/Form/"+fvo.getCate_seq()+"/"+f_seq+"/Main/";
		
		MultipartFile photo = fvo.getPhoto();
		String main_name = null;
		
		if(photo != null && !photo.isEmpty()) {
			main_name = photo.getOriginalFilename();
			
			File saveFile = new File(savePath, main_name);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				main_name = String.format("%s%d%s", main_name.substring(0, main_name.lastIndexOf(".")), time, main_name.substring(main_name.lastIndexOf(".")));
				saveFile = new File(savePath, main_name);
			}
			
			try {
				photo.transferTo(saveFile);
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			fvo.setMain_img(realPath);
		}else {
			fvo.setMain_img("no_file");
		}
		
		fvo.setF_seq(f_seq);
		fvo.setCate_seq(fvo.getCate_seq());
		fvo.setKind(fvo.getKind());
		fvo.setName(fvo.getName());
		fvo.setIntro(fvo.getIntro());
		fvo.setAddr2_seq(fvo.getAddr2_seq());
		fvo.setAddr(fvo.getAddr());
		fvo.setAddr_detail(fvo.getAddr_detail());
		fvo.setWi(fvo.getWi());
		fvo.setKyung(fvo.getKyung());
		fvo.setWay(fvo.getWay().replaceAll("\r\n", "<br>"));
		fvo.setTel(fvo.getTel().replaceAll("-", ""));
		fvo.setWebsite(fvo.getWebsite());
		
		
		
		int su = tourService.insert(fvo);
		int su2 = 0;
		
		
		String url = "";
		String msg = "";

		
		if(su != 0) {
			tvo.setF_seq(f_seq);
			
			List<MultipartFile> list = tvo.getFiles();
			
			String realPath2 = "/Form/"+fvo.getCate_seq()+"/"+f_seq+"/Sub/";
			String savePath2 = FILEPATH + "/Form/"+fvo.getCate_seq()+"/"+f_seq+"/Sub/";
			
			String filename = null;
			
			if(list != null && list.size() != 0) {
				
				for(MultipartFile file : list) {
					filename = file.getOriginalFilename();
					if(!filename.equals("")) {
						File saveFile = new File(savePath2, filename);
						
						if(!saveFile.exists()) {
							saveFile.mkdirs();
						}else {
							long time = System.currentTimeMillis();
							filename = String.format("%s%d%s", filename.substring(0, filename.lastIndexOf(".")), time, filename.substring(filename.lastIndexOf(".")));
							saveFile = new File(savePath2, filename);
							
						}
						try {
							file.transferTo(saveFile);
						}catch(IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						tvo.setTour_img(realPath2);
					}
				}
			}
			su2 = tourService.insert(tvo);
			
			
			//Hours insert
			
			List<DayVO> daylist = tourService.day();
			
			for(int i = 0; i < daylist.size(); i++) {
				String[] time = request.getParameterValues("time"+(i+1));
				String hours_cate_name = request.getParameter("hours_cate_seq_" + (i+1)) == null ? null : request.getParameter("hours_cate_seq_" + (i+1));
				
				HoursVO hvo = new HoursVO();
				hvo.setF_seq(f_seq);
				hvo.setDay_seq(i+1);
				
				if(hours_cate_name != null) {
					hvo.setHours_cate_seq(3);
						hvo.setTime("휴무");
						int su3 = tourService.insert(hvo);
				}else {
					for(int j = 0; j < time.length; j++) {
						
						hvo.setTime(time[j]);
						if(j%2 == 0) {
							hvo.setHours_cate_seq(1);
						}else {
							hvo.setHours_cate_seq(2);
						}
						int su3 = tourService.insert(hvo);
					}
				}
			}
			url = "/admin/main";
			msg = "등록에 성공하였습니다.";
		}
		
		
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		model.addAttribute("su", su2);
		
		return ViewPath.INDEX + "result.jsp";
	}
	
	
	@RequestMapping("/summer_image")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, @RequestParam("f_seq") int f_seq) throws IOException {
	    JsonObject json = new JsonObject();

//	    String fileRoot = FILEPATH + "/admin/tour/copy/";
	    String fileRoot = FILEPATH + "/Form/"+1+"/"+f_seq+"/Summernote/copy/";
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
	        json.addProperty("url", "/trippin/admin/tour/getImg?savedFileName="+savedFileName+"&f_seq="+f_seq);  
	        json.addProperty("responseCode", "success");
	   
	    } catch (IOException e) {
	        FileUtils.deleteQuietly(targetFile);	
	        json.addProperty("responseCode", "error");
	        e.printStackTrace();
	    }
	    String jsonvalue = json.toString();

	    return jsonvalue;
	}
	
	
	@RequestMapping(value="/admin/tour/getImg", method=RequestMethod.GET)
	public void getImg(@RequestParam(value="savedFileName") String savedFileName, @RequestParam("f_seq") int f_seq, HttpServletResponse response) throws Exception{
		
		String filePath;
//		String DIR = FILEPATH + "/admin/tour/copy/";
		String DIR = FILEPATH + "/Form/"+1+"/"+f_seq+"/Summernote/copy/";
		filePath = DIR + savedFileName;
		getImage(filePath, response);
		
	}
	
	@RequestMapping(value="/admin/tour/getImgLoad/{f_seq}", method=RequestMethod.GET)
	public void getImgCopy(@RequestParam(value="savedFileName") String savedFileName, @PathVariable("f_seq") int f_seq, HttpServletResponse response) throws Exception{
		String filePath;
//		String DIR = FILEPATH + "/admin/tour/" + f_seq + "/";
//		String DIR = FILEPATH + "/Form/"+1+"/"+f_seq+"/Summernote/" + f_seq + "/";
		String DIR = FILEPATH + "/Form/"+1+"/"+f_seq+"/Summernote/" + f_seq;
		
		filePath = DIR + savedFileName;
		getImage(filePath, response);
	}
	
	
	
	@RequestMapping(value="/Form/Tour/getMain_Img", method=RequestMethod.GET)
	public void getMain_Img(@RequestParam(value="main_imgNM") String main_imgNM, @RequestParam(value="f_seq") int f_seq, HttpServletResponse response) throws Exception{
		
		String filePath;
//		String DIR = FILEPATH + "/admin/tour/copy/";
		String DIR = FILEPATH + "/Form/1/"+f_seq+"/Main/";
		filePath = DIR + main_imgNM;
		
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
	
	
	public Map<String, Object> summerCopy(List<String> fileList, int f_seq) throws Exception{
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		//원본 파일 경로
		for(int i = 0; i < fileList.size(); i++) {
			String oriFilePath = FILEPATH + "\\Form\\1\\"+f_seq+"\\Summernote\\copy\\" + fileList.get(i);
			
			//복사될 파일 경로
			String copyFilePath = FILEPATH + "\\Form\\1\\" + f_seq + "\\Summernote\\" + fileList.get(i);
			File copy = new File(FILEPATH + "\\Form\\1\\" + f_seq + "\\Summernote\\");
			
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
	
	
	
	@RequestMapping("/admin/tour/one")
	public String tourOne(@RequestParam("f_seq") int f_seq, Model model, String filter) {
		//추천순, 최신순 필터
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("f_seq", f_seq);
        if(filter != null && filter.equals("")) {
        	filter = null;
        	map.put("filter", filter);
        }else {
        	map.put("filter", filter);
        }
		
		
		
		Map<String, Object> tour = tourService.selectTour(f_seq);
		
		if((Integer)(tour.get("savg")) != null) {
			double savg = ((int)tour.get("savg"))*1.4*10;
			
			model.addAttribute("savg", savg);
		}else {
			model.addAttribute("savg", 0);
		}
		
		
		List<Map<String, Object>> hlist = tourService.selectHours(f_seq) == null ? null : tourService.selectHours(f_seq);
		
		// 이용팁 09-04
//	      List<Map<String, Object>> tlist = adminService.oneTip(f_seq);
//	      if(tlist.isEmpty()) tlist = null;
//	      model.addAttribute("tlist", tlist);
		
		
		Calendar cal = Calendar.getInstance();
		int dayofWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		List<DayVO> daylist = tourService.day();
		
		String today = "";
		for(int i = 0; i < 7; i++) {
			int day = (daylist.get(i).getDay_seq() + 1) % 7;
			if(day == 0) {
				day = 7;
			}
			daylist.get(i).setDay_seq(day);
		
			if(dayofWeek == daylist.get(i).getDay_seq()) {
				today = daylist.get(i).getDay_name();
			}
		}
		
		
		
		String folderPathString = (String)tour.get("MAIN_IMG"); // 원하는 폴더 경로로 변경해주세요
        Path folderPath = Paths.get(folderPathString);
        
        File file = new File(FILEPATH + folderPath);
        
        String[] name = file.list();
        
        
        model.addAttribute("main_imgNM", name[0]);
        
        
        //최근여행 여부 따지기 - 현재 년, 월
  		int now_y = cal.get(Calendar.YEAR);
  		int now_m = cal.get(Calendar.MONTH)+1;
      		
        
        //한 게시물에서 후기 목록 뽑기
        List<Map<String, Object>> rvlist = memberService.selectRVList(map) == null ? null : memberService.selectRVList(map);
        
        int rvcnt = memberService.RVcntForOne(f_seq);
        
        if(rvlist != null) {
        	for(int i = 0; i < rvlist.size(); i++) {
        		
        		//여행 년, 월 구하기
        		String date = (String)rvlist.get(i).get("VISITDAY") == null ? null : (String)rvlist.get(i).get("VISITDAY");
        		if(date != null) {
        			
        			String[] splitday = date.split("-");
        			
        			int year = Integer.parseInt(splitday[0]);
        			int month = Integer.parseInt(splitday[1]);
        			
        			rvlist.get(i).put("year", year);
        			rvlist.get(i).put("month", month);
        			
        			//recent = 1: 최근 여행, 0: 6개월 지난 여행
        			if(now_y == year && (now_m - month) <= 6) {
        				rvlist.get(i).put("recent", 1);
        			}else if(now_y != year && (now_m - month) < 0) {
        				if(((12 - month) + now_m) <= 6) {
        					rvlist.get(i).put("recent", 1);
        				}
        			}else {
        				rvlist.get(i).put("recent", 0);
        			}
        		}
        		
        		rvlist.get(i).put("date", date);
        		
        		
        		
        		//리뷰 쓴 회원 프로필 사진
        		String profilePathString = (String)rvlist.get(i).get("M_PROFILE");
                Path profilePath = Paths.get(profilePathString);
                
                File profile = new File(FILEPATH + profilePath);
                String[] m_profile = profile.list();
                
                rvlist.get(i).put("m_profileNM", m_profile[0]);
                
                //리뷰에 올린 사진들 rv_img
                File rvimg = new File(FILEPATH + rvlist.get(i).get("RV_IMG"));
				
			    if(rvimg != null) { 
				    String[] rv_imgNM = rvimg.list();
				  	    rvlist.get(i).put("rv_imgNM", rv_imgNM);
			    }
                
			    	
			    
			    
			    //리뷰 내용 줄이기
			    String content = (String)rvlist.get(i).get("CONTENT");
				String newcontent = " " + content;
				
				if(content.length() >= 100) {
					rvlist.get(i).put("CONTENT", newcontent.substring(1, 100) + "...");
				}else {
					rvlist.get(i).put("CONTENT", newcontent);
				}
			    
			    
        	}
        }
      

        
		model.addAttribute("filter", filter);
        model.addAttribute("now_y", now_y);
        model.addAttribute("now_m", now_m);
        model.addAttribute("rvlist", rvlist);
		model.addAttribute("rvcnt", rvcnt);
        model.addAttribute("today", today);
		model.addAttribute("dayofWeek", dayofWeek);
		model.addAttribute("daylist", daylist);
        model.addAttribute("hlist", hlist);
		model.addAttribute("tour", tour);
		
		return ViewPath.ADTOUR + "one.jsp";
	}
	

	@RequestMapping("/admin/tour/updateForm")
	public String updateForm(@RequestParam("f_seq") int f_seq, Model model) {
		System.out.println("f_seq?: "+f_seq);
		
		return ViewPath.ADTOUR + "updateForm.jsp";
	}
	
	
	
	
	
}
