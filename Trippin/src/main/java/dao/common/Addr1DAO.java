package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.common.Addr1VO;

public class Addr1DAO {

	private SqlSession sqlSession;
	
	public Addr1DAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Addr1VO> addr1(){
		return sqlSession.selectList("addr1.addr1");
	}
	
	public List<Addr1VO> addr1List(){
		return sqlSession.selectList("addr1List");
	}
	
	public String addr_name(int addr_seq) {
		return sqlSession.selectOne("addr_name", addr_seq);
	}
	
	
}
