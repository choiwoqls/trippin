package controller.member;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import common.ViewPath;
import service.member.CostService;
import service.member.ScheService;
import vo.member.MemberVO;
import vo.sche.CostVO;
import vo.sche.Cost_DetailsVO;
import vo.sche.MoneyListVO;


@Controller
public class CostController {
	
	@Autowired
	private CostService costService;
	
	private ScheService scheService;
	
	public CostController(CostService costServiec, ScheService scheService) {
		this.costService=costServiec;
		this.scheService=scheService;
	}
	
	@RequestMapping("/schedule/cost/costHome")
	public String costHome(int s_seq, Model model, int day_no, int alone, HttpServletRequest request) {
		
		int m_seq = -1;
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}
		
		List<Map<String, Object>> dlist = new ArrayList<Map<String,Object>>();
		
		int su = scheService.scheDay(s_seq);
		List<Map<String, Object>> clist  = new ArrayList<Map<String,Object>>();
		Map<String, Object> mmap = new HashMap<String, Object>();
		int tot_money = 0;
		mmap.put("s_seq", s_seq);
		mmap.put("m_seq", m_seq);			
		
		if(day_no == 0) {
			if(alone ==1) {
				//전체 일 때 나만의 비용
				tot_money= costService.totMoneyAlone(mmap);
			}else {
				//전체 일 때 전체 비용
				tot_money = costService.totMoney(mmap);				
			}
			for(int i = 1; i <= su; i++) {
				Map<String, Object> dInfo = new HashMap<String, Object>();
				//일정 날짜 만큼
				Map<String, Object> map = new HashMap<String, Object>();
				Map<String, Object> dmap = new HashMap<String, Object>();
				Map<String, Object> dmmap = new HashMap<String, Object>();
				map.put("s_seq", s_seq);
				map.put("day_no", i);
				map.put("m_seq", m_seq);
				if(alone == 1) {
					clist = costService.dayCostAlone(map);
				}else {
					clist = costService.dayCostList(map);				
				}
				
				dmap.put("s_seq", s_seq);
				dmap.put("su", i-1);
				dmmap = scheService.schedy(dmap);
				dInfo.put("day_no", i);
				dInfo.put("clist", clist);
				dInfo.put("dmmap", dmmap);
				dlist.add(dInfo);
			}
		}else {
			mmap.put("day_no", day_no);
			if(alone ==1 ) {
				//선택 날짜 나만의 비용
				tot_money=costService.totDayMoneyAlone(mmap);
			}else {
				//선택 날짜 전체 비용
				tot_money=costService.totDayMoney(mmap);
			}
			Map<String, Object> dInfo = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> dmap = new HashMap<String, Object>();
			Map<String, Object> dmmap = new HashMap<String, Object>();
			map.put("s_seq", s_seq);
			map.put("day_no", day_no);				
			map.put("m_seq", m_seq);			
			if(alone == 1) {
				clist = costService.dayCostAlone(map);
			}else {
				clist = costService.dayCostList(map);				
			}

			
			dmap.put("s_seq", s_seq);
			dmap.put("su", day_no-1);
			dmmap = scheService.schedy(dmap);
			dInfo.put("day_no", day_no);
			dInfo.put("clist", clist);
			dInfo.put("dmmap", dmmap);
			dlist.add(dInfo);		
		}		
		
		
		
		DecimalFormat format = new DecimalFormat("###,###");
		
		model.addAttribute("day_no", day_no);
		model.addAttribute("alone", alone);
		model.addAttribute("su", su);
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("tot_money", format.format(tot_money));
		model.addAttribute("dlist", dlist);
		
