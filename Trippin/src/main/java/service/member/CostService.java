package service.member;

import java.util.List;
import java.util.Map;

import dao.sche.CalculateDAO;
import dao.sche.CostDAO;
import dao.sche.Cost_DetailsDAO;
import dao.sche.MoneyListDAO;
import vo.sche.CostVO;
import vo.sche.Cost_DetailsVO;
import vo.sche.MoneyListVO;

public class CostService {
	
	private CostDAO costDao;
	private Cost_DetailsDAO cost_detailsDao;
	private MoneyListDAO moneylistDao;
	private CalculateDAO calculateDao;
	
	public CostService(CostDAO costDao, Cost_DetailsDAO cost_detailsDao, MoneyListDAO moneylistDao, CalculateDAO calculateDao) {
		this.costDao=costDao;
		this.cost_detailsDao=cost_detailsDao;
		this.moneylistDao=moneylistDao;
		this.calculateDao=calculateDao;
	}
	
	//2023-08-16
	public List<Map<String, Object>> dayCostList(Map<String, Object> map){
		return costDao.dayCostList(map);
	}
	
	
	//2023-08-17
	public List<Map<String, Object>> dayCostAlone(Map<String, Object> map){
		return costDao.dayCostAlone(map);
	}
	
	public int totMoney(Map<String, Object> map) {
		int tot_money = 0;
		if((Integer)costDao.totMoney(map)!=null) {
			tot_money=costDao.totMoney(map);
		}
		return tot_money;
	}
	
	public int totMoneyAlone(Map<String, Object> map) {
		int tot_money = 0;
		if((Integer)costDao.totMoneyAlone(map)!=null) {
			tot_money=costDao.totMoneyAlone(map);
		}
		return tot_money;
	}
	
	public int totDayMoney(Map<String, Object> map) {
		int tot_money = 0;
		if((Integer)costDao.totDayMoney(map)!=null) {
			tot_money=costDao.totDayMoney(map);
		}
		return tot_money;
	}
	
	public int totDayMoneyAlone(Map<String, Object> map) {
		int tot_money = 0;
		if((Integer)costDao.totDayMoneyAlone(map)!=null) {
			tot_money=costDao.totDayMoneyAlone(map);
		}
		return tot_money;
	}
	
	public int costDayNum(Map<String, Object> map) {
		int num = 0;
		if((Integer)costDao.costDayNum(map)!=null) {
			num=costDao.costDayNum(map);
		}
		return num;
	}
	
	public boolean insertCost(CostVO vo) {
		boolean check = false;
		if(costDao.insertCost(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public int costSeq() {
		return costDao.costSeq();
	}
	
	public boolean newCostDetails(Cost_DetailsVO vo) {
		boolean check = false;
		if(cost_detailsDao.newCostDetails(vo) != 0) {
			check = true;
		}
		return check;
	}
	
	public void delCost(int cost_seq) {
		costDao.delCost(cost_seq);
	}
	
	public int checkMNL(MoneyListVO vo) {
		int moneylist_seq = 0;
		if(moneylistDao.checkMNL(vo)!=null) {
			moneylist_seq = moneylistDao.checkMNL(vo);
		}
		return moneylist_seq;
	}
	
	public boolean newMoneyList(MoneyListVO vo) {
		boolean check = false;
		if(moneylistDao.newMoneyList(vo)!=0) {
			check =true;
		}
		return check;
	}

	public int costDetailsSeq() {
		return cost_detailsDao.costDetailsSeq();
	}
	
	public void delCD(int cost_details_seq) {
		cost_detailsDao.delCD(cost_details_seq);
	}
	
	public boolean updateMNL(MoneyListVO vo) {
		boolean check = false;
		if(moneylistDao.updateMNL(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public CostVO costInfo(int cost_seq) {
		CostVO vo = new CostVO();
		if(costDao.costInfo(cost_seq)!=null) {
			vo = costDao.costInfo(cost_seq); 
		}
		return vo;
	}
	
	public List<Map<String, Object>> reCostMList(Map<String, Object> map){
		return costDao.reCostMList(map);
	}

	public List<Integer> cdMList(Map<String, Object> map){
		return cost_detailsDao.cdMList(map);
	}
	
	public boolean reCost(CostVO vo) {
		boolean check = false;
		if(costDao.reCost(vo)!= 0) {
			check = true;
		}
		return check;
	}
	
	public void delCostDetails(int cost_seq) {
		cost_detailsDao.delCostDetails(cost_seq);
	}
	
	public int fMoney(int cost_seq) {
		int fmoney = 0;
		if(costDao.fMoney(cost_seq)!=null) {
			fmoney = costDao.fMoney(cost_seq);
		}
		return fmoney;
	}
	
	//2023-08-29
	public List<Map<String, Object>> kindPer(int s_seq){
		List<Map<String, Object>> list = null;
		if(costDao.kindPer(s_seq)!=null) {
			list = costDao.kindPer(s_seq);
		}
		return list;
	}
	
	public int maxKind(int s_seq) {
		int kind = -1;
		if(costDao.maxKind(s_seq)!=null) {
			kind = costDao.maxKind(s_seq);
		}
		return kind;
	}
	
	public String sumMon(int s_seq) {
		String sumMon = "0";
		if(costDao.sumMon(s_seq)!=null) {
			sumMon = costDao.sumMon(s_seq);
		}
		return sumMon;
	}
	
	//2023-08-30
	public List<Map<String, Object>> kindDetail(Map<String, Object> map){
		List<Map<String, Object>> list = null;
		if(costDao.kindDetail(map)!=null) {
			list = costDao.kindDetail(map);
		}
		return list;
	}
	
	public String kindTM(Map<String, Object> map) {
		String tm = "";
		if(costDao.kindTM(map)!=null) {
			tm = costDao.kindTM(map);
		}
		return tm;
	}
	
	public List<Integer> ckList(int s_seq){
		List<Integer> klist = null;
		if(costDao.ckList(s_seq)!=null) {
			klist = costDao.ckList(s_seq);
		}
		return klist;
	}
	
	public MoneyListVO zeroCheck(int moneylist_seq) {
		MoneyListVO mvo = null;
		if(moneylistDao.zeroCheck(moneylist_seq)!=null) {
			mvo = moneylistDao.zeroCheck(moneylist_seq);
		}
		return mvo;
	}
	
	public void delMNL(int moneylist_seq) {
		moneylistDao.delMNL(moneylist_seq);
	}
	
	public List<Map<String, Object>> calculateList(int s_seq){
		List<Map<String, Object>> list = null;
		if(costDao.calculateList(s_seq)!=null) {
			list = costDao.calculateList(s_seq);
		}
		return list;
	}
	
	public int MNLseq() {
		return moneylistDao.MNLseq();
	}
	
	
	
	
	
	
	
}
