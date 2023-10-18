package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.HoursVO;

public class HoursDAO {
	
	private SqlSession sqlSession;
	
	public HoursDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	} 
	
	
	public int insert(HoursVO vo) {
		return sqlSession.insert("hours.insert", vo);
	}
	
	public List<Map<String, Object>> selectHours(int f_seq){
		return sqlSession.selectList("hours.selectHours", f_seq);
	}
	
	
	
	
	//히지
//	public int insert(HoursVO vo) {
//		return sqlSession.insert("hours.insert", vo);
//	}
	
	public List<HoursVO> selectOne(int f_seq){
		return sqlSession.selectList("hours.hours", f_seq);
	}
	
	public List<HoursVO> oneHour(int f_seq){
		return sqlSession.selectList("hours.oneHour", f_seq);
	}
	
	public int hours_seq() {
		return sqlSession.selectOne("hours.hours_seq");
	}
	
	public int hoursDelete(HoursVO vo) {
		return sqlSession.delete("hours.delete", vo);
	}
	
	
}
