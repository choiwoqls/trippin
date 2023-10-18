package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.CityVO;
import vo.sche.ScheVO;

public class CityDAO {
	
	private SqlSession sqlSession;
	
	public CityDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public int newCity(CityVO vo) {
		return sqlSession.insert("newCity", vo);
	}
	
	public int city_seq() {
		return sqlSession.selectOne("city_seq");
	}
	
	public int delCity(int s_seq) {
		return sqlSession.delete("delCity", s_seq);
	}
	
	public List<Map<String, Object>> selectCity(int s_seq){
		return sqlSession.selectList("selectCity", s_seq);
	}
	
	public int firstCity(int s_seq) {
		return sqlSession.selectOne("firstCity", s_seq);
	}
	
}
