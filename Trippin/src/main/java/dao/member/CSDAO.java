package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import vo.member.CSVO;

public class CSDAO {
	
	private SqlSession sqlSession;
	
	public CSDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<CSVO> allTitle(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allTitle",map);
	}

	// 숙소전체 

	public List<CSVO>allAccom(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allAccom",map);
	}
	
	//cs 페이징(count)
	public int cgetTotal(Map<String, Object> map) {
		
		return sqlSession.selectOne("cs.getTotal",map);
	}
	

	
	// 투어/티켓 전체 
	public List<CSVO>allTour(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allTour",map);
	}
	

   // 서비스일반 전체 
	public List<CSVO>allService(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allService",map);
	}
	
	// 공통 전체 
	public List<CSVO>allCommon(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allCommon",map);
	}
	
	// 공지사항 전체 
	public List<CSVO>allNoti(Map<String, Object> map){ 
		return sqlSession.selectList("cs.allNoti",map);
	}
	//숙소-예약 리스트 
	public List<CSVO>A_rv(Map<String, Object> map){ 
		return sqlSession.selectList("cs.A_rv",map);
	}
	//숙소-예약변경 리스트 
	public List<CSVO>A_rvc(Map<String, Object> map){ 
		return sqlSession.selectList("cs.A_rvc",map);
	}
	//숙소-결제 리스트 
	public List<CSVO>A_pay(Map<String, Object> map){ 
		return sqlSession.selectList("cs.A_pay",map);
	}
	//숙소-요청사항 리스트 
	public List<CSVO>A_req(Map<String, Object> map){ 
		return sqlSession.selectList("cs.A_req",map);
	}
	//숙소-이용 리스트 
	public List<CSVO>A_acc(Map<String, Object> map){ 
		return sqlSession.selectList("cs.A_acc",map);
	}
	//숙소-취소 환불 리스트 
		public List<CSVO>A_cref(Map<String, Object> map){ 
			return sqlSession.selectList("cs.A_cref",map);
		}
		
	///투어///////////////////////////
		
		//투어예약 
		public List<CSVO>t_Res(Map<String, Object> map){ 
			return sqlSession.selectList("cs.t_Res",map);
		}
		//투어이용 
		public List<CSVO>t_Acc(Map<String, Object> map){ 
			return sqlSession.selectList("cs.t_Acc",map);
		}
		//투어 취소 및 환불 
		public List<CSVO>t_cref(Map<String, Object> map){ 
			return sqlSession.selectList("cs.t_cref",map);
		}

///서비스일반////////////////////////////////////////
		// 서비스일반- 계정관련 -->
		public List<CSVO>s_account(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_account",map);
		}


		//-- 서비스일반-일정  -->
		public List<CSVO>s_sch(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_sch",map);
		}
	

		//-- 서비스일반-도시정보  -->
		public List<CSVO>s_city(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_city",map);
		}

		//<!-- 서비스일반-라운지  -->
		public List<CSVO>s_lounge(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_lounge",map);
		}
		

		//<!-- 서비스일반-셀프패키지  -->
		public List<CSVO>s_self(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_self",map);
		}
	

		//<!-- 서비스일반-여행자클럽 및 혜택  -->
		public List<CSVO>s_club(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_club",map);
		}

		
		//<!-- 서비스일반-트리핀 캐시  -->
		public List<CSVO>s_cash(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_cash",map);
		}
	
		//<!-- 서비스일반-광고 -->
		public List<CSVO>s_ad(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_ad",map);
		}


		//<!-- 서비스일반-기타 -->
		public List<CSVO>s_etc(Map<String, Object> map){ 
			return sqlSession.selectList("cs.s_etc",map);
		}

//<!-- cs 삭제 -->
		
		public int csDel(int cs_seq) {
			return sqlSession.delete("cs.csDel",cs_seq);
		}
	//	<!-- csSEQ -->
		public int getCsSeq() {
			return sqlSession.selectOne("cs.getCsSeq");
		}
		
		//<!-- cs insert -->
		public int csInsert(CSVO csvo) {
			return sqlSession.insert("cs.csInsert",csvo);
		}

	
		public Map<String, Object> getContent(int cs_seq){
			return sqlSession.selectOne("cs.getContent",cs_seq);
		}
	


	public List<CSVO> cateAjaxCs(Map<String, Object> map) {
		return sqlSession.selectList("cs.cateAjaxCs",map);
	}
		
	
	public List<CSVO> cateAjaxCsAll() {
		return sqlSession.selectList("cs.cateAjaxCsAll");
	}

	
	public List<CSVO> filelistCs(int cs_seq) {
		return sqlSession.selectList("cs.filelistCs",cs_seq);
	}
	
	

//cs
	
	public List<CSVO> csTitleAjax(Map<String, Object> map) {
		return sqlSession.selectList("cs.csTitleAjax",map);
	}
	
	public int csUpdate(CSVO csvo) {
		
		return sqlSession.update("cs.csUpdate",csvo);
		
	}


		



	
	
	
	
	






}
