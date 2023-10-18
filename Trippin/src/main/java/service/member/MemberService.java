package service.member;

import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;

import dao.admin.CouponDAO;
import dao.admin.L_CouponDAO;
import dao.common.Addr1DAO;
import dao.common.FormDAO;
import dao.common.JjimDAO;
import dao.common.ReviewDAO;
import dao.common.Review_CmtDAO;
import dao.common.Review_Cmt_LikeDAO;
import dao.common.Review_LikeDAO;
import dao.member.CashDAO;
import dao.member.CouponlistDAO;
import dao.member.Level_PointDAO;
import dao.member.M_ReportDAO;
import dao.member.M_Report_CateDAO;
import dao.member.MemberDAO;
import dao.member.MycashDAO;
import dao.member.MypointDAO;
import dao.member.NewplaceDAO;
import dao.member.NoticelistDAO;
import dao.member.PointDAO;
import dao.member.ReportDAO;
import dao.member.Report_CateDAO;
import dao.member.RevisionDAO;
import dao.member.S_ReportDAO;
import dao.sche.NuguDAO;
import dao.sche.ScheDAO;
import dao.sche.StyleDAO;
import dao.slog.SlogDAO;
import dao.slog.Slog_CmtDAO;
import dao.slog.Slog_LikeDAO;
import dao.ticket.TicketDAO;
import dao.ticket.Ticket_CateDAO;
import dao.ticket.TkjjimDAO;
import service.admin.AdminService;
import service.login.LoginService;
import vo.admin.CouponVO;
import vo.admin.L_CouponVO;
import vo.common.Addr1VO;
import vo.common.JjimVO;
import vo.common.ReviewVO;
import vo.common.Review_CmtVO;
import vo.common.Review_Cmt_LikeVO;
import vo.common.Review_LikeVO;
import vo.member.CouponlistVO;
import vo.member.M_ReportVO;
import vo.member.M_Report_CateVO;
import vo.member.MemberVO;
import vo.member.MycashVO;
import vo.member.MypointVO;
import vo.member.NewplaceVO;
import vo.member.NoticelistVO;
import vo.member.ReportVO;
import vo.member.Report_CateVO;
import vo.member.RevisionVO;
import vo.member.Revision_CateVO;
import vo.member.S_ReportVO;
import vo.slog.SlogVO;
import vo.slog.Slog_CmtVO;
import vo.slog.Slog_LikeVO;
import vo.ticket.TkjjimVO;

public class MemberService {

	private AdminService adminService;
	private LoginService loginService;
	
	private MemberDAO memberDao;
	private JjimDAO jjimDao;
	private FormDAO formDao;
	private Report_CateDAO report_cateDao;
	private ReportDAO reportDao;
	private M_Report_CateDAO m_report_cateDao;
	private M_ReportDAO m_reportDao;
	private NewplaceDAO newplaceDao;
	private ReviewDAO reviewDao;
	private Review_LikeDAO review_likeDao;
	private Review_CmtDAO review_cmtDao;
	private Review_Cmt_LikeDAO review_cmt_likeDao;
	private RevisionDAO revisionDao;
	private CouponDAO couponDao;
	private CouponlistDAO couponlistDao;
	private CashDAO cashDao;
	private MycashDAO mycashDao;	
	private SlogDAO slogDao;
	private NuguDAO nuguDao;
	private StyleDAO styleDao;
	private Addr1DAO addr1Dao;
	private ScheDAO scheDao;
	private Slog_LikeDAO slog_likeDao;
	private Slog_CmtDAO slog_cmtDao;
	private S_ReportDAO s_reportDao;
	private PointDAO pointDao;
	private MypointDAO mypointDao;
	private Level_PointDAO level_pointDao;
	private L_CouponDAO l_couponDao;
	private NoticelistDAO noticelistDao;
	private TicketDAO ticketDao;
	private Ticket_CateDAO ticket_cateDao;
	private TkjjimDAO tkjjimDao;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Value("${globals.dir}")
	private String FILEPATH;
	
