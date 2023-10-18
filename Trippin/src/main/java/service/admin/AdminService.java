package service.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.accom.A_CateDAO;
import dao.accom.PaymentDAO;
import dao.admin.CouponDAO;
import dao.admin.L_CouponDAO;
import dao.common.Addr1DAO;
import dao.common.CancelDAO;
import dao.common.F_TipsDAO;
import dao.common.FormDAO;
import dao.common.RefundDAO;
import dao.common.ReviewDAO;
import dao.common.Review_CmtDAO;
import dao.common.Tip_KeywordDAO;
import dao.common.TipsDAO;
import dao.member.CSDAO;
import dao.member.CS_CateDAO;
import dao.member.CS_SubCateDAO;
import dao.member.CouponlistDAO;
import dao.member.InquiryDAO;
import dao.member.Level_PointDAO;
import dao.member.M_ReportDAO;
import dao.member.M_Report_CateDAO;
import dao.member.MemberDAO;
import dao.member.NewplaceDAO;
import dao.member.ReportDAO;
import dao.member.Report_CateDAO;
import dao.member.RevisionDAO;
import dao.member.S_ReportDAO;
import dao.slog.SlogDAO;
import dao.slog.Slog_CmtDAO;
import dao.ticket.T_PurchaseDAO;
import dao.ticket.TicketDAO;
import dao.tour.Tour_CateDAO;
import vo.accom.A_CateVO;
import vo.admin.CouponVO;
import vo.admin.L_CouponVO;
import vo.common.Addr1VO;
import vo.common.CancelVO;
import vo.common.F_TipsVO;
import vo.common.FormVO;
import vo.common.RefundVO;
import vo.common.ReviewVO;
import vo.common.Review_CmtVO;
import vo.common.TipsVO;
import vo.member.CSVO;
import vo.member.CS_CateVO;
import vo.member.CS_SubCateVO;
import vo.member.CouponlistVO;
import vo.member.InquiryVO;
import vo.member.Level_PointVO;
import vo.member.M_ReportVO;
import vo.member.M_Report_CateVO;
import vo.member.MemberVO;
import vo.member.NewplaceVO;
import vo.member.ReportVO;
import vo.member.Report_CateVO;
import vo.member.RevisionVO;
import vo.member.S_ReportVO;
import vo.slog.SlogVO;
import vo.slog.Slog_CmtVO;
import vo.ticket.T_PurchaseVO;
import vo.tour.Tour_CateVO;

public class AdminService {
	
	private MemberDAO memberDao;
	private A_CateDAO a_cateDao;
	private Tour_CateDAO tour_cateDao;
	private Addr1DAO addr1Dao;
	private Level_PointDAO level_pointDao;
	private CouponDAO couponDao;
	private L_CouponDAO l_couponDao;
	private FormDAO formDao;
	private NewplaceDAO newplaceDao;
	private ReviewDAO reviewDao;
	private TicketDAO ticketDao;
	
	private CS_CateDAO cs_cateDao;
	private CS_SubCateDAO cs_subcateDao;
	private CSDAO csDao;
	private RevisionDAO revisionDao;
	private InquiryDAO inquiryDao;
	private ReportDAO reportDao;
	private M_ReportDAO m_reportDao;
	private M_Report_CateDAO m_report_cateDao;
	private Report_CateDAO report_cateDao;
	private Review_CmtDAO review_cmtDao;
	
	private CancelDAO cancelDao;
	private T_PurchaseDAO t_purchaseDao;
	private CouponlistDAO couponlistDao;
	private RefundDAO refundDao;
	private F_TipsDAO f_tipsDao;
	private Tip_KeywordDAO tip_keywordDao;
	private TipsDAO tipsDao;
	
