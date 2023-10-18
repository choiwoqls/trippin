package dao.sche;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.sche.NuguVO;

public class NuguDAO {
	
	private SqlSession sqlSession;
	
	public NuguDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	
	//[재빈]***********************************************************
	public List<NuguVO> nuguList(){
		return sqlSession.selectList("nuguList");
	}
	
	
	//[현지]***********************************************************
	public String selectWho(int nugu_seq) {
		return sqlSession.selectOne("nugu.selectWho", nugu_seq);
	}
	
	
	
}
