package service.admin;

import java.util.List;

import dao.common.Addr2DAO;
import dao.ticket.Include_ItemsDAO;
import dao.ticket.T_PartnerDAO;
import dao.ticket.TicketDAO;
import dao.ticket.Ticket_CateDAO;
import vo.common.Addr2VO;
import vo.ticket.Include_ItemsVO;
import vo.ticket.T_PartnerVO;
import vo.ticket.TicketVO;
import vo.ticket.Ticket_CateVO;

public class TicketService {

	private T_PartnerDAO t_partnerDao;
	private Ticket_CateDAO ticket_cateDao;
	private TicketDAO ticketDao;
	private Include_ItemsDAO include_itemsDao;
	private Addr2DAO addr2Dao;
	
	public TicketService(T_PartnerDAO t_partnerDao,
					Ticket_CateDAO ticket_cateDao,
					TicketDAO ticketDao,
					Include_ItemsDAO include_itemsDao,
					Addr2DAO addr2Dao) {
		
		this.t_partnerDao = t_partnerDao;
		this.ticket_cateDao = ticket_cateDao;
		this.ticketDao = ticketDao;
		this.include_itemsDao = include_itemsDao;
		this.addr2Dao = addr2Dao;
	}
	
	
	//t_partner
	public int insert(T_PartnerVO vo) {
		return t_partnerDao.insert(vo);
	}
	
	public int update(T_PartnerVO vo) {
		return t_partnerDao.update(vo);
	}
	
	public int deletePTN(int t_partner_seq) {
		return t_partnerDao.deletePTN(t_partner_seq);
	}
	
	public List<T_PartnerVO> ptnlist(){
		return t_partnerDao.ptnlist();
	}
	
	//ticket_cate
	public int insert(Ticket_CateVO vo) {
		return ticket_cateDao.insert(vo);
	}
	
	public int update(Ticket_CateVO vo) {
		return ticket_cateDao.update(vo);
	}
	
	public int deleteTC(int ticket_cate_seq) {
		return ticket_cateDao.deleteTC(ticket_cate_seq);
	}
	
	public List<Ticket_CateVO> tclist(){
		return ticket_cateDao.tclist();
	}
	
	//ticket
	public int insert(TicketVO vo) {
		return ticketDao.insert(vo);
	}
	
	public int updateTK(TicketVO vo) {
		return ticketDao.updateTK(vo);
	}
	
	public int nowTicket_seq() {
		return ticketDao.nowTicket_seq();
	}
	
	public TicketVO selectTK(int ticket_seq) {
		return ticketDao.selectTK(ticket_seq);
	}
	
	public String addr2Name(int addr2_seq) {
		return addr2Dao.addr2Name(addr2_seq);
	}
	
	public int addrInfo(int addr2_seq) {
		return addr2Dao.addrInfo(addr2_seq);
	}
	
	
	
	
	//include_items
	public int insert(Include_ItemsVO vo) {
		return include_itemsDao.insert(vo);
	}
	
	public int update(Include_ItemsVO vo) {
		return include_itemsDao.update(vo);
	}
	
	public int deleteInclItms(int include_items_seq) {
		return include_itemsDao.deleteInclItms(include_items_seq);
	}
	
	public List<Include_ItemsVO> inclItmsList(){
		return include_itemsDao.inclItmsList();
	}
	
}
