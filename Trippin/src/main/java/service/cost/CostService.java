package service.cost;

import dao.sche.CalculateDAO;
import dao.sche.CostDAO;
import dao.sche.Cost_DetailsDAO;
import dao.sche.MoneyListDAO;

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
	
	

}