		return ViewPath.SCHEDULE + "cost/costHome.jsp";
	}
	
	@RequestMapping("/schedule/cost/addCost")
	public String addCost(int s_seq, int day_no, Model model) {
		
		String p = scheService.selectPartner(s_seq);
		
		int su = scheService.scheDay(s_seq);
		
		List<MemberVO> mlist = new ArrayList<MemberVO>();
		
		if(p.contains(",")) {
			String[] partner = p.split(",");
			int[] m= Stream.of(partner).mapToInt(Integer::parseInt).toArray();
			for(int m_seq : m) {
				MemberVO vo = scheService.mInfo(m_seq);
				mlist.add(vo);
			}
		}else {
			int m_seq = Integer.parseInt(p);
			MemberVO vo = scheService.mInfo(m_seq);
			mlist.add(vo);
		}
		boolean ack = true;
		if(mlist.size()>1) {
			ack = false;
		}
		
		model.addAttribute("ack", ack);
		model.addAttribute("su", su);
		model.addAttribute("mlist", mlist);
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("day_no", day_no);
			
		return ViewPath.SCHEDULE + "cost/addCost.jsp";	
	}
	
	public List<Integer> makeList(String arr) {
		List<Integer> list = new ArrayList<Integer>();
		
		 JSONParser parser = new JSONParser();
		 try {
			JSONArray jsonArray = (JSONArray) parser.parse(arr);
			
			for(Object obj : jsonArray) {
				int number = Integer.parseInt(obj.toString());
				list.add(number);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@RequestMapping("/schedule/cost/insertCost")
	public String insertCost(CostVO vo, boolean ack, @RequestParam(value = "pArr", required = false) String pArr, 
			@RequestParam(value = "dArr", required = false) String dArr, HttpServletRequest request, Model model) {
		
		List<Integer> plist = new ArrayList<Integer>();
		List<Integer> dlist = new ArrayList<Integer>();
		if(pArr != null) {
			plist = this.makeList(pArr);
		}
		if(dArr != null) {
			dlist = this.makeList(dArr);
		}
		
		System.out.println("plist : " + plist);
		System.out.println("dlist : " + dlist);
		
		int m_seq = -1;
		
		String url = "";
		String msg = "";
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}	
		if(m_seq != -1) {
			if(ack || vo.getAlone() ==1 ) {
				//일행이 없는 여행
				int cost_seq = costService.costSeq();
				vo.setCost_seq(cost_seq);
				vo.setM_seq(m_seq);
				vo.setCost_img("");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("s_seq", vo.getS_seq());
				map.put("day_no", vo.getDay_no());
				int num = costService.costDayNum(map)+1;
				vo.setNum(num);
				if(costService.insertCost(vo)) {
					//비용 입력 성공
					int cost_details_seq = costService.costDetailsSeq();
					Cost_DetailsVO cdvd = new Cost_DetailsVO(cost_details_seq, cost_seq, m_seq, 1, 1, vo.getTot_money(), vo.getTot_money());
					if(costService.newCostDetails(cdvd)) {
						//상세 비용 입력 성공
						MoneyListVO mvo = new MoneyListVO();
						mvo.setS_seq(vo.getS_seq());
						mvo.setM_seq(m_seq);
						
						if(costService.checkMNL(mvo) !=0) {
							//이미 누적지출금액 테이블에 데이터가 있을 때
							int moneylist_seq = costService.checkMNL(mvo);
							mvo.setMoneylist_seq(moneylist_seq);
							mvo.setM_tot_pay(vo.getTot_money());
							mvo.setM_tot_dutch(vo.getTot_money());
							if(costService.updateMNL(mvo)) {
								//moneylist 테이블 수정 성공
								msg = "비용 입력 성공";
								url = "/trippin/schedule/cost/costHome";																
							}else {
								//moneylist 테이블 수정 실패
								costService.delCost(cost_seq);
								costService.delCD(cost_details_seq);
								msg = "비용 입력 오류";
								url = "/trippin/schedule/cost/costHome";																
							}
						}else {
							//누적지출금액 테이블에 데이터가 없을 때
							mvo.setM_tot_pay(vo.getTot_money());
							mvo.setM_tot_dutch(vo.getTot_money());
							if(costService.newMoneyList(mvo)) {
								//누적지출금액 입력 성공
								msg = "비용 입력 성공";
								url = "/trippin/schedule/cost/costHome";								
							}else {
								//누적지출금액 입력 실패
								costService.delCost(cost_seq);
								costService.delCD(cost_details_seq);
								msg = "비용 입력 오류";
								url = "/trippin/schedule/cost/costHome";								
							}
						}
					}else {
						//상세 비용 입력 실패
						costService.delCost(cost_seq);
						msg = "비용 입력 오류";
						url = "/trippin/schedule/cost/costHome";
						
					}
				}else {
					//비용 입력 실패
					msg = "비용 입력 오류";
					url = "/trippin/schedule/cost/costHome";
				}
			}else {
				//일행이 있는 여행
				System.out.println("일행 있음");
				int cost_seq = costService.costSeq();
				vo.setCost_seq(cost_seq);
				vo.setM_seq(m_seq);
				vo.setCost_img("");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("s_seq", vo.getS_seq());
				map.put("day_no", vo.getDay_no());
				int num = costService.costDayNum(map)+1;
				vo.setNum(num);
				if(costService.insertCost(vo)) {
					//비용 입력 성공
					int pm = (vo.getTot_money()/plist.size());
					int dm = (vo.getTot_money()/dlist.size());
					List<Integer> mlist = scheService.IvInfo(vo.getS_seq());
					boolean suc = false;
					for(Integer m : mlist) {
						int mno = m;
						Cost_DetailsVO cdvo2 = new Cost_DetailsVO();
						int cost_details_seq = costService.costDetailsSeq();
						cdvo2.setCost_details_seq(cost_details_seq);
						cdvo2.setCost_seq(cost_seq);
						cdvo2.setM_seq(mno);
						for(Integer i : plist) {
							int payno = i;
							if(mno == payno) {
								cdvo2.setPaymen(1);
								cdvo2.setPay_money(pm);
								break;
							}else {
								cdvo2.setPaymen(0);
								cdvo2.setPay_money(0);
							}
						}
						for(Integer i : dlist) {
							int dutno = i;
							if(mno == dutno) {
								cdvo2.setDutch(1);
								cdvo2.setDutch_money(dm);
								break;
							}else {
								cdvo2.setDutch(0);
								cdvo2.setDutch_money(0);
							}
						}
						if(!(cdvo2.getPay_money()==0&&cdvo2.getDutch_money()==0)) {
							if(costService.newCostDetails(cdvo2)) {
								suc = true;
							}else {						
								suc = false;
								break;
							}							
						}
					}
					if(suc) {
						//비용 상세 테이블 모두 입력 성공
						MoneyListVO mvo = new MoneyListVO();
						mvo.setS_seq(vo.getS_seq());
						boolean mck = false;
						for(Integer m : mlist) {
							int mno = m;
							mvo.setM_seq(mno);
							for(Integer i : plist) {
								int payno = i;
								if(mno == payno) {
									//같이 결제 한 회원 일 경우
									mvo.setM_tot_pay(pm);
									break;
								}else {
									//같이 결제 한 회원이 아닐 경우
									mvo.setM_tot_pay(0);
								}
							}
							for(Integer i : dlist) {
								int dutno = i;
								if(mno == dutno) {
									//같이 n빵 할 회원 일 경우
									mvo.setM_tot_dutch(dm);
									break;
								}else {
									//같이 n빵 할 회원이 아닐 경우
									mvo.setM_tot_dutch(0);
								}
							}
							mvo.setM_seq(mno);
							if(costService.checkMNL(mvo)!=0) {
								//누적 지출 금액 테이블에 데이터가 있을 때
								int moneylist_seq = costService.checkMNL(mvo);
								mvo.setMoneylist_seq(moneylist_seq);
								if(costService.updateMNL(mvo)) {
									//누적지출 금액 테이블 수정 성공
									mck = true;
								}else {
									//누적지출 금액 테이블 수정 실패
									mck = false;
									break;
								}
							}else{
								//누적 지출 금액 테이블에 데이터가 없을 때
								if(costService.newMoneyList(mvo)) {
									//누적지출 금액 테이블 생성 성공
									mck = true;
								}else {
									//누적지출 금액 테이블 생성 실패
									mck = false;
									break;
								}
							}
						}
						if(mck) {
							//누적 지출 금액 테이블 데이터 입력 성공
							//비용 정산 테이블 어케하지.  .  ? 쓸모 없는 거 같기도 ? ? ? 
							msg = "비용 입력 성공";
							url = "/trippin/schedule/cost/costHome";					
						}else {
							//누적 지출 금액 테이블 데이터 입력 실패
							costService.delCost(cost_seq);
							msg = "비용 입력 오류";
							url = "/trippin/schedule/cost/costHome";		
						}
					}else {
						costService.delCost(cost_seq);
						msg = "비용 입력 오류";
						url = "/trippin/schedule/cost/costHome";		
					}
				}else {
					msg = "비용 입력 오류";
					url = "/trippin/schedule/cost/costHome";
				}
				
			}
			
		}else {
			url = "/trippin/login/loginForm";
			msg = "다시 로그인 해주세요";
		}
		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);	
		model.addAttribute("day_no", 0);
		model.addAttribute("s_seq", vo.getS_seq());
		model.addAttribute("alone", 0);
		
		return ViewPath.SCHEDULE + "result.jsp";
	}
	
	
	@RequestMapping("/schedule/cost/reCost")
	public String reCost(int s_seq, int cost_seq, int day_no, Model model) {
		
		boolean ack = false;
		
		int su = scheService.scheDay(s_seq);
		
		CostVO cvo = costService.costInfo(cost_seq); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_seq", s_seq);
		map.put("cost_seq", cost_seq);
		List<Map<String, Object>> mlist = costService.reCostMList(map);
		map.clear();

		map.put("cost_seq", cost_seq);
		map.put("type", "pay");
		
		List<Integer> plist = costService.cdMList(map);
		map.replace("type", "dutch");
		List<Integer> dlist = costService.cdMList(map);
		
		
		String pArr = "";
		for(Integer i : plist) {
			pArr +=i.toString()+",";
		}
		String dArr ="";
		for(Integer k : dlist) {
			dArr += k.toString()+",";
		}
		
		if(mlist.size()==1) {
			ack = true;
		}
		
		String[] kind = new String[] {"숙소", "교통", "식비", "쇼핑", "관광", "기타" }; 
		
		model.addAttribute("plist", pArr);
		model.addAttribute("dlist", dArr);
		
		model.addAttribute("kind", kind);
		model.addAttribute("su", su);
		model.addAttribute("ack", ack);
		model.addAttribute("mlist", mlist);
		model.addAttribute("cvo", cvo);
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("day_no", day_no);

		
		return ViewPath.SCHEDULE + "cost/reCost.jsp";
	}
	
	
	@RequestMapping("/schedule/cost/updateCost")
	public String 	updateCost(CostVO vo, boolean ack, Model model, @RequestParam(value = "pArr", required = false) String pArr, 
			@RequestParam(value = "dArr", required = false) String dArr, HttpServletRequest request) {
		
		
		List<Integer> plist = new ArrayList<Integer>();
		List<Integer> dlist = new ArrayList<Integer>();
		
		if(pArr != null) {
			plist = this.makeList(pArr);
		}
		if(dArr != null) {
			dlist = this.makeList(dArr);
		}
		
		int pm = vo.getTot_money();
		int dm = vo.getTot_money();
		
		if(plist.size() > 1) {
			pm = (vo.getTot_money() / plist.size());			
		}
		if(dlist.size() > 1) {
			dm = (vo.getTot_money() / dlist.size());			
		}
		
		System.out.println("pm : "+pm);
		System.out.println("dm : "+dm);
		
		int m_seq = -1;
		
		String url = "";
		String msg = "";
		
		if(request.getSession().getAttribute("login")!=null) {
			m_seq = (int) request.getSession().getAttribute("login");
		}	
		
		vo.setM_seq(m_seq);
		
		//수정하기 전 CostVO  -- 비용상세 테이블 삭제 후 다시 insert 실패 시 다시 수정
		CostVO fcvo = costService.costInfo(vo.getCost_seq());
		int ftm = costService.fMoney(vo.getCost_seq());
		System.out.println(ftm);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "pay");
		map.put("cost_seq", vo.getCost_seq());
		//원래 결제 회원
		List<Integer> fplist = costService.cdMList(map);
		map.replace("type", "dutch");
		//원래 n빵 회원
		List<Integer> fdlist = costService.cdMList(map);
		
		int fpm = (ftm / fplist.size());
		int fdm = (ftm / fdlist.size());
		
		System.out.println("fpm : " + fpm);
		System.out.println("fdm : " + fdm);

		if(m_seq != -1) {
			if(ack || vo.getAlone() == 1) {
				//일행이 없거나 나혼자만의 비용 체크 했을 때
				if(costService.reCost(vo)) {
					//비용 테이블 수정 성공
					costService.delCostDetails(vo.getCost_seq());
					int cost_details_seq = costService.costDetailsSeq();
					Cost_DetailsVO cdvo = new Cost_DetailsVO(cost_details_seq, vo.getCost_seq(), m_seq, 1, 1, vo.getTot_money(), vo.getTot_money());
					if(costService.newCostDetails(cdvo)) {
						//비용 상세 테이블 수정 성공
						int fa = fcvo.getAlone();
						if(fa == 0) {
							//기존 비용이 여러명 일 때
							Map<String, Object> map2 = new HashMap<String, Object>();
							map2.put("cost_seq", vo.getCost_seq());
							map2.put("s_seq", vo.getS_seq());
							List<Map<String, Object>> mlist = costService.reCostMList(map2);  //새로운 멤버리스트
							boolean check2 = false;
							for(Map<String, Object> member : mlist) {
								check2 = true;
								int mtp = 0;
								int mtd = 0;
								boolean mlc = false;			//이미 moneylist 데이터가 있으면 true 없으면 false;
								int mno = Integer.parseInt(String.valueOf(member.get("MNO")));
								System.out.println("mno : "+ mno);
								MoneyListVO mvo = new MoneyListVO();
								mvo.setM_seq(mno);
								mvo.setS_seq(vo.getS_seq());
								if(costService.checkMNL(mvo) != 0) {								
									System.out.println("moneylist 중복체크 mno : "+ mno);
									mlc = true;
									mvo.setMoneylist_seq(costService.checkMNL(mvo));	
								}
								for(Integer i : fplist) {
									if(i == mno) {
										mtp += (-fpm);
									}
								}
								for(Integer i : fdlist) {
									if(i == mno) {
										mtd +=(-fdm);
									}
								}
								if(mno == vo.getM_seq()) {
									mtp += vo.getTot_money();
									mtd += vo.getTot_money();
								}
								mvo.setM_tot_pay(mtp);
								mvo.setM_tot_dutch(mtd);
								if(mlc) {
									//이미 누적 지출 금액 테이블에 데이터가 있음
									if(!costService.updateMNL(mvo)) {
										System.out.println("mno"+mno +"오류");
										check2 = false;
										break;
									}
								}else {
									//누적 지출 금액 테이블에 데이터가 없음
									if(!costService.newMoneyList(mvo)) {
										System.out.println("mno"+mno +"오류");
										check2 = false;
										break;
									}	
								}
								this.MNLZeroCheck(mvo);
							}
							if(check2) {
								//누적 지출 금액 테이블 반영 성공
								msg = "비용 수정 성공";
								url = "/trippin/schedule/cost/costHome";
							}else {
								//누적 지출 금액 테이블 반영 실패
								//이걸 과연 우쨰야 할지 , ,, ,  ,			
								msg = "비용 수정 실패";
								url = "/trippin/schedule/cost/costHome";							
							}		
						}else {
							//기존 비용이 혼자 일 때
							int rm = (-ftm)+(vo.getTot_money());
							MoneyListVO mvo = new MoneyListVO();
							mvo.setS_seq(vo.getS_seq());
							mvo.setM_seq(m_seq);
							mvo.setM_tot_pay(rm);
							mvo.setM_tot_dutch(rm);
							boolean check = false;
							if(costService.checkMNL(mvo) != 0) {
								mvo.setMoneylist_seq(costService.checkMNL(mvo));
								if(costService.updateMNL(mvo)) {
									//moneylist 테이블 수정 성공
									check = true;
									msg = "비용 수정 성공";
									url = "/trippin/schedule/cost/costHome";				
								}
							}else {
								if(costService.newMoneyList(mvo)) {
									check = true;
									msg = "비용 입력 성공";
									url = "/trippin/schedule/cost/costHome";
								}
							}
							if(!check) {
								//moneylist 테이블 수정 실패
								costService.reCost(fcvo); 						//원래 cost 테이블 정보로 다시 수정
								costService.delCD(cost_details_seq);	//위에서 새로 만든 costDetails 테이블 삭제
								cdvo.setPay_money(ftm);						//결제 비용, n빵 비용 기존 비용으로 다시 설정
								cdvo.setDutch_money(ftm);
								costService.newCostDetails(cdvo);		//원래 costDetails 정보로 다시 입력
								msg = "비용 입력 오류";
								url = "/trippin/schedule/cost/costHome";	
							}
						}
					}else {
						costService.reCost(fcvo);
						msg = "비용 수정 오류";
						url = "/trippin/schedule/cost/costHome";		
					}
				}else {
					msg = "비용 수정 오류";
					url = "/trippin/schedule/cost/costHome";		
				}
			}else {
				//일행이 있는 일정 일 때
				if(costService.reCost(vo)) {
					//비용테이블 수정 성공
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("cost_seq", vo.getCost_seq());
					map2.put("s_seq", vo.getS_seq());
					List<Map<String, Object>> mlist = costService.reCostMList(map2);  //새로운 멤버리스트 
					costService.delCostDetails(vo.getCost_seq());		//기존 비용상세테이블 cost_seq  로 삭제
					boolean check1 = true;
					for(Map<String, Object> member : mlist) {
						//
						check1 = true;
						Cost_DetailsVO cdvo = new Cost_DetailsVO();
						int cdno = costService.costDetailsSeq();
						System.out.println("이게 왜 ? ? ? ? ? ? ? ? "+cdno);
						int mno = Integer.parseInt(String.valueOf(member.get("MNO")));
						System.out.println("mno : "+ mno);
						cdvo.setCost_details_seq(cdno);
						cdvo.setM_seq(mno);
						cdvo.setCost_seq(vo.getCost_seq());
						//plist, dlist for 문 돌려서 값 세팅, . . 
						for(Integer  i : plist) {
							int pno = i;
							if(pno == mno) {
								cdvo.setPaymen(1);
								cdvo.setPay_money(pm);
								break;
							}else {
								cdvo.setPaymen(0);
								cdvo.setPay_money(0);
							}
						}
						for(Integer i : dlist) {
							int dno = i;
							if(dno == mno) {
								cdvo.setDutch(1);
								cdvo.setDutch_money(dm);
								break;
							}else {
								cdvo.setDutch(0);
								cdvo.setDutch_money(0);
							}
						}
						if(!(cdvo.getPay_money() == 0 && cdvo.getDutch_money() == 0)) {
							if(!costService.newCostDetails(cdvo)) {
								check1 = false;
								break;
							}								
						}
					}
					if(check1) {
						//비용 상세 테이블 새로 세팅 완료
						boolean check2 = false;
						System.out.println("mlist.size : " +mlist.size());
						for(Map<String, Object> member : mlist) {
							check2 = true;
							int mtp = 0;
							int mtd = 0;
							boolean mlc = false;			//이미 moneylist 데이터가 있으면 true 없으면 false;
							int mno = Integer.parseInt(String.valueOf(member.get("MNO")));
							System.out.println("mno : "+ mno);
							MoneyListVO mvo = new MoneyListVO();
							mvo.setM_seq(mno);
							mvo.setS_seq(vo.getS_seq());
							if(costService.checkMNL(mvo) != 0) {								
								System.out.println("moneylist 중복체크 mno : "+ mno);
								mlc = true;
								mvo.setMoneylist_seq(costService.checkMNL(mvo));	
							}else {
								int moneylist_seq = costService.MNLseq();
								mvo.setMoneylist_seq(moneylist_seq);
							}
							for(Integer i : fplist) {
								if(i == mno) {
									mtp += (-fpm);
								}
							}
							for(Integer i : fdlist) {
								if(i == mno) {
									mtd +=(-fdm);
								}
							}
							for(Integer i : plist) {
								if(i == mno) {
									mtp += pm;
								}
							}
							for(Integer i : dlist) {
								if(i == mno) {
									mtd += dm;
								}
							}
							mvo.setM_tot_pay(mtp);
							mvo.setM_tot_dutch(mtd);
							if(mlc) {
								//이미 누적 지출 금액 테이블에 데이터가 있음
								if(!costService.updateMNL(mvo)) {
									System.out.println("mno"+mno +"오류");
									check2 = false;
									break;
								}
							}else {
								//누적 지출 금액 테이블에 데이터가 없음
								if(!costService.newMoneyList(mvo)) {
									System.out.println("mno"+mno +"오류");
									check2 = false;
									break;
								}	
							}
							this.MNLZeroCheck(mvo);
						}
						if(check2) {
							//누적 지출 금액 테이블 반영 성공
							msg = "비용 수정 성공";
							url = "/trippin/schedule/cost/costHome";
						}else {
							//누적 지출 금액 테이블 반영 실패
							//이걸 과연 우쨰야 할지 , ,, ,  ,			
							msg = "비용 수정 실패";
							url = "/trippin/schedule/cost/costHome";							
						}		
					}else {
						msg = "비용 수정 오류";
						url = "/trippin/schedule/cost/costHome";								
					}
				}else {
					msg = "비용 수정 오류";
					url = "/trippin/schedule/cost/costHome";		
				}
			}
		}else {
			url = "/trippin/login/loginForm";
			msg = "다시 로그인 해주세요";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);	
		model.addAttribute("day_no", 0);
		model.addAttribute("s_seq", vo.getS_seq());
		model.addAttribute("alone", 0);
		
		return ViewPath.SCHEDULE + "result.jsp";
	}
	
	public String kind(int kind) {
		String value = "";
		switch(kind) {
		case 1:
			value = "숙소";
			break;
		case 2:
			value = "교통";
			break;
		case 3:
			value = "식비";
			break;
		case 4:
			value = "쇼핑";
			break;
		case 5:
			value = "관광";
			break;
		case 6:
			value = "기타";
			break;
		}
		return value;
	}
	
	@RequestMapping("/schedule/cost/totCost")
	public String totCost(int s_seq, Model model) {
		
		Map<String, Object> sInfo = scheService.scheInfo(s_seq);
		
		int maxK = costService.maxKind(s_seq);
		String sumMon = costService.sumMon(s_seq);
		String maxKind = this.kind(maxK);
		List<Map<String, Object>> costList = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object>map : costService.kindPer(s_seq)) {
			int kind = Integer.parseInt(String.valueOf(map.get("KIND")));
			String value = "";
			value = this.kind(kind);
			map.put("KNAME", value);
			costList.add(map);
		}
		
		model.addAttribute("sInfo", sInfo);
		model.addAttribute("sumMon", sumMon);
		model.addAttribute("maxKind", maxKind);
		model.addAttribute("costList", costList);
		
		return ViewPath.SCHEDULE +"cost/totCost.jsp";
	}
	
	@RequestMapping("/schedule/cost/totDetail")
	public String totDetail(int kind, int s_seq, Model model) {
		
		Map<String, Object> set = new HashMap<String, Object>();
		String ktype = "";
		
		List<Map<String, Object>> klist = new  ArrayList<Map<String,Object>>();
		for(Integer i : costService.ckList(s_seq)) {
			Map<String, Object> kset = new HashMap<String, Object>();
			kset.put("kind", i);
			kset.put("kname", this.kind(i));
			klist.add(kset);
		}
		
		if(kind == 0) {
			set.put("type", "tot");
			ktype="전체";
		}else {
			set.put("type", "kind");
			set.put("kind", kind);
			ktype = this.kind(kind);
		}
		set.put("s_seq", s_seq);
		
		String tm = costService.kindTM(set);
		
		int dsu = scheService.scheDay(s_seq);
		List<Map<String, Object>> dlist = new ArrayList<Map<String,Object>>();
		for(int i =1; i<=dsu; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			set.put("day_no", i);
			List<Map<String, Object>> clist = new ArrayList<Map<String,Object>>();
			for(Map<String, Object> cm : costService.kindDetail(set)) {
				int kno = Integer.parseInt(String.valueOf(cm.get("KIND")));
				String kname = this.kind(kno);
				cm.put("kname", kname);
				clist.add(cm);
			}
			map.put("clist", clist);
			map.put("dno", i);
			dlist.add(map);
		}
		
		model.addAttribute("s_seq", s_seq);
		model.addAttribute("kind", kind);
		model.addAttribute("klist", klist);
		model.addAttribute("ktype", ktype);
		model.addAttribute("tm", tm);
		model.addAttribute("dlist", dlist);
		
		return ViewPath.SCHEDULE + "cost/totDetail.jsp";
	}
	
	
	public  List<Map<String, Object>> inOut(List<Map<String, Object>> list, String type){
		
		List<Map<String, Object>> inout = new ArrayList<Map<String, Object>>();
		
		for(Map<String, Object> map : list) {
			int tot = Integer.parseInt(String.valueOf(map.get("TOT")));
			if(type == "in") {
				if(tot>0) {
					inout.add(map);
				}
			}else {
				if(tot<0) {
					inout.add(map);
				}
			}
		}	
		return inout;
	}

	public  List<Map<String, Object>> calculate(List<Map<String, Object>> inlist, List<Map<String, Object>> outlist ){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		int isize = inlist.size();
		int osize = outlist.size();

		for(int i = 0; i < osize; i++) {
			//줘야 할 회원 for 문
			//int sender = Integer.parseInt(String.valueOf(outlist.get(i).get("M_SEQ")));
			String sName = (String)outlist.get(i).get("M_NAME");
			//음수
			int otot = Integer.parseInt(String.valueOf(outlist.get(i).get("TOT")));
			for(int j = 0; j < isize; j++) {
				Map<String, Object> map = new HashMap<String, Object>();
				//받아야 할 회원 for 문
				//int receiver = Integer.parseInt(String.valueOf(inlist.get(j).get("M_SEQ")));
				String rName = (String)inlist.get(j).get("M_NAME");
				//양수
				int itot = Integer.parseInt(String.valueOf(inlist.get(j).get("TOT")));
				if(itot!=0) {
					map.put("sender", sName);
					map.put("receiver", rName);
					int sum = (otot+itot);
					if(sum>0) {
						//받을 돈이 주는 돈 보다 많다 >> 줘야 할 회원이 다 주고 현재 받을 회원 끝
						map.put("mon", -otot);
						//받아야 할 회원 총 받는 금액 수정 >>
						inlist.get(j).replace("TOT", otot+itot);
						result.add(map);
						break;
					}else if(sum == 0){
						//받을 돈과 주는 돈이 일치 >> 줘야 할 회원이 다 주고 현재 받을 회원 끝
						map.put("mon", -otot);
						inlist.get(j).replace("TOT", 0);
						result.add(map);
						break;
					}else {
						//주는 돈이 받을 돈보다 많음 >> 줘야 할 회원이 받는 사람 돈 만큼 주고 다른 받아야 할 회원 찾기
						map.put("mon", itot);
						inlist.get(j).replace("tot", 0);	
						result.add(map);
					}
				}
			}
		}
		return result;
	}
		
	
	
	@RequestMapping("/schedule/cost/calculate")
	public String calculate(int s_seq, Model model) {
		
		Map<String, Object> sInfo = scheService.scheInfo(s_seq);
		List<Map<String, Object>> calList = costService.calculateList(s_seq);
		
		List<Map<String, Object>> inlist = this.inOut(calList, "in");
		List<Map<String, Object>> outlist = this.inOut(calList, "out");
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		for(Map<String, Object> map : this.calculate(inlist, outlist)) {
			int mon = Integer.parseInt(String.valueOf(map.get("mon")));
			map.replace("mon", decFormat.format(mon));
			list.add(map);
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("calList", calList);
		model.addAttribute("sInfo", sInfo);

		return ViewPath.SCHEDULE + "cost/calculate.jsp";
	}
	
	@RequestMapping(value="/schedule/cost/deleteCost", produces="application/text;charset=utf8")
	@ResponseBody
	public String deleteCost(@RequestParam("cost_seq")int cost_seq) {
		
		CostVO cvo = costService.costInfo(cost_seq);
		int ftm = cvo.getTot_money();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", "pay");
		map.put("cost_seq", cost_seq);
		//원래 결제 회원
		List<Integer> fplist = costService.cdMList(map);
		map.replace("type", "dutch");
		//원래 n빵 회원
		List<Integer> fdlist = costService.cdMList(map);
		
		map.clear();
		
		map.put("cost_seq", cost_seq);
		map.put("s_seq", cvo.getS_seq());
		List<Map<String, Object>> mlist = costService.reCostMList(map);  //새로운 멤버리스트
		
		int fpm = (ftm / fplist.size());
		int fdm = (ftm / fdlist.size());
		
		
		int alone = cvo.getAlone();
		if(alone == 1) {
			//혼자만의 비용
			MoneyListVO mvo = new MoneyListVO();
			mvo.setM_seq(cvo.getM_seq());
			mvo.setS_seq(cvo.getS_seq());
			int moneylist_seq = costService.checkMNL(mvo);
			mvo.setMoneylist_seq(moneylist_seq);
			mvo.setM_tot_dutch(-ftm);
			mvo.setM_tot_pay(-ftm);
			
			if(costService.updateMNL(mvo)) {
				this.MNLZeroCheck(mvo);
				costService.delCost(cvo.getCost_seq());
				return "비용 삭제 성공";
			}else {
				return "비용 삭제 실패";
			}
			
		}else {
			//함께하는 비용
			boolean check = false;
			for(Map<String, Object>member : mlist) {
				check = true;
				int m_seq = Integer.parseInt(String.valueOf(member.get("MNO")));
				System.out.println(m_seq + "번 삭제");
				MoneyListVO mvo = new MoneyListVO();
				mvo.setM_seq(m_seq);
				mvo.setS_seq(cvo.getS_seq());
				int moneylist_seq = costService.checkMNL(mvo);
				mvo.setMoneylist_seq(moneylist_seq);
				int pm = 0;
				int dm = 0;
				for(Integer i : fplist) {
					if(m_seq == i) {
						pm = -fpm;
					}
				}
				for(Integer i : fdlist) {
					if(m_seq == i) {
						dm = -fdm;
					}
				}
				mvo.setM_tot_pay(pm);
				mvo.setM_tot_dutch(dm);
				if(!(pm==0 &&dm==0)) {// 
					if(!costService.updateMNL(mvo)) {
						check = false;
						break;
					}
				}
				this.MNLZeroCheck(mvo);
			}
			if(check) {
				costService.delCost(cvo.getCost_seq());
				return "비용 삭제 성공";
			}else {
				return "비용 삭제 오류";
			}
		}
	}
	
	public void MNLZeroCheck(MoneyListVO mvo) {
		MoneyListVO zc = costService.zeroCheck(mvo.getMoneylist_seq());
		if(zc.getM_tot_pay() == 0 && zc.getM_tot_dutch() == 0) {
			costService.delMNL(mvo.getMoneylist_seq());
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