	private S_ReportDAO s_reportDao;
	private SlogDAO slogDao;
	private Slog_CmtDAO slog_cmtDao;
	private PaymentDAO paymentDao;
	
	
	
	
	public AdminService(MemberDAO memberDao,
						A_CateDAO a_cateDao, 
						Tour_CateDAO tour_cateDao,
						Addr1DAO addr1Dao, 
						Level_PointDAO level_pointDao,
						CouponDAO couponDao, 
						L_CouponDAO l_couponDao,
						FormDAO formDao,
						NewplaceDAO newplaceDao,
						ReviewDAO reviewDao,
						CS_CateDAO cs_cateDao, 
						CS_SubCateDAO cs_subcateDao, 
						CSDAO csDao,
						RevisionDAO revisionDao, 
						InquiryDAO inquiryDao, 
						ReportDAO reportDao,
						M_ReportDAO m_reportDao, 
						M_Report_CateDAO m_report_cateDao, 
						Report_CateDAO report_cateDao,
						Review_CmtDAO review_cmtDao,
						CancelDAO cancelDao,
						T_PurchaseDAO t_purchaseDao,
						CouponlistDAO couponlistDao,
						RefundDAO refundDao,
						F_TipsDAO f_tipsDao,
						Tip_KeywordDAO tip_keywordDAO,
						TipsDAO tipsDao,
						S_ReportDAO s_reportDao,
						Slog_CmtDAO slog_cmtDao,
						SlogDAO slogDao,
						PaymentDAO paymentDao,
						TicketDAO ticketDao
						) {
		this.memberDao = memberDao;
		this.a_cateDao = a_cateDao;
		this.tour_cateDao = tour_cateDao;
		this.addr1Dao = addr1Dao;
		this.level_pointDao = level_pointDao;
		this.couponDao = couponDao;
		this.l_couponDao = l_couponDao;
		this.formDao = formDao;
		this.newplaceDao = newplaceDao;
		this.reviewDao = reviewDao;
		this.cs_cateDao = cs_cateDao;
		this.cs_subcateDao = cs_subcateDao;
		this.csDao = csDao;
		this.revisionDao = revisionDao;
		this.inquiryDao = inquiryDao;
		this.reportDao = reportDao;
		this.m_reportDao = m_reportDao;
		this.m_report_cateDao = m_report_cateDao;
		this.report_cateDao = report_cateDao;
		this.review_cmtDao =review_cmtDao;
		this.cancelDao = cancelDao;
		this.t_purchaseDao = t_purchaseDao;
		this.couponlistDao = couponlistDao;
		this.refundDao = refundDao;
		this.f_tipsDao = f_tipsDao;
		this.tip_keywordDao = tip_keywordDAO;
		this.tipsDao = tipsDao;
		this.s_reportDao = s_reportDao;
		this.slogDao = slogDao;
		this.slog_cmtDao = slog_cmtDao;
		this.paymentDao = paymentDao;
		this.ticketDao = ticketDao;
	}
	
	//[희지]*********************************************************************
	public List<A_CateVO> a_cate(){
		return a_cateDao.a_cate();
	}
	
	public List<Tour_CateVO> tour_cate(){
		return tour_cateDao.selectT_Cate();
	}
	
	public List<Addr1VO> addr1(){
		return addr1Dao.addr1();
	}
	
	public List<Level_PointVO> level_point(){
		return level_pointDao.level_point();
	}
	
	public int couponInsert(CouponVO vo) {
		return couponDao.insert(vo);
	}
	
	public List<CouponVO> couponSelect(Map<String, Object> map){
		return couponDao.select(map);
	}
	
	public int lCouponInsert(L_CouponVO vo) {
		return l_couponDao.insert(vo);
	}
	
	public CouponVO c_one(int coupon_seq) {
		return couponDao.selectOne(coupon_seq);
	}
	
	public L_CouponVO lc_one(int coupon_seq) {
		return l_couponDao.selectOne(coupon_seq);
	}
	
	public int totCount() {
		return couponDao.totCount();
	}
	
