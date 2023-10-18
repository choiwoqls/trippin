package service.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.common.CateDAO;
import dao.common.FormDAO;
import dao.member.MemberDAO;
import dao.sche.CityDAO;
import dao.sche.InviteDAO;
import dao.sche.NuguDAO;
import dao.sche.PlanDAO;
import dao.sche.ScheDAO;
import dao.sche.StyleDAO;
import dao.slog.MyPlaceDAO;
import vo.common.CateVO;
import vo.member.MemberVO;
import vo.sche.CityVO;
import vo.sche.InviteVO;
import vo.sche.NuguVO;
import vo.sche.PlanVO;
import vo.sche.ScheVO;
import vo.sche.StyleVO;


public class ScheService {

	private ScheDAO scheDao;
	private StyleDAO styleDao;
	private NuguDAO nuguDao;
	private CityDAO cityDao;
	private InviteDAO inviteDao;
	private PlanDAO planDao;
	private MyPlaceDAO myplaceDao;
	private FormDAO formDao;
	private CateDAO cateDao;
	private MemberDAO memberDao;
	
	public ScheService(ScheDAO scheDao, 
						StyleDAO styleDao, 
						NuguDAO nuguDao, 
						CityDAO cityDao, 
						InviteDAO inviteDao, 
						PlanDAO planDao, 
						MyPlaceDAO myplaceDao, 
						FormDAO formDao,
						CateDAO cateDao,
						MemberDAO memberDao) {
		this.scheDao=scheDao;
		this.styleDao=styleDao;
		this.nuguDao=nuguDao;
		this.cityDao=cityDao;
		this.inviteDao=inviteDao;
		this.planDao=planDao;
		this.myplaceDao=myplaceDao;
		this.formDao=formDao;
		this.cateDao=cateDao;
		this.memberDao=memberDao;
	}
	
	
	//[재빈]***********************************************************
	//회원의 일정날짜 리스트
	public List<ScheVO> m_Sche_Day(int receiver_seq){
		List<ScheVO> list = null;
		if(scheDao.m_Sche_Day(receiver_seq)!=null) {
			list = scheDao.m_Sche_Day(receiver_seq);
		}
		return list;
	}
	
	//여행 스타일 리스트
	public List<StyleVO> styleList(){
		List<StyleVO> list = null;
		if(styleDao.styleList()!=null) {
			list = styleDao.styleList();
		}
		return list;
	}
	
	//누구와 리스트
	public List<NuguVO> nuguList(){
		List<NuguVO> list = null;
		if(nuguDao.nuguList()!=null) {
			list = nuguDao.nuguList();
		}
		return list;
	}
	
	//시퀀스
	public int sche_seq() {
		return scheDao.sche_seq();
	}
	public int city_seq() {
		return cityDao.city_seq();
	}
	public int invite_seq() {
		return inviteDao.invite_seq();
	}
	
	//새로운 일정 데이터
	public boolean newSche(ScheVO vo) {
		boolean check = false;
		if(scheDao.newSche(vo) != 0) {
			check = true;
		}
		return check;
	}
	
	//일정 정보
	public Map<String, Object> scheInfo(int s_seq) {
		Map<String, Object> map = null;
		if(scheDao.scheInfo(s_seq)!= null) {
			map = scheDao.scheInfo(s_seq);
		}
		return map;
	}
	
	//새로운 일정 도시 데이터
	public boolean newCity(CityVO vo) {
		boolean check = false;
		if(cityDao.newCity(vo) != 0 ) {
			check = true;
		}
		return check;
	}
	
	//일정 도시 리스트
	public List<Map<String, Object>> selectCity(int s_seq){
		List<Map<String, Object>> list = null;
		if(cityDao.selectCity(s_seq)!=null) {
			list = cityDao.selectCity(s_seq);
		}
		return list;
	}
	
