package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.Addr2VO;

public class Addr2DAO {

	private SqlSession sqlSession;
	
	public Addr2DAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Addr2VO> addr2(int addr1_seq){
		return sqlSession.selectList("addr2.addr2", addr1_seq);
	}
	
	//재빙
	
	//addr2 이름
	public String addr2Name(int addr2_seq) {
		return sqlSession.selectOne("addr2Name", addr2_seq);
	}
	
	//현지
	public int addrInfo(int addr2_seq) {
		return sqlSession.selectOne("addr2.addrInfo", addr2_seq);
	}
	
}
