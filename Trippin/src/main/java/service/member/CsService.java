package service.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.accom.PaymentDAO;
import dao.member.CSDAO;
import dao.member.CS_CateDAO;
import dao.member.CS_SubCateDAO;
import dao.member.C_InquiryDAO;
import dao.member.InquiryDAO;
import dao.member.MemberDAO;
import dao.ticket.T_PurchaseDAO;
import dao.ticket.T_ReserverDAO;
import vo.accom.PaymentVO;
import vo.member.CSVO;
import vo.member.CS_CateVO;
import vo.member.CS_SubCateVO;
import vo.member.C_InquiryVO;
import vo.member.InquiryVO;
import vo.ticket.T_PurchaseVO;
import vo.ticket.T_ReserverVO;

public class CsService {
	
	private MemberDAO memberDao;
	private CS_CateDAO cs_cateDao;
	private CS_SubCateDAO cs_subcateDao;
	private CSDAO csDao;
	private T_ReserverDAO t_reserverDao;
	private T_PurchaseDAO t_purchaseDao;
	private InquiryDAO inquiryDao;
	private C_InquiryDAO c_inquiryDao;
	private PaymentDAO paymentDao;
	
	public CsService(MemberDAO memberDao,CS_CateDAO cs_cateDao,CS_SubCateDAO cs_subcateDao
			,CSDAO csDao,T_ReserverDAO t_reserverDao, T_PurchaseDAO t_purchaseDao,
			InquiryDAO inquiryDao,C_InquiryDAO c_inquiryDao, PaymentDAO paymentDao) {
		this.memberDao =memberDao;
		this.cs_cateDao =cs_cateDao;
		this.cs_subcateDao =cs_subcateDao;
		this.csDao = csDao;
		this.t_reserverDao = t_reserverDao;
		this.t_purchaseDao = t_purchaseDao;
		this.inquiryDao = inquiryDao;
		this.c_inquiryDao = c_inquiryDao;
		this.paymentDao = paymentDao;
		
		
	}
	
	public List<CS_CateVO> csCateAll(){
		return cs_cateDao.csCateAll();
	}
	
	//----------cs_subcate--------------------
	
	public List<CS_SubCateVO> csSubCateAll(){
		return cs_subcateDao.csSubCateAll();
	}
	
	public List<CS_SubCateVO> csSubCateAllaj(Map<String, Object> map){
		return cs_subcateDao.csSubCateAllaj(map);
	}
	
	public List<CS_SubCateVO> csSubCateAll1(){
		return cs_subcateDao.csSubCateAll1();
	}
	public List<CS_SubCateVO> csSubCateAll2(){
		return cs_subcateDao.csSubCateAll2();
	}
	
	public List<CS_SubCateVO> csSubCateAll3(){
		return cs_subcateDao.csSubCateAll3();
	}
	//-----------cs----------------------------
	public List<CSVO> allTitle(Map<String, Object> map){ 
		
		List<CSVO> csList = csDao.allTitle(map);
		if(csList.isEmpty()) {
			csList=null;
		}
		return csDao.allTitle(map);
	}
	
	public List<CSVO> csTitleAjax(Map<String, Object> map) {
		return csDao.csTitleAjax(map);
	}

	
	//cs 페이징(count)
	public int cgetTotal(Map<String, Object> map) {
		
		return csDao.cgetTotal(map);
	}
	
			
	public Map<String, Object> getContent(int cs_seq){
		
		
		Map<String, Object> map = csDao.getContent(cs_seq);
		
		String str = "";
		
		StringBuffer buf = new StringBuffer();
		
		Clob clob = (Clob)map.get("CONTENT");
		
		
		BufferedReader br = null;
		try {
			br = new BufferedReader(clob.getCharacterStream());
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			while((str = br.readLine()) != null) {
				buf.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		map.put("CONTENT", buf.toString());
		
		return map;
	}

	public List<CS_SubCateVO> allClist(Map<String, Object>map){
		return cs_subcateDao.allClist(map);
	}
	
	public List<CSVO> cateAjaxCs(Map<String, Object> map) {
		List<CSVO> cslist = csDao.cateAjaxCs(map);
		
		if(cslist.isEmpty()) {
			cslist=null;
		}
		return cslist;
	}
	
	public List<CSVO> cateAjaxCsAll() {
		return csDao.cateAjaxCsAll();
	}
	
	//1:1문의
	//투어티켓 한사람 정보 
	public T_ReserverVO t_reserverOne(int m_seq) {
		return t_reserverDao.t_reserverOne(m_seq);
	}
	
	//t_purchase
	public  List<T_PurchaseVO> t_purchaseList(int m_seq){
		return t_purchaseDao.t_purchaseList(m_seq);
	}
	
	//티켓 1:1 insert
	public int insertInquiry(InquiryVO iqvo) {
		return inquiryDao.insertInquiry(iqvo);
	}
	
	public int inquirySeqOne() {
		return inquiryDao.inquirySeqOne();
	}
	
	//취소환불 테이블
	public int insertc_Inquiry(C_InquiryVO ciqvo ) {
		return c_inquiryDao.insertc_Inquiry(ciqvo);
	}
	
	//숙소 1:1
	public List<PaymentVO> accomPayList(int m_seq){
		return paymentDao.accomPayList(m_seq);
	}
	
	//내 문의 내역
	public List<InquiryVO> inquiryMyList(Map<String, Object>map) {
		List<InquiryVO> list = inquiryDao.inquiryMyList(map);
		
		if(list.isEmpty()) {
			list=null;
		}
		return list;
	}
	
	
	public List<CSVO> filelistCs(int cs_seq) {
		return csDao.filelistCs(cs_seq);
	}


}






