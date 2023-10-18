package dao.sche;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.Clist_ItemsVO;

public class Clist_ItemsDAO {
	
	private SqlSession sqlSession;
	
	public Clist_ItemsDAO(SqlSession sqlSession) {
	 this.sqlSession =sqlSession;
	}
	
	
	//새미******************************************************************
//	public List<Clist_ItemsVO> citemsListR() {
//		return sqlSession.selectList("clist_items.citemsListR");
//	}
//	
//	public List<Clist_ItemsVO> citemsListD() {
//		return sqlSession.selectList("clist_items.citemsListD");
//	}
//	
//	public List<Clist_ItemsVO> citemsListR3() {
//		return sqlSession.selectList("clist_items.citemsListR3");
//	}
//	
//	public List<Clist_ItemsVO> citemsListD3() {
//		return sqlSession.selectList("clist_items.citemsListD3");
//	}
//	
//	public List<Clist_ItemsVO> citemsListRA(Map<String, Object>map) {
//		return sqlSession.selectList("clist_items.citemsListRA",map);
//	}
//
//	//아이템 insert추가
//	
//	public int ItemsAddIn(Clist_ItemsVO clvo) {
//		return sqlSession.insert("clist_items.ItemsAddIn",clvo);
//	}
//	
//	public int clist_itemSeq() {
//		return sqlSession.selectOne("clist_items.clist_itemSeq");
//	}
//
//	//추가 아이템 리스트
//	public List<Clist_ItemsVO> addItems(int m_seq) {
//		return sqlSession.selectList("clist_items.addItems",m_seq);
//	}

}
