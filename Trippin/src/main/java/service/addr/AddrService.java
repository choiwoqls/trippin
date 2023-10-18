package service.addr;

import java.util.List;

import dao.common.Addr1DAO;
import dao.common.Addr2DAO;
import vo.common.Addr1VO;

public class AddrService {
	
	private Addr1DAO addr1Dao;
	private Addr2DAO addr2Dao;
	
	public AddrService(Addr1DAO addr1Dao, Addr2DAO addr2Dao) {
		this.addr1Dao=addr1Dao;
		this.addr2Dao=addr2Dao;
	}
	
	public List<Addr1VO> addr1List(){
		return addr1Dao.addr1List();
	}
	
	public String addr_name(int addr_seq) {
		String addr_name = "";
		if(addr1Dao.addr_name(addr_seq)!=null) {
			addr_name = addr1Dao.addr_name(addr_seq);
		}
		return addr_name;
	}
	
	public String 	addr2Name(int addr2_seq) {
		return addr2Dao.addr2Name(addr2_seq);
	}

}
