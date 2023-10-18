package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.Clist_CateVO;
import vo.sche.Clist_ItemsVO;

public class Clist_CateDAO {
	
	private SqlSession sqlSession;
	
	public Clist_CateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//새미******************************************************************
	
	public List<Clist_CateVO> cateList(int m_seq){
		return sqlSession.selectList("clist_cate.cateList", m_seq);
	}
	
	public List<Map<String, Object>> cateItem(Map<String, Object> map){
		return sqlSession.selectList("clist_cate.cateItem", map);
	}
	
	
	
}