	public int someCount(Map<String, Object> map) {
		return couponDao.someCount(map);
	}
	
	public int deleteForm(int f_seq) {
		return formDao.delete(f_seq);
	}
	
	public String path(int f_seq) {
		return formDao.path(f_seq);
	}
	
	public List<Map<String, Object>> adminList(Map<String, Object> map){
		return formDao.adminList(map);
	}
	
	public int count(int cate_seq) {
		return formDao.count(cate_seq);
	}
	
	public int lc_re(int l_coupon_seq) {
		return l_couponDao.lc_re(l_coupon_seq);
	}
	
	public int lc_end(int l_coupon_seq) {
		return l_couponDao.lc_end(l_coupon_seq);
	}
	
	public int lc_stop(int l_coupon_seq) {
		return l_couponDao.lc_stop(l_coupon_seq);
	}
	
	public int couponRe(int coupon_seq) {
		return couponDao.couponRe(coupon_seq);
	}
	
	public int couponEnd(int coupon_seq) {
		return couponDao.couponEnd(coupon_seq);
	}
	
	public int couponStop(int coupon_seq) {
		return couponDao.couponStop(coupon_seq);
	}

	public List<Map<String, Object>> cancelList(Map<String, Object> map){
		return cancelDao.cancelList(map);
	}
	
	public int cancelCount(Map<String, Object> map) {
		return cancelDao.cancelCount(map);
	}
	
	public List<Map<String, Object>> ticketList(Map<String, Object> map){
		return t_purchaseDao.ticketList(map);
	}
	
	public Map<String, Object> ticketOne(int t_purchase_seq){
		return t_purchaseDao.ticketOne(t_purchase_seq);
	}
	
	public CancelVO cancel(CancelVO vo) {
		return cancelDao.cancel(vo);
	}
	
	public CouponlistVO returnCouponOk(CouponlistVO vo) {
		return couponlistDao.returnCouponOk(vo);
	}
	
	public int returnCoupon(int couponlist_seq) {
		return couponlistDao.returnCoupon(couponlist_seq);
	}
	
	public int refundInsert(RefundVO vo) {
		return refundDao.refundInsert(vo);
	}
	
	public int cancelFinish(int cancel_seq) {
		return cancelDao.cancelFinish(cancel_seq);
	}
	
	public RefundVO refund(int cancel_seq) {
		return refundDao.refund(cancel_seq);
	}
	
	public int ticketCount(Map<String, Object> map) {
		return t_purchaseDao.ticketCount(map);
	}
	
	public List<Map<String, Object>> oneTip(int f_seq){
		return f_tipsDao.oneTip(f_seq);
	}
	
