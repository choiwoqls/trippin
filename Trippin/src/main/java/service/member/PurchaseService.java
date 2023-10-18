package service.member;

import java.util.List;
import java.util.Map;

import dao.admin.CouponDAO;
import dao.common.CancelDAO;
import dao.common.Cancel_CateDAO;
import dao.common.PayDAO;
import dao.common.RefundDAO;
import dao.member.CouponlistDAO;
import dao.ticket.Ccp_WordDAO;
import dao.ticket.OptDAO;
import dao.ticket.SuboptDAO;
import dao.ticket.T_AmountDAO;
import dao.ticket.T_PurchaseDAO;
import dao.ticket.T_ReserverDAO;
import dao.ticket.TicketDAO;
import vo.common.CancelVO;
import vo.common.Cancel_CateVO;
import vo.common.PayVO;
import vo.member.CouponlistVO;
import vo.ticket.Ccp_WordVO;
import vo.ticket.OptVO;
import vo.ticket.SuboptVO;
import vo.ticket.T_AmountVO;
import vo.ticket.T_PurchaseVO;
import vo.ticket.T_ReserverVO;
import vo.ticket.TicketVO;

public class PurchaseService {
	
	private OptDAO optDao;
	private SuboptDAO suboptDao;
	private TicketDAO ticketDao;
	private T_ReserverDAO t_reserverDao;
	private CouponDAO couponDao;
	private PayDAO payDao;
	private T_AmountDAO t_amountDao;
	private T_PurchaseDAO t_purchaseDao;
	private CouponlistDAO couponlistDao;
	private Ccp_WordDAO ccp_wordDao;
	private Cancel_CateDAO cancel_cateDao;
	private CancelDAO cancelDao;
	private RefundDAO refundDao;
	
	public PurchaseService(OptDAO optDao,
							SuboptDAO suboptDao,
							TicketDAO ticketDao,
							T_ReserverDAO t_reserverDao,
							CouponDAO couponDao,
							PayDAO payDao,
							T_AmountDAO t_amountDao,
							T_PurchaseDAO t_purchaseDao,
							CouponlistDAO couponlistDao,
							Ccp_WordDAO ccp_wordDao,
							Cancel_CateDAO cancel_cateDao,
							CancelDAO cancelDao,
							RefundDAO refundDao) {
		this.optDao = optDao;
		this.suboptDao = suboptDao;
		this.ticketDao = ticketDao;
		this.t_reserverDao = t_reserverDao;
		this.couponDao = couponDao;
		this.payDao = payDao;
		this.t_amountDao = t_amountDao;
		this.t_purchaseDao = t_purchaseDao;
		this.couponlistDao = couponlistDao;
		this.ccp_wordDao = ccp_wordDao;
		this.cancel_cateDao =cancel_cateDao;
		this.cancelDao = cancelDao;
		this.refundDao = refundDao;
	}
	
	public List<OptVO> oneOpt(int ticket_seq){
		return optDao.oneOpt(ticket_seq);
	}
	
	public List<SuboptVO> oneSubopt(int opt_seq){
		return suboptDao.oneSubopt(opt_seq);
	}
	
	public TicketVO valid(int ticket_seq) {
		return ticketDao.valid(ticket_seq);
	}
	
	public T_ReserverVO oneInfo(int m_seq) {
		return t_reserverDao.oneInfo(m_seq);
	}
	
	public List<Map<String, Object>> buyCoupon(Map<String, Object> map){
		return couponDao.buyCoupon(map);
	}
	
	public List<PayVO> pay(){
		return payDao.pay();
	}
	
	public String ticketName(int ticket_seq) {
		return ticketDao.ticketName(ticket_seq);
	}
	
	public int amountInsert(T_AmountVO vo) {
		return t_amountDao.insert(vo);
	}
	
	public int amountSeq() {
		return t_amountDao.maxSeq();
	}
	
	public T_AmountVO pickList(int t_amount_seq) {
		return t_amountDao.pickList(t_amount_seq);
	}
	
	public int reserveInsert(T_ReserverVO vo) {
		return t_reserverDao.reserveInsert(vo);
	}
	
	public int reserveUpdate(T_ReserverVO vo) {
		return t_reserverDao.reserveUpdate(vo);
	}
	
	public int purchaseInsert(T_PurchaseVO vo) {
		return t_purchaseDao.purchaseInsert(vo);
	}
	
	public int cashSeqInsert(T_PurchaseVO vo) {
		return t_purchaseDao.cashSeqInsert(vo);
	}
	
	public int purchaseSeq() {
		return t_purchaseDao.purchaseSeq();
	}
	
	public Map<String, Object> myTicket(int t_purchase_seq) {
		return t_purchaseDao.myTicket(t_purchase_seq);
	}
	
	public int useCoupon(CouponlistVO vo) {
		return couponlistDao.useCoupon(vo);
	}
	
	public List<Ccp_WordVO> ccp_word_use(int ticket_seq){
		return ccp_wordDao.ccp_word_use(ticket_seq);
	}
	
	public Ccp_WordVO ccp_word_end(int ticket_seq){
		return ccp_wordDao.ccp_word_end(ticket_seq);
	}
	
	public T_PurchaseVO ticket_seq(int t_purchase_seq) {
		return t_purchaseDao.ticket_seq(t_purchase_seq);
	}
	
	public int cancel_status(int ticket_seq) {
		return ticketDao.cancel_status(ticket_seq);
	}
	
	public List<Cancel_CateVO> cancel_cate(){
		return cancel_cateDao.cancel_cate();
	}
	
	public int cancelInsert(CancelVO vo) {
		return cancelDao.cancelInsert(vo);
	}
	
	public Integer cancelStatus(CancelVO vo) {
		return cancelDao.cancelStatus(vo);
	}
	
	public int returnCancel(int t_purchase_seq) {
		return t_purchaseDao.returnCancle(t_purchase_seq);
	}
	
	public List<Integer> endPurchaseSeq(){
		return t_purchaseDao.endPurchaseSeq();
	}
	
	public int endPurchase() {
		return t_purchaseDao.endPurchase();
	}
	
	public Map<String, Object> refundDetail(Map<String, Object> map){
		return refundDao.refundDetail(map);
	}
	
	public List<Ccp_WordVO> ccp_word(int ticket_seq){
		return ccp_wordDao.ccp_word(ticket_seq);
	}
	
	public String optName(int seq) {
		return optDao.optName(seq);
	}
}