	//새로운 일정 초대 데이터 
	public boolean newIv(InviteVO vo) {
		boolean check = false;
		if(inviteDao.newIv(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//일정 제목 수정
	public boolean reTitle(ScheVO vo) {
		boolean check = false;
		if(scheDao.reTitle(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//일정 파트너리스트 출력
	public String selectPartner(int s_seq) {
		String partnerlist = "";
		if(scheDao.selectPartner(s_seq)!=null) {
			partnerlist = scheDao.selectPartner(s_seq);
		}
		return partnerlist;
	}
	
	//일정 파트너리스트 수정
	public boolean rePartner(ScheVO vo) {
		boolean check = false;
		if(scheDao.rePartner(vo)!=0) {
			check = true;
		}
		return check ;
	}
	
	//2023-08-15
	//일정 데이터 삭제
	public boolean delSche(int s_seq) {
		boolean check = false;
		if(scheDao.delSche(s_seq)!= 0) {
			check = true;
		}
		return check;
	}
	
	//일정 도시 데이터 삭제
	public void delCity(int s_seq) {
		cityDao.delCity(s_seq);
	}
	
	//일정 초대 거절
	public boolean refIv(InviteVO vo) {
		boolean check = false;
		if(inviteDao.refIv(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//일정 초대 수락
	public boolean accIv(InviteVO vo) {
		boolean check = false;
		if(inviteDao.accIv(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//일정 떠남
	public boolean outIv(InviteVO vo) {
		boolean check = false;
		if(inviteDao.outIv(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//회원 일정 리스트
	public List<Map<String, Object>> mScheList(int m_seq){
		List<Map<String, Object>> list = null;
		if(scheDao.mScheList(m_seq)!=null) {
			list = scheDao.mScheList(m_seq);
		}
		return list;
	}
	
	//일정 첫번째 도시
	public int firstCity(int s_seq) {
		return cityDao.firstCity(s_seq);
	}
	
	//세부일정 마지막 순서
	public int planLastNum(PlanVO vo) {
		return planDao.planLastNum(vo);
	}
	
	//세부일정 추가
	public boolean newPlan(PlanVO vo) {
		boolean check = false;
		if(planDao.newPlan(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public List<Map<String, Object>> schePlanList(Map<String, Object> map){
		List<Map<String, Object>> list = null;
		if(planDao.schePlanList(map)!=null) {
			list = planDao.schePlanList(map);
		}
		return list;
	}
	
	//관광지 종류
	public String tourCate(int t_cate_seq) {
		return formDao.tourCate(t_cate_seq);
	}
	
	//맛집 종류
	public String hotpleCate(int h_cate_seq) {
		return formDao.hotpleCate(h_cate_seq);
	}
	
	//숙소 종류
	public String accCate(int a_cate_seq) {
		return formDao.accCate(a_cate_seq);
	}
	
	//세부일정 메모 추가
	public boolean updateMemo(PlanVO vo) {
		boolean check = false;
		if(planDao.updateMemo(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//세부일정 시간 추가
	public boolean updateTime(PlanVO vo) {
		boolean check = false;
		if(planDao.updateTime(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	//세부일정 메모 시간 추출
	public PlanVO planMT(int plan_seq) {
		PlanVO vo = null;
		if(planDao.planMT(plan_seq)!=null) {
			vo = planDao.planMT(plan_seq);
		}
		return vo;
	}
	
	//세부일정 삭제
	public boolean delPlan(int plan_seq) {
		boolean check = false;
		if(planDao.delPlan(plan_seq)!=0) {
			check = true;
		}
		return check;
	}
	
	//2023-08-13
	//모든 form 리스트
	public List<Map<String, Object>> selectAllScheList(int addr1_seq){
		return formDao.selectAllScheList(addr1_seq);
	}
	
	//2023-08-14
	public List<Map<String, Object>> afList(){
		return formDao.afList();
	}
	public List<CateVO> cateList(){
		return cateDao.cateList();
	}
	
	//2023-08-15
	public boolean newMemo(PlanVO vo) {
		boolean check = false;
		if(planDao.newMemo(vo)!= 0 ) {
			check = true;
		}
		return check;
	}
	
	//2023-08-15
	public MemberVO mInfo(int m_seq) {
		return memberDao.mInfo(m_seq);
	}
	
	public List<Integer> IvInfo(int s_seq){
		return inviteDao.IvInfo(s_seq);
	}
	
	public boolean delInvite(InviteVO vo) {
		boolean check = false;
		if(inviteDao.delInvite(vo)!= 0 ) {
			check = true;
		}
		return check;
	}
	
	//2023-08-16
	public int scheDay(int s_seq) {	
		return scheDao.scheDay(s_seq);
	}
	
	public Map<String, Object> schedy(Map<String, Object> map){
		return scheDao.schedy(map);
	}
	
	//2023-08-30
	public List<Map<String, Object>> lastSche(int m_seq){
		List<Map<String, Object>> list = null;
		if(scheDao.lastSche(m_seq)!=null) {
			list = scheDao.lastSche(m_seq);
		}
		return list;
	}
	
	//2023-09-04
	public int planCnt(int s_seq) {
		int cnt = 0;
		if(planDao.planCnt(s_seq)!=null) {
			cnt = planDao.planCnt(s_seq);
		}
		return cnt;
	}
	
	//2023-09-05
	public List<Map<String, Object>> slogPlan(Map<String, Object> map){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(planDao.slogPlan(map)!=null) {
			list = planDao.slogPlan(map);
		}
		return list;
	}
	
	//2023-09-18
	public void delDayPlan(PlanVO vo) {
		planDao.delDayPlan(vo);
	}
		
	
	//[희지]***********************************************************
	public String scheTitle(int s_seq) {
		return scheDao.scheTitle(s_seq);
	}
	
	public List<Map<String, Object>> myIngSche(int m_seq){
		return scheDao.myIngSche(m_seq);
	}	
	
	
	//[새미]***********************************************************
	public ScheVO schSelectOne(int s_seq) {
		 return scheDao.schSelectOne(s_seq);
	}

	
}
