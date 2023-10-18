package service.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.common.Addr1DAO;
import dao.common.Addr2DAO;
import dao.common.CateDAO;
import dao.common.DayDAO;
import dao.common.FormDAO;
import dao.common.HoursDAO;
import dao.common.Hours_CateDAO;
import dao.common.Tip_KeywordDAO;
import dao.common.TipsDAO;
import dao.ticket.T_PartnerDAO;
import dao.tour.TourDAO;
import dao.tour.Tour_CateDAO;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.common.DayVO;
import vo.common.FormVO;
import vo.common.HoursVO;
import vo.common.TipsVO;
import vo.ticket.T_PartnerVO;
import vo.tour.TourVO;
import vo.tour.Tour_CateVO;

public class TourService {
	
	private Addr1DAO addr1Dao;
	private Addr2DAO addr2Dao;
	private CateDAO cateDao;
	private DayDAO dayDao;
	private FormDAO formDao;
	private Hours_CateDAO hours_cateDao;
	private Tip_KeywordDAO tip_keywordDao;
	private TipsDAO tipsDao;
	private TourDAO tourDao;
	private Tour_CateDAO tour_cateDao;
	private HoursDAO hoursDao;
	
	
	public TourService(Addr1DAO addr1Dao,
						Addr2DAO addr2Dao,
						CateDAO cateDao,
						DayDAO dayDao,
						FormDAO formDao,
						Hours_CateDAO hours_cateDao,
						Tip_KeywordDAO tip_keywordDao,
						TipsDAO tipsDao,
						TourDAO tourDao,
						Tour_CateDAO tour_cateDao,
						HoursDAO hoursDao) {
		
		this.addr1Dao = addr1Dao;
		this.addr2Dao = addr2Dao;
		this.cateDao = cateDao;
		this.dayDao = dayDao;
		this.formDao = formDao;
		this.hours_cateDao = hours_cateDao;
		this.tip_keywordDao = tip_keywordDao;
		this.tipsDao = tipsDao;
		this.tourDao = tourDao;
		this.tour_cateDao = tour_cateDao;
		this.hoursDao = hoursDao;
		
	}
	
	public List<Addr1VO> addr1(){
		return addr1Dao.addr1();
	}
	
	public List<Addr2VO> addr2(int addr1_seq){
		return addr2Dao.addr2(addr1_seq);
	}
	
	public List<DayVO> day(){
		return dayDao.day();
	}
	
	
	public int insert(FormVO vo) {
		return formDao.insert(vo);
	}
	
	public int nowSeq() {
		return formDao.nowSeq();
	}
	
	
	public List<String> tip_keyword(){
		return tip_keywordDao.tip_keyword();
	}
	
	
	public List<TipsVO> findTip(Map<String, Object> map){
		return tipsDao.findTip(map);
	}
	
	public int addTip(String tip) {
		return tipsDao.addTip(tip);
	}
	
	public int maxSeq() {
		return tipsDao.maxSeq();
	}
	
	public Map<String, Object> selectTour(int f_seq){
		
		Map<String, Object> map = formDao.selectTour(f_seq);
		
		String str = "";
		StringBuffer buf = new StringBuffer();
		
		Clob clob = (Clob)map.get("INFO");
		
		BufferedReader br = null;
		if(clob != null) {
			try {
				br = new BufferedReader(clob.getCharacterStream());
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
			
			try {
				while((str = br.readLine()) != null) {
					buf.append(str);
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		
		map.put("INFO", buf.toString());
		
		return map;
	}
	
	
	public String selectTerm(int f_seq) {
		return tourDao.selectTerm(f_seq);
	}
	
	public int insert(TourVO vo) {
		return tourDao.insert(vo);
	}
	
	
	public List<Tour_CateVO> selectT_Cate(){
		return tour_cateDao.selectT_Cate();
	}

	public int insert(HoursVO vo) {
		return hoursDao.insert(vo);
	}
	
	public List<Map<String, Object>> selectHours(int f_seq){
		return hoursDao.selectHours(f_seq);
	}
	
	
	
	//재빈이
	public List<Map<String , Object>> selectAddrForm(Map<String, Object> map){
		List<Map<String, Object>> list = null;
		if(formDao.selectAddrForm(map)!=null) {
			list = formDao.selectAddrForm(map);
		}
		return list;
	}

	public List<Map<String, Object>> selectScheList(int cate_seq){
		return formDao.selectScheList(cate_seq);
	}
	
	

	
	
}
