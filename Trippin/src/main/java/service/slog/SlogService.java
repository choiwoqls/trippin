package service.slog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.sche.NuguDAO;
import dao.sche.StyleDAO;
import dao.slog.Day_SlogDAO;
import dao.slog.Place_SlogDAO;
import dao.slog.SlogDAO;
import dao.slog.Slog_AddDAO;
import dao.slog.Slog_CmtDAO;
import dao.slog.Slog_Cmt_LikeDAO;
import dao.slog.Slog_LikeDAO;
import vo.slog.Day_SlogVO;
import vo.slog.Place_SlogVO;
import vo.slog.SlogVO;
import vo.slog.Slog_AddVO;
import vo.slog.Slog_CmtVO;
import vo.slog.Slog_Cmt_LikeVO;
import vo.slog.Slog_LikeVO;

public class SlogService {
	
	private SlogDAO slogDao;
	private Day_SlogDAO day_slogDao;
	private Place_SlogDAO place_slogDao;
	private Slog_AddDAO slog_addDao;
	private Slog_LikeDAO slog_likeDao;
	private Slog_CmtDAO slog_cmtDao;
	private Slog_Cmt_LikeDAO slog_cmt_likeDao;
	private NuguDAO nuguDao;
	private StyleDAO styleDao;
	
	public SlogService(SlogDAO slogDao, Day_SlogDAO day_slogDao, Place_SlogDAO place_slogDao, Slog_AddDAO slog_addDao, Slog_LikeDAO slog_likeDao, Slog_CmtDAO slog_cmtDao, Slog_Cmt_LikeDAO slog_cmt_likeDao, NuguDAO nuguDao, StyleDAO styleDao) {
		this.slogDao=slogDao;
		this.day_slogDao=day_slogDao;
		this.place_slogDao=place_slogDao;
		this.slog_addDao=slog_addDao;
		this.slog_likeDao=slog_likeDao;
		this.slog_cmtDao=slog_cmtDao;
		this.slog_cmt_likeDao=slog_cmt_likeDao;
		this.nuguDao=nuguDao;
		this.styleDao=styleDao;
	}
	
	public SlogVO checkSlog(SlogVO vo) {
		SlogVO svo = null;
		if(slogDao.checkSlog(vo)!=null) {
			svo = slogDao.checkSlog(vo);
		}
		return svo;
	}
	