	public List<String> tip_key(){
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
	
	public int sameTip(String tip) {
		return tipsDao.sameTip(tip);
	}
	
	public int tipInsert(F_TipsVO vo) {
		return f_tipsDao.tipInsert(vo);
	}
	
	public int sameTip(F_TipsVO vo) {
		return f_tipsDao.sameTip(vo);
	}
	
	public int updateTip(F_TipsVO vo) {
		return f_tipsDao.updateTip(vo);
	}
	
	public int deleteTip(Map<String, Object> map) {
		return f_tipsDao.deleteTip(map);
	}
	
	//[현지]*********************************************************************
	public List<NewplaceVO> selectNPList(Map<String,  Object> map){
		List<NewplaceVO> nplist = newplaceDao.selectNPList(map);
		
		if(nplist.isEmpty()) {
			nplist = null;
		}
		return nplist;
	}
	
	public int getTotal(Map<String, Object> map) {
		return newplaceDao.getTotal(map);
	}
	
	
	//ticket
	public List<String> TcateNames(int ticket_seq){
		return ticketDao.TcateNames(ticket_seq);
	}
	
	public List<Map<String, Object>> ticketList(){
		return ticketDao.ticketList();
	}
	
	public int ticketCnt() {
		return ticketDao.ticketCnt();
	}
	
	
	
	//새미*********************************************************************
	public List<CS_CateVO> csCateAll() {
		return cs_cateDao.csCateAll();
	}

	// ----------cs_subcate--------------------

	
	public List<CS_SubCateVO> csSubCateOne(int cs_cate_seq){
		return cs_subcateDao.csSubCateOne(cs_cate_seq);
	}
	
	
	public List<CS_SubCateVO> csSubCateAll() {
		return cs_subcateDao.csSubCateAll();
	}

	public List<CS_SubCateVO> csSubCateAll1() {
		return cs_subcateDao.csSubCateAll1();
	}

	public List<CS_SubCateVO> csSubCateAll2() {
		return cs_subcateDao.csSubCateAll2();
	}

	public List<CS_SubCateVO> csSubCateAll3() {
		return cs_subcateDao.csSubCateAll3();
	}
	public CS_SubCateVO csSubCateMyOn(int cs_seq){
		return cs_subcateDao.csSubCateMyOn(cs_seq);
	}
	
	public List<CS_SubCateVO> csSubCateList(){
		return cs_subcateDao.csSubCateList();
	}
	
	
	public int csUpdate(CSVO csvo) {
		
		return csDao.csUpdate(csvo);
		
	}
	

	// -----------cs----------------------------
	public List<CSVO> allTitle(Map<String, Object> map) {

		List<CSVO> csList = csDao.allTitle(map);
		if (csList.isEmpty()) {
			csList = null;
		}
		return csDao.allTitle(map);
	}

	// <!-- cs -->

	public int csDel(int cs_seq) {
		return csDao.csDel(cs_seq);
	}

	// <!-- csSEQ -->
	public int getCsSeq() {
		return csDao.getCsSeq();
	}

	// <!-- cs insert -->
	public int csInsert(CSVO csvo) {
		return csDao.csInsert(csvo);
	}
	//cs 페이징(count)
	public int cgetTotal(Map<String, Object> map) {
		
		return csDao.cgetTotal(map);
	}
	

	public Map<String, Object> getContent(int cs_seq) {

		Map<String, Object> map = csDao.getContent(cs_seq);

		String str = "";

		StringBuffer buf = new StringBuffer();

		Clob clob = (Clob) map.get("CONTENT");

		BufferedReader br = null;
		try {
			br = new BufferedReader(clob.getCharacterStream());
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			while ((str = br.readLine()) != null) {
				buf.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		map.put("CONTENT", buf.toString());

		return map;
	}

	// 정보제안
	// formlist
	public List<FormVO> formList() {
		return formDao.formList();
	}

	public RevisionVO getRevq(int revision_seq) {
		return revisionDao.getRevq(revision_seq);
	}

	public int appUpStatus(RevisionVO revo) {
		return revisionDao.appUpStatus(revo);
	}

	// <!-- 부적격으로 -->
	public int NonAppUpStatus(RevisionVO revo) {
		return revisionDao.NonAppUpStatus(revo);
	}
//1:1문의 

	public List<InquiryVO> inquiryList(Map<String, Object> map) {

		List<InquiryVO> list = inquiryDao.inquiryList(map);

		if (list.isEmpty()) {
			list = null;
		}
		return list;
	}

	public int getInquiryTotal(Map<String, Object> map) {
		return inquiryDao.getInquiryTotal(map);
	}

	public InquiryVO inquiryOne(int inquiry_seq) {
		return inquiryDao.inquiryOne(inquiry_seq);
	}

//1:1답변 업데이트

	public int doAnswerUp(InquiryVO iqvo) {
		return inquiryDao.doAnswerUp(iqvo);
	}

	// 자주묻는 질문 img리스트

	public List<CSVO> filelistCs(int cs_seq) {
		return csDao.filelistCs(cs_seq);
	}

//신고 리스트
//회원 신고 리스트
	public List<M_ReportVO> mReportLsit(Map<String, Object>map) {
		List<M_ReportVO> list = m_reportDao.mReportLsit(map);
		if(list.isEmpty()) {
			list=null;
		}
		
		return list;
	}
	
	public int mlistTotal(Map<String, Object>map){	
		return m_reportDao.mlistTotal(map);
	}

	public List<M_Report_CateVO> mRepCtselect() {
		return m_report_cateDao.select();
	}

//리뷰신고 리스트
	public List<Report_CateVO> reviewReportCateselect() {
		return report_cateDao.select();
	}

	public List<Map<String, Object>> reviewReportList(Map<String, Object> map){
		
		
		List<Map<String, Object>> list = reportDao.reviewReportList(map);
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	public int reportTotal(Map<String, Object> map){
		return reportDao.reportTotal(map);
				
	}
	

	public Map<String, Object> rvContent(int rv_seq){
		
		return reportDao.rvContent(rv_seq);
				
	}
	
	public Map<String, Object> rv_cmtContent(int rv_cmt_seq){
		return reportDao.rv_cmtContent(rv_cmt_seq);
				
	}
	//리뷰 신고 리뷰 상태업데이트
	public int HiddenRV(ReviewVO vo) {
		return reviewDao.HiddenRV(vo);
	}
	public int deleteRV(int rv_seq) {
		return reviewDao.deleteRV(rv_seq);
		
	}
	public List<Map<String, Object>> rv_seqDelete(){
		return reviewDao.rv_seqDelete();
	}
	public int defaultRV(ReviewVO vo) {
		return reviewDao.defaultRV(vo);
	}
	//리뷰 신고점수 누적
	public int scoreRV(Map<String, Object> map) {
		return reviewDao.scoreRV(map);
	}
	//점수리셋
	public int scoreReset(int rv_seq) {
		return reviewDao.scoreReset(rv_seq);
	}
	//리뷰댓글 신고점수 누적
	public int scoreRVC(Map<String, Object> map) {
		return review_cmtDao.scoreRVC(map);
	}
	//리뷰댓글 숨김
	public int HiddenRVC(Review_CmtVO vo) {
		return review_cmtDao.HiddenRVC(vo);
	}
	//리뷰댓글 삭제
	public int deleteRVC( ) {
		return review_cmtDao.deleteRVC();
	}
	//리뷰댓글 숨김해제
	public int defaultRVC(Review_CmtVO vo) {
		return review_cmtDao.defaultRVC(vo);
	}
	//리뷰댓글 점수 리셋
	public int scoreResetRVC(int rv_cmt_seq) {
		return review_cmtDao.scoreResetRVC(rv_cmt_seq);
	}
	
	//리뷰 신고 승인 부적격 업데이트
	public int rpUpdate(ReportVO rpvo) {
		return reportDao.rpUpdate(rpvo);
	}
	
	//회원신고(m_report) 업데이트
	public int mrpUpResult(M_ReportVO mrpvo) {
		return m_reportDao.mrpUpResult(mrpvo);
	}
	
	public int mrpUpMemo(M_ReportVO mrpvo) {
		return m_reportDao.mrpUpMemo(mrpvo);
	}
	//회원 점수 업데이트
	public int updateScore(int m_report_seq) {
		return memberDao.updateScore(m_report_seq);
	}
	
	public int minUpScore(int m_report_seq) {
		return memberDao.minUpScore(m_report_seq);
	}
	//신고점수 50점 초과시 영구정지
	public int deleteMember() {
		return memberDao.deleteMember();
	}
	
	public List<MemberVO> memberList(Map<String, Object>map){
		
		List<MemberVO> mlist = memberDao.memberList(map);
		if(mlist.isEmpty()) {
			mlist =null;
		}
		return mlist;
		
		
	}

	public int memberTotal(Map<String, Object> map){
		return memberDao.memberTotal(map);
	}
	
	
	public NewplaceVO npOne(int newplace_seq) {
		return newplaceDao.npOne(newplace_seq);
	}
	
	public int npStatus(NewplaceVO npvo) {
		return newplaceDao.npStatus(npvo);
	}
	
	public Map<String, Object> m_reportOne(Map<String, Object> map){
		return m_reportDao.m_reportOne(map);
		
	}
	
	public Map<String, Object> detailMember(int m_seq){
		return memberDao.detailMember(m_seq);
		
	}
	
	//추가
	//s_report여행기 신고
	public List<Map<String, Object>> sreportList(Map<String, Object> map){
		
		List<Map<String, Object>> list = s_reportDao.sreportList(map);
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	public int sreportTotal(Map<String, Object> map){
		return s_reportDao.sreportTotal(map);
	}
	
	
	public Map<String, Object> s_reportOne(int s_report_seq){
		
		return s_reportDao.s_reportOne(s_report_seq);
		
	}
	
	public Map<String, Object> s_report_cmtOne(int s_report_seq){
		
		return s_reportDao.s_report_cmtOne(s_report_seq);
		
	}
	
	public int spUpdate(S_ReportVO srvo) {
		return s_reportDao.spUpdate(srvo);
	}
	
	//slog 신고관련 상태 업데이트
	//여행기 숨김 
	public int HiddenSL(SlogVO slvo) {
		return slogDao.HiddenSL(slvo);
		
	}
	//여행기 숨김해제
	public int DefaultSL(SlogVO slvo) {
		return slogDao.DefaultSL(slvo);
		
	}
	//여행기 삭제
	public int deleteSL(int slog_seq) {
		return slogDao.deleteSL(slog_seq);
		
	}
	//여행기 신고 점수 누적
	public int scoreSL(Map<String, Object> map) {
		return slogDao.scoreSL(map);
		
		
	}
	//여행기 삭제 시퀀스 뽑기
	public List<Map<String, Object>> slseqDelete(){
		return slogDao.slseqDelete();
	}
	//여행기 신고 점수 리셋(부적격)
	
	public int scoreSLReset(int slog_seq) {
		return slogDao.scoreReset(slog_seq);
		
	}
	
	public List<Map<String, Object>> rvcOne(Map<String, Object> map) {
		return review_cmtDao.rvcOne(map);
	}
	public int rvcOneTotal(Map<String, Object> map) {
		return review_cmtDao.rvcOneTotal(map);
	}
	
	//t_purchase One
	public  T_PurchaseVO t_purchaseOne(int purchase_no){
		return t_purchaseDao.t_purchaseOne(purchase_no);
	}
	
	public  T_PurchaseVO t_purchase(int purchase_no){
		return t_purchaseDao.t_purchase(purchase_no);
	}
	
	//여행기 댓글 숨김 
	public int HiddenSLC(Slog_CmtVO slcvo) {
		return slog_cmtDao.HiddenSLC(slcvo);
		
	}
	//여행기 댓글 숨김해제
	public int DefaultSLC(Slog_CmtVO slcvo) {
		return slog_cmtDao.DefaultSLC(slcvo);
		
	}
	//여행기댓글 삭제
	public int deleteSLC() {
		return slog_cmtDao.deleteSLC();
		
	}
	//여행기댓글 신고 점수 누적
	public int scoreSLC(Map<String, Object> map) {
		return slog_cmtDao.scoreSLC(map);
		
		
	}
	//여행기댓글 신고 점수 리셋(부적격)
	
	public int scoreResetSLC(int slog_cmt_seq) {
		return slog_cmtDao.scoreResetSLC(slog_cmt_seq);
		
	}
	
	//해당 숙소 결제
	public Map<String, Object> accomPaymentOne(int purchase_no){
		return paymentDao.accomPaymentOne(purchase_no);
		
	}
	
	
	//[현지]*********************************************************************
	public void updateNo(int f_seq) {
		reportDao.updateNo(f_seq);
	}

	
	
}
