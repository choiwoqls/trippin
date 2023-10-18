package dao.accom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public class PensionDAO {
	
	private SqlSession sqlSession;
	
	public PensionDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//숙소 리스트
	public List<Map<String, Object>> selectAlist(){
		return sqlSession.selectList("accom.selectAlist");
	}
	//select 세부(숙소만)
	public Map<String, Object> selectPen(int f_seq){
		return sqlSession.selectOne("accom.selectPen", f_seq);
	}
	
	//select 객실
	public List<Map<String, Object>> selectRoom(int f_seq){
		return sqlSession.selectList("accom.selectRoom", f_seq);
	}
	
//	//detail 객실
//	public Map<String, Object> detailRoom(int room_seq){
//		return sqlSession.selectOne("accom.detailRoom", room_seq);
//	}
//	
//	public String benefit(int room_benefit_seq) {
//		return sqlSession.selectOne("accom.benefit", room_benefit_seq);
//	}
	
}
