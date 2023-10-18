package dao.sche;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.sche.Clist_MemoVO;

public class Clist_MemoDAO {
	
	private SqlSession sqlSession;
	
	public Clist_MemoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession; 
	}
	
	
	public int clistMemAdd(Clist_MemoVO cmvo) {
		return sqlSession.insert("clist_memo.clistMemoAdd",cmvo);
	}
	
	public int clistMemoDelete(Clist_MemoVO cmvo) {
		return sqlSession.delete("clist_memo.clistMemoDelete",cmvo);
	}
	
	public Clist_MemoVO ClistMemoOne(Map<String, Object> map){
		return sqlSession.selectOne("clist_memo.ClistMemoOne",map);
	}
	
	public Clist_MemoVO ClistMemoAllOne(Map<String, Object> map){
		return sqlSession.selectOne("clist_memo.ClistMemoAllOne",map);
	}
	
	public int clistMemoUpdate(Clist_MemoVO cmvo) {
		return sqlSession.update("clist_memo.clistMemoUpdate",cmvo);
	}
	

}
