package service.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.accom.AccomDAO;
import dao.accom.MotelDAO;
import dao.accom.PensionDAO;
import dao.accom.RoomDAO;
import dao.common.Addr1DAO;
import dao.common.Addr2DAO;
import dao.common.FormDAO;
import vo.accom.Cf_subVO;
import vo.accom.Hs_subVO;
import vo.accom.ReservationVO;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.common.FormVO;
import vo.member.MemberVO;

public class AccomService {
	
	private RoomDAO roomDao;
	private PensionDAO pensionDao;
	private MotelDAO motelDao;
	private Addr1DAO addr1Dao;
	private Addr2DAO addr2Dao;
	private AccomDAO accomDao;
	private FormDAO formDao;
	
	public AccomService() {
		
	}
	
	public AccomService(RoomDAO roomDao, 
			PensionDAO pensionDao, 
			MotelDAO motelDao, 
			Addr1DAO addr1Dao,
			Addr2DAO addr2Dao,
			AccomDAO accomDao,
			FormDAO formDao) {
		this.roomDao = roomDao;
		this.pensionDao = pensionDao;
		this.motelDao = motelDao;
		this.addr1Dao = addr1Dao;
		this.addr2Dao = addr2Dao;
		this.accomDao = accomDao;
		this.formDao = formDao;
	}
	
	
	//기범*****************************************************************
	//숙소 등록 insert
	
	public List<Addr1VO> addr1(){
		return addr1Dao.addr1();
	}
	public List<Addr2VO> addr2(int addr1_seq){
		return addr2Dao.addr2(addr1_seq);
	}
	public List<Hs_subVO> hssub(){
		return accomDao.hssub();
	}
	public List<Cf_subVO> cfsub(){
		return accomDao.cfsub();
	}
	public int nowSeq() {
		return formDao.nowSeq();
	}
	public int insert(FormVO vo) {
		return formDao.insert(vo);
	}
	
	//예약 insert
	
	public int rvseq() {
		return roomDao.rvseq();
	}
	public int insert(ReservationVO vo) {
		return roomDao.insert(vo);
	}
	
	
	
	//@@숙소 공통 ! 객실 선택@@
	
	public Map<String, Object> detailRoom(int room_seq){
		return roomDao.detailRoom(room_seq);
	}
	
	public String benefit(int room_benefit_seq) {
		return roomDao.benefit(room_benefit_seq);
	}
	
	//숙소 중요 정보
	public List<Map<String, Object>> infoRoom(int f_seq){
		return roomDao.infoRoom(f_seq);
	}
	
	//숙소 정책
	public List<Map<String, Object>> policy(int f_seq){
		return roomDao.policy(f_seq);
	}
	
	//숙소 보건&안전
	public List<Map<String, Object>> hs(int hs_sub_seq){
		return roomDao.hs(hs_sub_seq);
	}
	
	//숙소 편의시설
	public List<Map<String, Object>> cf(int cf_sub_seq){
		return roomDao.cf(cf_sub_seq);
	}
	
	//예약하기
	public Map<String, Object>rvRoom(int room_seq){
		return roomDao.rvRoom(room_seq);
	}
	//예약하기 멤버
	public MemberVO rvMember(int m_seq) {
		return roomDao.rvMember(m_seq);
	}
	
	
	//@@펜션@@
	
	//펜션 selectList
	public List<Map<String, Object>> selectAlist() {
		return pensionDao.selectAlist();
	}

	//숙소 selectOne
	public Map<String, Object> selectPen(int f_seq){
		
		Map<String, Object> map = pensionDao.selectPen(f_seq);
		
		String str = "";
		StringBuffer buf = new StringBuffer();
		
		Clob clob = (Clob)map.get("PENSION_PR");
		
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
		
		
		map.put("PENSION_PR", buf.toString());
		
		return map;
	}
	
	//펜션 객실List
	public List<Map<String, Object>> selectRoom(int f_seq) {
	
	    return pensionDao.selectRoom(f_seq);
	}
	

	
	//@@모텔@@
	
	public List<Map<String, Object>> selectMlist(){
		return motelDao.selectMlist();
	}

	//모텔 selectOne
	public Map<String, Object> selectMot(int f_seq){
		return motelDao.selectMot(f_seq);
	}
	
	
	

}