	public MemberService(MemberDAO memberDao,
			JjimDAO jjimDao,
			FormDAO formDao,
			Report_CateDAO report_cateDao,
			ReportDAO reportDao,
			M_Report_CateDAO m_report_cateDao,
			M_ReportDAO m_reportDao,
			NewplaceDAO newplaceDao,
			ReviewDAO reviewDao,
			Review_LikeDAO review_likeDao,
			Review_CmtDAO review_cmtDao,
			Review_Cmt_LikeDAO review_cmt_likeDao,
			RevisionDAO revisionDao,
			CouponDAO couponDao,
			CouponlistDAO couponlistDao,
			CashDAO cashDao,
			MycashDAO mycashDao,
			SlogDAO slogDao,
			Slog_CmtDAO slog_cmtDao,
			NuguDAO nuguDao,
			StyleDAO styleDao,
			Addr1DAO addr1Dao,
			ScheDAO scheDao,
			Slog_LikeDAO slog_likeDao,
			NoticelistDAO noticelistDao,
			PointDAO pointDao,
			MypointDAO mypointDao,
			Level_PointDAO level_pointDao,
			L_CouponDAO l_couponDao,
			TicketDAO ticketDao,
			Ticket_CateDAO ticket_cateDao,
			TkjjimDAO tkjjimDao
			) {
		this.memberDao = memberDao;
		this.jjimDao = jjimDao;
		this.formDao = formDao;
		this.report_cateDao  = report_cateDao;
		this.reportDao = reportDao;
		this.m_report_cateDao = m_report_cateDao;
		this.m_reportDao = m_reportDao;
		this.newplaceDao = newplaceDao;
		this.reviewDao = reviewDao;
		this.review_likeDao = review_likeDao;
		this.review_cmtDao = review_cmtDao;
		this.review_cmt_likeDao = review_cmt_likeDao;
		this.revisionDao =revisionDao;
		this.couponDao = couponDao;
		this.couponlistDao = couponlistDao;
		this.cashDao = cashDao;
		this.mycashDao = mycashDao;
		this.slogDao = slogDao;
		this.slog_cmtDao = slog_cmtDao;
		this.nuguDao = nuguDao;
		this.styleDao = styleDao;
		this.addr1Dao = addr1Dao;
		this.scheDao = scheDao;
		this.slog_likeDao = slog_likeDao;
		this.noticelistDao = noticelistDao;
		this.pointDao = pointDao;
		this.mypointDao = mypointDao;
		this.level_pointDao = level_pointDao;
		this.l_couponDao = l_couponDao;
		this.ticketDao = ticketDao;
		this.ticket_cateDao = ticket_cateDao;
		this.tkjjimDao = tkjjimDao;
	}
	
	
	//[현지]*******************************************************
	
	//Member
	public int insert(MemberVO vo) {
		return memberDao.insert(vo);
	}
	
	public boolean checkEmail(String m_email) {
		boolean check = false;
		if(memberDao.checkEmail(m_email) != null) {
			check = true;
		}
		return check;
	}

	public MemberVO mypage(int m_seq) {
		return memberDao.mypage(m_seq);
	}
	
	public int updatePw(MemberVO vo) {
		return memberDao.updatePw(vo);
	}
	
	public int updateProfile(MemberVO vo) {
		return memberDao.updateProfile(vo);
	}
	
	public int nowM_Seq() {
		return memberDao.nowM_Seq();
	}
	
	public Map<String, Object> m_info(int m_seq){
		return memberDao.m_info(m_seq);
	}
	
	public List<Map<String, Object>> rv_a1list(int m_seq){
		return memberDao.rv_a1list(m_seq);
	}
	
	public List<Addr1VO> slog_a1list(SlogVO vo){
		return memberDao.slog_a1list(vo);
	}
	
	public String selectM_email(int m_seq) {
		return memberDao.selectM_email(m_seq);
	}
	
	public int selectM_seq2(String m_code) {
		return memberDao.selectM_seq2(m_code);
	}
	
//	public int selectM_seq2(Map<String, Object> map) {
//		return memberDao.selectM_seq2(map);
//	}
	
	public int inputRecom_code(MemberVO vo) {
		return memberDao.inputRecom_code(vo);
	}
	
	//jjim
	public int insert(JjimVO vo) {
		return jjimDao.insert(vo);
	}
	
	public int update(JjimVO vo) {
		return jjimDao.update(vo);
	}
	
	public int deleteJJIM(JjimVO vo) {
		return jjimDao.deleteJJIM(vo);
	}
	
	public int countjjim(int f_seq) {
		return jjimDao.countjjim(f_seq);
	}
	
	public List<JjimVO> myjjimlist(int m_seq){
		return jjimDao.myjjimlist(m_seq);
	}

