package dao.accom;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.accom.Cf_subVO;
import vo.accom.Hs_subVO;

public class AccomDAO {
	private SqlSession sqlSession;
	
	public AccomDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Hs_subVO> hssub(){
		return sqlSession.selectList("accom.hssub");
	}
	
	public List<Cf_subVO> cfsub(){
		return sqlSession.selectList("accom.cfsub");
	}
}
