package service.admin;

import java.util.List;
import java.util.Map;

import dao.common.Addr1DAO;
import dao.common.Addr2DAO;
import dao.common.DayDAO;
import dao.common.FormDAO;
import dao.common.HoursDAO;
import dao.hotple.BranchDAO;
import dao.hotple.H_CateDAO;
import dao.hotple.HotpleDAO;
import dao.hotple.MenuDAO;
import vo.common.Addr1VO;
import vo.common.Addr2VO;
import vo.common.DayVO;
import vo.common.FormVO;
import vo.common.HoursVO;
import vo.hotple.BranchVO;
import vo.hotple.H_CateVO;
import vo.hotple.HotpleVO;
import vo.hotple.MenuVO;

public class HotpleService {

	private H_CateDAO h_cateDao;
	private Addr1DAO addr1Dao;
	private Addr2DAO addr2Dao;
	private FormDAO formDao;
	private DayDAO dayDao;
	private HotpleDAO hotpleDao;
	private HoursDAO hoursDao;
	private MenuDAO menuDao;
	private BranchDAO branchDao;
	
	public HotpleService(H_CateDAO h_cateDao, 
						Addr1DAO addr1Dao, 
						Addr2DAO addr2Dao,
						FormDAO formDao, 
						DayDAO dayDao,
						HotpleDAO hotpleDao, 
						HoursDAO hoursDao,
						MenuDAO menuDao,
						BranchDAO branchDao) {
		this.h_cateDao = h_cateDao;
		this.addr1Dao = addr1Dao;
		this.addr2Dao = addr2Dao;
		this.formDao = formDao;
		this.dayDao = dayDao;
		this.hotpleDao = hotpleDao;
		this.hoursDao = hoursDao;
		this.menuDao = menuDao;
		this.branchDao = branchDao;
	}
	
	public List<H_CateVO> h_cate(){
		return h_cateDao.h_cate();
	}
	
	public List<Addr1VO> addr1(){
		return addr1Dao.addr1();
	}
	
	public List<Addr2VO> addr2(int addr1_seq){
		return addr2Dao.addr2(addr1_seq);
	}
	
	public int insertForm(FormVO fvo) {
		return formDao.insertHotple(fvo);
	}
	
	public int nowF_seq() {
		return formDao.nowSeq();
	}
	
	public int insertHotple(HotpleVO hvo) {
		return hotpleDao.insert(hvo);
	}
	
//	public List<FormVO> branches(FormVO fvo){
//		return formDao.branches(fvo);
//	}
	
	public List<DayVO> day(){
		return dayDao.day();
	}
	
	public int insertTime(HoursVO hvo) {
		return hoursDao.insert(hvo);
	}
	
	public FormVO formOne(int f_seq) {
		return formDao.selectOne(f_seq);
	}
	
	public HotpleVO hotpleOne(int f_seq) {
		return hotpleDao.selectOne(f_seq);
	}
	
	public List<HoursVO> hoursOne(int f_seq){
		return hoursDao.selectOne(f_seq);
	}
	
	public List<MenuVO> menuOne(int f_seq){
		return menuDao.selectOne(f_seq);
	}
	
	public int insertMenu(MenuVO vo) {
		return menuDao.insert(vo);
	}
	
	public List<MenuVO> oneMenu(int f_seq) {
		return menuDao.selectOne(f_seq);
	}
	
	public int deleteMenu(int menu_seq) {
		return menuDao.delete(menu_seq);
	}
	
	public List<Integer> seqList(int f_seq){
		return menuDao.seqList(f_seq);
	}
	
	public int sameHotple(String h_busi) {
		return hotpleDao.sameHotple(h_busi);
	}
	
	public int nowMenu() {
		return menuDao.nowMenu();
	}
	
	public Map<String, Object> selectHotple(int f_seq){
		return formDao.selectHotple(f_seq);
	}
	
	public List<HoursVO> oneHour(int f_seq){
		return hoursDao.oneHour(f_seq);
	}
	
	public int newSeq() {
		return hotpleDao.newSeq();
	}
	
	public int hours_seq() {
		return hoursDao.hours_seq();
	}
	
	public int update(FormVO vo) {
		return formDao.update(vo);
	}
	
	public int updateHotple(HotpleVO vo) {
		return hotpleDao.updateHotple(vo);
	}
	
	public int hoursDelete(HoursVO vo) {
		return hoursDao.hoursDelete(vo);
	}
	
	public int menuUpdate(MenuVO vo) {
		return menuDao.menuUpdate(vo);
	}
	
	public String imgPath(int menu_seq) {
		return menuDao.imgPath(menu_seq);
	}
	
	public int main(int f_seq) {
		return branchDao.main(f_seq);
	}
	
	public int registerMain(int f_seq) {
		return branchDao.registerMain(f_seq);
	}
	
	public List<Map<String, Object>> headList(Map<String, Object> map){
		return formDao.headList(map); 
	}
	
	public BranchVO branch(int f_seq) {
		return branchDao.branch(f_seq);
	}
	
	public int register(BranchVO vo) {
		return branchDao.register(vo);
	}
	
	public List<Integer> subList(){
		return branchDao.subList();
	}
	
	public String h_runInfo(int f_seq) {
		return hotpleDao.h_runInfo(f_seq);
	}
	
}