	public boolean newSlog(SlogVO vo) {
		boolean check = false;
		if(slogDao.newSlog(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public int slogSeq() {
		return slogDao.slogSeq();
	}
	
	public int day_slogSeq() {
		return day_slogDao.day_slogSeq();
	}
	
	public boolean newDaySlog(Day_SlogVO vo) {
		boolean check = false;
		if(day_slogDao.newDaySlog(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public boolean newPlaceSlog(Place_SlogVO vo) {
		boolean check = false;
		if(place_slogDao.newPlaceSlog(vo)!=0) {
			check =true;
		}
		return check;
	}
	
	public void delSlog(int slog_seq) {
		slogDao.delSlog(slog_seq);
	}
	
	public Map<String, Object> slogInfo(int slog_seq){
		Map<String, Object> map = null;
		if(slogDao.slogInfo(slog_seq)!=null) {
			map = slogDao.slogInfo(slog_seq);
		}
		return map;
	}
	
	public List<Map<String, Object>> daySlogList(int slog_seq){
		List<Map<String, Object>> list = null;
		if(!day_slogDao.daySlogList(slog_seq).isEmpty()) {
			list = day_slogDao.daySlogList(slog_seq);
		}
		return list;
	}
	
	public List<Map<String, Object>> placeSlogList(int day_slog_seq){
		List<Map<String, Object>> list = null;
		if(!place_slogDao.placeSlogList(day_slog_seq).isEmpty()) {
			list = place_slogDao.placeSlogList(day_slog_seq);
		}
		return list;
	}
	
	public String reSlogTitle(SlogVO vo) {
		String check = "실패";
		if(slogDao.reSlogTitle(vo)!=0) {
			check = "성공";
		}
		return check;
	}
	
	public String reSlogIntro(SlogVO vo) {
		String check = "실패";
		if(slogDao.reSlogIntro(vo)!=0) {
			check = "성공";;
		}
		return check;
	}

	public String reDaySlogContent(Day_SlogVO vo) {
		String check = "실패";
		if(day_slogDao.reDaySlogContent(vo)!=0) {
			check = "성공";
		}
		return check;
	}
	
	public boolean rePlaceSlog(Place_SlogVO vo) {
		boolean check = false;
		if(place_slogDao.rePlaceSlog(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public int selectS_seq(int place_slog_seq) {
		int s_seq = 0;
		if(place_slogDao.selectS_seq(place_slog_seq)!=null) {
			s_seq = place_slogDao.selectS_seq(place_slog_seq);
		}
		return s_seq;
	}
	
	public boolean reSlogImg(SlogVO vo) {
		boolean check = false;
		if(slogDao.reSlogImg(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public void changeStatus(SlogVO vo) {
		slogDao.changeStatus(vo);
	}
	
	public Map<String, Object> slogInfoPlus(int slog_seq){
		Map<String, Object> map = null;
		if(slogDao.slogInfoPlus(slog_seq)!=null) {
			map = slogDao.slogInfoPlus(slog_seq);
		}
		return map;
	}
	
	public List<Map<String, Object>> slogCmtList(int slog_seq){
		List<Map<String, Object>> list = null;
		if(slogDao.slogCmtList(slog_seq)!=null) {
			list = slogDao.slogCmtList(slog_seq);
		}
		return list;
	}
	
	public String selectWho(int nugu_seq) {
		String who = "";
		if(nuguDao.selectWho(nugu_seq)!=null) {
			who = nuguDao.selectWho(nugu_seq);
		}
		return who;
	}
	
	public String selectWhat(int style_seq) {
		String what = "";
		if(styleDao.selectWhat(style_seq)!=null) {
			what = styleDao.selectWhat(style_seq);
		}
		return what;
	}
	
	public boolean slogAddCheck(Slog_AddVO vo) {
		boolean check = false;
		if(slog_addDao.slogAddCheck(vo) != null) {
			check = true;
		}
		return check;
	}
	
	public boolean newSlogAdd(Slog_AddVO vo) {
		boolean check = false;
		if(slog_addDao.newSlogAdd(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public Slog_LikeVO checkSLike(Slog_LikeVO vo) {
		Slog_LikeVO svo = null;
		if(slog_likeDao.checkSLike(vo)!=null) {
			svo = slog_likeDao.checkSLike(vo);
		}
		return svo;
	}
	
	public boolean insert(Slog_LikeVO vo) {
		boolean check = false;
		if(slog_likeDao.insert(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public boolean deleteSLike(Slog_LikeVO vo) {
		boolean check = false;
		if(slog_likeDao.deleteSLike(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public boolean newSlogCmt(Slog_CmtVO vo) {
		boolean check = false;
		if(slog_cmtDao.newSlogCmt(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	public Integer checkScLike(Slog_Cmt_LikeVO vo) {
		Integer slog_cmt_like_seq = null;
		if(slog_cmt_likeDao.checkScLike(vo)!= null) {
			slog_cmt_like_seq = slog_cmt_likeDao.checkScLike(vo);
		}
		return slog_cmt_like_seq;
	}
	
	public boolean delScLike(int slog_cmt_like_seq) {
		boolean check = false;
		if(slog_cmt_likeDao.delScLike(slog_cmt_like_seq)!=0) {
			check = true;
		}
		return check;
	}
	
	public boolean newScLike(Slog_Cmt_LikeVO vo) {
		boolean check = false;
		if(slog_cmt_likeDao.newScLike(vo)!=0) {
			check = true;
		}
		return check;
	}
	
	/*2023-09-22*/
	
	public List<Map<String, Object>> slogList(){
		List<Map<String, Object>> list = null;
		if(slogDao.slogList()!=null) {
			list = slogDao.slogList();
		}
		return list;
	}
	
	
	
	
}