	public boolean checkJJIM(JjimVO vo) {
		boolean check = false;
		if(jjimDao.checkJJIM(vo) != null) {
			check = true;
		}
		return check;
	}
	
	
	//form
	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return formDao.selectList(map);
	}
	
	public Map<String, Object> selectForm(int f_seq) {
		return formDao.selectForm(f_seq);
	}
	
	
	//newplace
	public int insert(NewplaceVO vo) {
		return newplaceDao.insert(vo);
	}
	
	public int selectNP_seq() {
		return newplaceDao.selectNP_seq();
	}
	
	
	//review
	public int insert(ReviewVO vo) {
		return reviewDao.insert(vo);
	}
	
	public int updateRV(ReviewVO vo) {
		return reviewDao.updateRV(vo);
	}
	
	public int deleteMyRV(int rv_seq) {
		return reviewDao.deleteMyRV(rv_seq);
	}
	
	public String selectRVImg(int rv_seq) {
		return reviewDao.selectRVImg(rv_seq);
	}
	
	public int nowRV_Seq() {
		return reviewDao.nowRV_Seq();
	}
	
	public int RVcntForOne(int f_seq) {
		return reviewDao.RVcntForOne(f_seq);
	}
	
	public List<Map<String , Object>> selectRVList(Map<String, Object> map){
		return reviewDao.selectRVList(map);
	}
	
	public Map<String , Object> selectRV(int rv_seq){
		return reviewDao.selectRV(rv_seq);
	}
	
	public List<Map<String, Object>> m_RVlist(int m_seq){
		return reviewDao.m_RVlist(m_seq);
	}
	
	public int rpCnt(int m_seq) {
		return reviewDao.rpCnt(m_seq);
	}
	
	
	// 한 게시물 리뷰 목록 뽑기
	public List<Map<String, Object>> rvlist(Map<String, Object> map, Integer m_seq, int f_seq, int now_y, int now_m){
		List<Map<String, Object>> rvlist = this.selectRVList(map) == null ? null : this.selectRVList(map);
		
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
        		
//	        		//리뷰 쓴 회원 프로필 사진
//	        		String profilePathString = (String)rvlist.get(i).get("M_PROFILE");
//	                
//	        		System.out.println("경로이름?: "+profilePathString);
//	        		
//	        		Path profilePath = Paths.get(profilePathString);
//	                System.out.println("Path?:"+profilePath);
//	                
//	                File profile = new File(FILEPATH + profilePath);
//	                System.out.println("File?: "+profile);
//	                System.out.println("FILEPATH?: "+ FILEPATH);
//	                
//	                String[] m_profile = profile.list();
//	                System.out.println("사진??: "+ m_profile[0]);
//	                rvlist.get(i).put("m_profileNM", m_profile[0]);
//	                
//	                //리뷰에 올린 사진들 rv_img
//	                File rvimg = new File(FILEPATH + rvlist.get(i).get("RV_IMG"));
//					
//				    if(rvimg != null) { 
//					    String[] rv_imgNM = rvimg.list();
//					  	    rvlist.get(i).put("rv_imgNM", rv_imgNM);
//				    }
                
			    //리뷰 좋아요 기능
			    if(m_seq != null) {
			    	Review_LikeVO rlvo = new Review_LikeVO();
			    	rlvo.setM_seq(m_seq);
			    	rlvo.setRv_seq(Integer.parseInt((String.valueOf(rvlist.get(i).get("RV_SEQ")))));
			    	
			    	boolean checkRVL = this.checkRVL(rlvo);
			    	
			    	rvlist.get(i).put("checkRVL", checkRVL);
			    }
			    
			    
			    //리뷰 내용 줄이기
			    String content = (String)rvlist.get(i).get("CONTENT");
				String newcontent = " " + content;
				
				if(content.length() >= 100) {
					rvlist.get(i).put("CONTENT", newcontent.substring(1, 100) + "...");
				}else {
					rvlist.get(i).put("CONTENT", newcontent);
				}
			    
				//수정, 삭제를 위한 내 게시물 구분
				int getM_seq = Integer.parseInt(String.valueOf(rvlist.get(i).get("M_SEQ")));
				boolean check = false;
				
				if(m_seq != null && m_seq == getM_seq) {
					check = true;
				}
				rvlist.get(i).put("isMyRV", check);
        	}
        }
		return rvlist;
	}
	
	
	//review_like
	public int insert(Review_LikeVO vo) {
		return review_likeDao.insert(vo);
	}
	
	public int deleteRVL(Review_LikeVO vo) {
		return review_likeDao.deleteRVL(vo);
	}
	
	public int countRVL(int rv_seq) {
		return review_likeDao.countRVL(rv_seq);
	}
	
	public List<Map<String, Object>> RVL_Mlist(int rv_seq){
		return review_likeDao.RVL_Mlist(rv_seq);
	}
	
	public boolean checkRVL(Review_LikeVO vo) {
		boolean check = false;
		if(review_likeDao.checkRVL(vo) != null) {
			check = true;
		}
		return check;
	}
	
	//review_cmt
	public int insert(Review_CmtVO vo) {
		return review_cmtDao.insert(vo);
	}
	
	public int updateRC(Review_CmtVO vo) {
		return review_cmtDao.updateRC(vo);
	}
	
	public int deleteRC(int rv_cmt_seq) {
		return review_cmtDao.deleteRC(rv_cmt_seq);
	}
	
	public int nowRv_cmt_seq() {
		return review_cmtDao.nowRv_cmt_seq();
	}
	
	public List<Map<String, Object>> selectRClist(int rv_seq){
		return review_cmtDao.selectRClist(rv_seq);
	}
	
	
	//review_cmt_like
	public int insert(Review_Cmt_LikeVO vo) {
		return review_cmt_likeDao.insert(vo);
	}
	
	public int deleteRCL(Review_Cmt_LikeVO vo) {
		return review_cmt_likeDao.deleteRCL(vo);
	}
	
	public int countRCL(int rv_cmt_seq) {
		return review_cmt_likeDao.countRCL(rv_cmt_seq);
	}
	
	public List<Map<String , Object>> RCL_Mlist(int rv_cmt_seq){
		return review_cmt_likeDao.RCL_Mlist(rv_cmt_seq);
	}
	
	public boolean checkRCL(Review_Cmt_LikeVO vo) {
		boolean check = false;
		if(review_cmt_likeDao.checkRCL(vo) != null) {
			check = true;
		}
		return check;
	}
	
	
	//slog
	public List<Map<String, Object>> m_SlogList(int m_seq){
		return  slogDao.m_SlogList(m_seq);
	}
	
	public String selectWho(int nugu_seq) {
		return nuguDao.selectWho(nugu_seq);
	}
		
	public String selectWhat(int style_seq) {
		return styleDao.selectWhat(style_seq);
	}
	
	public String addr1_name(int addr_seq) {
		return addr1Dao.addr_name(addr_seq);
	}
	
	public Map<String, Object> fromScheToSlog(int s_seq) {
		return scheDao.fromScheToSlog(s_seq);
	}
	
	public int slog_rpCnt(int m_seq) {
		return slogDao.slog_rpCnt(m_seq);
	}
	
	
	//slog_like
	public int insert(Slog_LikeVO vo) {
		return slog_likeDao.insert(vo);
	}
	
	public int deleteSLike(Slog_LikeVO vo) {
		return slog_likeDao.deleteSLike(vo);
	}
	
	public int countSLike(int slog_seq) {
		return slog_likeDao.countSLike(slog_seq);
	}
	
	public List<Map<String, Object>> SLike_Mlist(int slog_seq){
		return slog_likeDao.SLike_Mlist(slog_seq);
	}
	
	public boolean checkSLike(Slog_LikeVO vo) {
		boolean check = false;
		if(slog_likeDao.checkSLike(vo) != null) {
			check = true;
		}
		return check;
	}
	
	//ticket
	public List<Map<String, Object>> tkList(Map<String, Object> map){
		return ticketDao.tkList(map);
	}
	
	public int tkCNT() {
		return ticketDao.tkCNT();
	}
	
	public Map<String, Object> selectTK_m(int ticket_seq){
		return ticketDao.selectTK_m(ticket_seq);
	}
	
	public List<Map<String, Object>> selectCCP(int ticket_seq){
		return ticketDao.selectCCP(ticket_seq);
	}
	
	public List<String> TcateNames(int ticket_seq){
		return ticketDao.TcateNames(ticket_seq);
	}
	
	
	//ticket_cate
	public String tkcateName(int ticket_cate_seq) {
		return ticket_cateDao.tkcateName(ticket_cate_seq);
	}
	
	//tkjjim
	public int insert(TkjjimVO vo) {
		return tkjjimDao.insert(vo);
	}
	
	public int update(TkjjimVO vo) {
		return tkjjimDao.update(vo);
	}
	
	public int deleteJJIM(TkjjimVO vo) {
		return tkjjimDao.deleteTKJJIM(vo);
	}
	
	public int countTKjjim(int ticket_seq) {
		return tkjjimDao.countTKjjim(ticket_seq);
	}
	
	public List<TkjjimVO> myTKjjimlist(int m_seq){
		return tkjjimDao.myTKjjimlist(m_seq);
	}

	public boolean checkTKJJIM(TkjjimVO vo) {
		boolean check = false;
		if(tkjjimDao.checkTKJJIM(vo) != null) {
			check = true;
		}
		return check;
	}
	
	
	//coupon
	public List<Map<String, Object>> myCoupon(int m_seq){
		return couponlistDao.myCoupon(m_seq);
	}


	
	//[희지]***********************************************************
	public int count(int cate_seq) {
		return formDao.count(cate_seq);
	}
	
	public List<Report_CateVO> r_cateList(){
		return report_cateDao.select();
	}
	
	public List<M_Report_CateVO> mr_cateList(){
		return m_report_cateDao.select();
	}
	
	public int r_insert(ReportVO vo) {
		return reportDao.insert(vo);
	}
	
	public int mr_insert(M_ReportVO vo) {
		return m_reportDao.insert(vo);
	}
	
	public List<CouponVO> welcome(){
		return couponDao.welcome();
	}
	
	public List<Integer> new_month(int month){
		return couponDao.new_month(month);
	}
	
	public List<CouponVO> new_special() {
		return couponDao.new_special();
	}

	public int insertCoupon(CouponlistVO vo) {
		return couponlistDao.insertCoupon(vo);
	}
	
	public int deleteCoupon() {
		return couponlistDao.deleteCoupon();
	}
	
	// 캐시 관리
	public int percent(int kind) {
		return cashDao.percent(kind);
	}
	
	public int cashInsert(MycashVO vo) {
		return mycashDao.cashInsert(vo);
	}
	
	public int mycashSeq() {
		return mycashDao.mycashSeq();
	}
	
	public int updateEarn() {
		return mycashDao.updateEarn();
	}
	
	public int endCash(int m_seq) {
		return mycashDao.endCash(m_seq);
	}
	
	public int soonEnd(int m_seq) {
		return mycashDao.soonEnd(m_seq);
	}
	
	public int updateEnd(int m_seq) {
		return mycashDao.updateEnd(m_seq);
	}
	
	public List<MycashVO> canUseList(int m_seq){
		return mycashDao.canUseList(m_seq);
	}
	
	public int canUse(int m_seq) {
		return mycashDao.canUse(m_seq);
	}
	
	public int updateUse(MycashVO vo) {
		return mycashDao.updateUse(vo);
	}
	
	public int cancelCash(MycashVO vo) {
		return mycashDao.cancelCash(vo);
	}
	
	public List<Map<String, Object>> branches(int f_seq){
		return formDao.branches(f_seq);
	}
	
	public int preNotice(Map<String, Object> map) {
		return noticelistDao.preNotice(map);
	}
	
	public int noticeInsert(NoticelistVO vo) {
		return noticelistDao.noticeInsert(vo);
	}
	
	public int couponBye(Map<String, Object> map) {
		return couponlistDao.couponBye(map);
	}
	
	public int spareDay(Map<String, Object> map) {
		return couponlistDao.spareDay(map);
	}
	
	public List<Map<String, Object>> myNotice(int m_seq){
		return noticelistDao.myNotice(m_seq);
	}
	
	public Review_CmtVO rv_seq(Review_Cmt_LikeVO vo) {
		return review_cmt_likeDao.rv_seq(vo);
	}
	
	public Map<String, Object> findReview(int rv_seq){
		return review_likeDao.findReview(rv_seq);
	}
	
	public int whoRv(int rv_seq) {
		return reviewDao.whoRv(rv_seq);
	}
	
	public SlogVO slogSome(int slog_seq) {
		return slogDao.slogSome(slog_seq);
	}
	
	public Slog_CmtVO scmtSome(int slog_cmt_seq) {
		return slog_cmtDao.scmtSome(slog_cmt_seq);
	}
	
	public String point(String p_table) {
		return pointDao.point(p_table);
	}
	
	public int pointInsert(MypointVO vo) {
		return mypointDao.pointInsert(vo);
	}
	
	public Map<String, Object> r_someInfo(int revision_seq) {
		return revisionDao.r_someInfo(revision_seq);
	}
	
	public int point_seq(String p_table) {
		return pointDao.point_seq(p_table);
	}
	
	public Map<String, Object> rv_someInfo(int rv_seq){
		return reviewDao.rv_someInfo(rv_seq);
	}
	
	public int rvPoint(MypointVO vo) {
		return mypointDao.rvPoint(vo);
	}
	
	public int pointCount(Map<String, Object> map) {
		return mypointDao.pointCount(map);
	}
	
	public int myLevel(int m_seq) {
		return memberDao.myLevel(m_seq);
	}
	
	public int levelUp(MemberVO vo) {
		return memberDao.levelUp(vo);
	}
	
	public int whichLevel(int m_seq) {
		return level_pointDao.whichLevel(m_seq);
	}
	
	public List<L_CouponVO> levelCoupon(int level_no){
		return l_couponDao.levelCoupon(level_no);
	}
	
	public Map<String, Object> slogCount(int slog_seq){
		return slogDao.slogCount(slog_seq);
	}

	// 포인트 부여 (기능별 메소드 분할)
	
	// revision, revision_status
	// revisionPoint("revision", revo, HttpServletRequest request)
	public int revisionPoint(String table, RevisionVO revo, HttpServletRequest request) {
		Integer now_seq = (Integer) request.getSession().getAttribute("login");
		
		int point = Integer.parseInt(this.point(table));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = this.r_someInfo(revo.getRevision_seq());
		
		if(revo.getM_seq() != now_seq) {	// 정보 수정 반영된 경우
			table += "_status";
			
			String[] points = this.point(table).split(",");
			
			if(map.get("REVISION_IMG") == null) {	// 사진 없는 경우
				point = Integer.parseInt(points[0]);
			}else {	// 사진 있는 경우
				point = Integer.parseInt(points[1]);
			}
		}
		
		String url = "";
		if(map.get("CATE_SEQ").equals("1") ) {	// 관광지인 경우
			url = "tour,Tour,";
		}else if(map.get("CATE_SEQ").equals("2")) {	// 맛집인 경우
			url = "hotple,Hotple,";
		}
		url += map.get("F_SEQ");
		
		int p_seq = this.point_seq(table);
		String content = map.get("NAME").toString();
		
		MypointVO mpvo = new MypointVO(revo.getM_seq(), p_seq, point, content, url);
		return this.pointInsert(mpvo);
	}
	
	// slog
	public int slogPoint(String table, int slog_seq) {
		SlogVO svo = this.slogSome(slog_seq);
		System.out.println(table);
		int p_seq = this.point_seq(table);
		int point = Integer.parseInt(this.point(table));
		String url = "";
		String content = svo.getTitle();
		
		if(svo.getStatus()  == 2) {
			point *= -1;
			content += ",삭제";
		}else {
			content += ",공유";
			url += slog_seq;
		}
		
		MypointVO mpvo = new MypointVO(svo.getM_seq(), p_seq, point, content, url);
		return this.pointInsert(mpvo);
	}
	
	// slog_like, slog_add
	public int slogPlusPoint(String table, int slog_seq) {
		Map<String, Object> map = this.slogCount(slog_seq);
		int p_seq = this.point_seq(table);
		int point = Integer.parseInt(this.point(table));
		
		map.put("table1", "p_seq");
		map.put("value1", p_seq);
		map.put("table2", "url_in");
		map.put("value2", slog_seq);
		int cnt = this.pointCount(map);
		
		int count = 0;
		if(table.equals("slog_add")) {
			count = Integer.parseInt(map.get("S_ADD").toString());
		}else {
			count = Integer.parseInt(map.get("S_LIKE").toString());
		}
		
		if(count/5 > cnt) {
			String url = slog_seq + "";
			String content = map.get("TITLE").toString();
			int m_seq = Integer.parseInt(map.get("M_SEQ").toString());
			
			MypointVO mpvo = new MypointVO(m_seq, p_seq, point, content, url);
			return this.pointInsert(mpvo);
		}else {
			return 0;
		}
	}
	
	// review, review_first
	// reviewPoint("review", rvo)
	public int reviewPoint(String table, int rv_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = this.rv_someInfo(rv_seq);
		int m_seq = Integer.parseInt(map.get("M_SEQ").toString());
		
		String content = map.get("NAME").toString();
		MypointVO mpvo = new MypointVO();
		int p_seq = 0;
		int point = 0; String url = "";
		String[] points = this.point(table).split(",");
		
		if(((BigDecimal)map.get("REPORT_STATUS")).intValue() != 2) {	// 리뷰 작성일 경우
			url = rv_seq + "";
			content += ",작성";
			
			System.out.println(((BigDecimal)map.get("CNT")).intValue() == 1);
			System.out.println(((BigDecimal)map.get("CNT")).intValue());
			
			if(((BigDecimal)map.get("CNT")).intValue() == 1) {	// 첫 번째 리뷰 작성인 경우
				p_seq = this.point_seq(table + "_first");
				point = Integer.parseInt(this.point(table + "_first"));
				mpvo = new MypointVO(m_seq, p_seq, point, content, url);
				this.pointInsert(mpvo);
			}
			
			p_seq = this.point_seq(table);
			
			if(map.get("RV_IMG") == null) {	// 사진 없는 경우
				point = Integer.parseInt(points[0]);
			}else {	// 사진 있는 경우
				point = Integer.parseInt(points[1]);
			}
			
		}else {	// 리뷰 삭제일 경우
			
			content += ",삭제";
			p_seq = this.point_seq(table);
			
			if(map.get("RV_IMG") == null) {	// 사진 없는 경우
				point = -Integer.parseInt(points[0]);
			}else {	// 사진 있는 경우
				point = -Integer.parseInt(points[1]);
			}
		}
		
		mpvo = new MypointVO(m_seq, p_seq, point, content, url);
		return this.pointInsert(mpvo);
	}
	
	// rvLikePoint("review_like", vo)
	public int rvLikePoint(String table, int rv_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = this.findReview(rv_seq);
		int p_seq = this.point_seq(table);
		
		int m_seq = Integer.parseInt(map.get("M_SEQ").toString());
		int count = Integer.parseInt(map.get("CNT").toString()); // 리뷰 좋아요 수
		
		map.put("table1", "p_seq");
		map.put("value1", p_seq);
		map.put("table2", "url_in");
		map.put("value2", rv_seq);
		int cnt = this.pointCount(map); // 포인트 받은 수
		
		if(count/5 > cnt) {	// 5개당 주는 데... 그에 해당하는 포인트를 덜 받았다면
			String url = rv_seq + "";
			int point = Integer.parseInt(this.point(table));
			String content = map.get("F_NAME").toString();
			
			MypointVO mpvo = new MypointVO(m_seq, p_seq, point, content, url);
			return this.pointInsert(mpvo);
			
		}else {
			return 0;
		}
	}
	
	// newplace
	// newplacePoint("newplace", np_seq)
	public int newplacePoint(String table, int np_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		NewplaceVO npvo = adminService.npOne(np_seq);
		
		int p_seq = this.point_seq(table);
		String[] points = this.point(table).split(",");
		
		if(npvo.getStatus() != 1) {	// 승인이 아닌 경우 그냥 return
			return 0;
		}
		
		int point = 0;
		if(npvo.getInfo_img() == null) {
			point = Integer.parseInt(points[0]);
		}else {
			point = Integer.parseInt(points[1]);
		}
		
		MypointVO mpvo = new MypointVO(npvo.getM_seq(), p_seq, point, null, null);
		return this.pointInsert(mpvo);
	}
	
	// member, member_invite
	// memberPoint("member", m_seq, HttpServletRequest request)
	public int memberPoint(String table, int m_seq2, HttpServletRequest request) {
		Integer m_seq = (Integer) request.getSession().getAttribute("login");
		
		System.out.println(m_seq);
		
		Map<String, Object> map = new HashMap<String, Object>();
		int p_seq = this.point_seq(table);
		int point = Integer.parseInt(this.point(table));
		
		// 추천한 사람 먼저 포인트 주고(35회 미만이면)
		map.put("table1", "p_seq");
		map.put("value1", p_seq);
		map.put("table2", "m_seq");
		map.put("value2", m_seq2);
		int cnt = this.pointCount(map);	// 포인트 받은 수
		
		MypointVO mpvo = new MypointVO();
		
		String nick = memberDao.getM_nickname(m_seq);
		
		System.out.println(nick);
		if(cnt <= 35) {	// 입력 후 35명 세기 때문에(35명까지 포함)
			mpvo = new MypointVO(m_seq2, p_seq, point, nick, m_seq + "" );
			this.pointInsert(mpvo);
		}
		
		// 추천받은 사람 포인트 주기
		// 넣을 내용 먼저 상대방 닉네임으로 해주기(닉네임과 마이페이지 url)
		table += "_invite";
		point = Integer.parseInt(this.point(table));
		p_seq = this.point_seq(table);
		nick = memberDao.getM_nickname(m_seq2);
		mpvo = new MypointVO(m_seq, p_seq, point, nick, m_seq2 + "");
		return this.pointInsert(mpvo);
	}
	
	// 포인트로 레벨 변경
	public int levelUpDown(int m_seq) {
		int lev = this.myLevel(m_seq);	// 원래 레벨
		int re_lev = this.whichLevel(m_seq);	// 바뀔 레벨
		
		int su = 0;
		
		if(lev != re_lev) {
			MemberVO vo = new MemberVO();
			vo.setM_seq(m_seq);
			vo.setM_level(re_lev);
			su = this.levelUp(vo);
			
			// 레벨 변경은 됐으나 다운된 경우
			if(su != 0 && lev > re_lev) su = 2;
		}
		return su;
	}
	
	// 이미 간 알람인지(땡큐)
	public int sameNotice(NoticelistVO vo) {
		return noticelistDao.sameNotice(vo);
	}

	// 레벨 상승 알림(레벨 상승 시) 6
	public void levelNotice(int m_seq) {
		int lev = this.myLevel(m_seq);
		
		NoticelistVO nvo = new NoticelistVO();
		nvo.setNotice_seq(6);
		nvo.setM_seq(m_seq);
		nvo.setContent(lev + "");
		this.noticeInsert(nvo);
	}

	// 레벨 쿠폰 부여
	public void l_couponGive(int m_seq) {
		int lev = this.myLevel(m_seq);
		List<L_CouponVO> list = this.levelCoupon(lev);
		if(list.isEmpty()) return;
		
		if(l_Already(m_seq, list)) {
			CouponlistVO vo = new CouponlistVO();
			vo.setM_seq(m_seq);
			vo.setKind(1);
			
			for(L_CouponVO lvo : list) {
				int plus = lvo.getValid_date();
				Calendar ca = Calendar.getInstance();
				ca.add(Calendar.DATE, plus);
				java.util.Date d = ca.getTime();
				Date date = new Date(d.getTime());
				vo.setValid_date(date);
				
				vo.setCoupon_no(lvo.getL_coupon_seq());
				this.insertCoupon(vo);
			}
		}
	}
	
	public boolean l_Already(int m_seq, List<L_CouponVO> list) {
		boolean check = false;
		
		for(L_CouponVO lvo:list) {
			int su = couponlistDao.l_already(list);
			if(su != 0) {
				check = true;
			}
		}
		return check;
	}
	
	public boolean readThis(int noticelist_seq) {
		boolean check = false;
		if(noticelistDao.readThis(noticelist_seq) != 0) {
			check = true;
		}
		return check;
	}
	
	public List<Map<String, Object>> mycash(int m_seq){
		return mycashDao.mycash(m_seq);
	}
	
	public List<Map<String, Object>> mypoint(int m_seq){
		return mypointDao.mypoint(m_seq);
	}
	
	public int point(int m_seq) {
		return mypointDao.point(m_seq);
	}
	
	public void afterPoint(int m_seq) {
		int su = this.levelUpDown(m_seq);
		if(su != 0) {
			this.levelNotice(m_seq);
			this.l_couponGive(m_seq);
		}
	}
	
	
	
	
	//[새미]*******************************************************
	// 정보수정제안

	public List<Revision_CateVO> revisionCateList() {
		return revisionDao.revisionCateList();
	}

	public int revInsert(RevisionVO revo) {
		return revisionDao.revInsert(revo);
	}

	public int upStatusRev(int revision_seq) {
		return revisionDao.upStatusRev(revision_seq);
	}

	public List<Map<String, Object>> appAllRevq(Map<String, Object> map) {

		List<Map<String, Object>> list = revisionDao.appAllRevq(map);
		if (list.isEmpty()) {
			list = null;
		}

		return list;

	}

	public int revisionTotal(Map<String, Object> map) {
		return revisionDao.revisionTotal(map);
	}

	// 정보수정제안 seq
	public int revSeqOne() {
		return revisionDao.revSeqOne();

	}

	// 멤버 getSelectOne
	public MemberVO getMember(int m_seq) {
		return memberDao.getMember(m_seq);
	}

	public List<MemberVO> memberList(Map<String, Object> map) {
		return memberDao.memberList(map);
	}

	// 추가///////////
	// 여행 신고 insert
	public int sr_insert(S_ReportVO srvo) {
		return s_reportDao.sr_insert(srvo);
	}

	public int srSeq() {
		return s_reportDao.srSeq();
	}
	
}
