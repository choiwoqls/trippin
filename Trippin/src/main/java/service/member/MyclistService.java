package service.member;

import java.util.List;
import java.util.Map;

import dao.sche.Clist_CateDAO;
import dao.sche.Clist_MemoDAO;
import dao.sche.MyclistDAO;
import vo.sche.Clist_CateVO;
import vo.sche.Clist_MemoVO;
import vo.sche.MyclistVO;

public class MyclistService {
	
	private Clist_CateDAO clist_cateDao;
	private Clist_MemoDAO clist_memoDao;
	private MyclistDAO myclistDao;
	
	public MyclistService(Clist_CateDAO clist_cateDao,
			Clist_MemoDAO clist_memoDao,MyclistDAO myclistDao) {
		this.clist_cateDao = clist_cateDao;
		this.clist_memoDao = clist_memoDao;
		this.myclistDao = myclistDao;
		
		
	}
	
	
	
	//재빈
	//새미
	//카테고리 리스트
	public List<Clist_CateVO> cateList(int m_seq){ //모든 카테 리스트
		return clist_cateDao.cateList(m_seq);
	}
	
	public List<Map<String, Object>> cateItem(Map<String, Object> map){ //모든 아이템 항목
		return clist_cateDao.cateItem(map);
	}
	
	public int myClistOneCnt(Map<String, Object> map) {
		return myclistDao.myClistOneCnt(map);
	}
	public int deleteMyclist(Map<String, Object> map) {
		return myclistDao.deleteMyclist(map);
	}
	public int myclistInsert(MyclistVO mcvo) {
		return myclistDao.myclistInsert(mcvo);
	}

	
	
	//메모
	public int clistMemoAdd(Clist_MemoVO cmvo) {
		return clist_memoDao.clistMemAdd(cmvo);
		
	}
	
	public Clist_MemoVO ClistMemoOne(Map<String, Object> map){
	
				
		return clist_memoDao.ClistMemoOne(map);
	}
	
	public int clistMemoUpdate(Clist_MemoVO cmvo) {
		return clist_memoDao.clistMemoUpdate(cmvo);
	}
	
	public int clistMemoDelete(Clist_MemoVO cmvo) {
		return clist_memoDao.clistMemoDelete(cmvo);
	}
	
	public Clist_MemoVO ClistMemoAllOne(Map<String, Object> map){
		return clist_memoDao.ClistMemoAllOne(map);
	}
	


}




















