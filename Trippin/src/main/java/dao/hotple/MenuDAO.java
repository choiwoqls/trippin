package dao.hotple;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.hotple.MenuVO;

public class MenuDAO {

	private SqlSession sqlSession;
	
	public MenuDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(MenuVO vo) {
		return sqlSession.insert("menu.insert", vo);
	}
	
	public List<MenuVO> selectOne(int f_seq) {
		return sqlSession.selectList("menu.menu", f_seq);
	}
	
	public int delete(int menu_seq) {
		return sqlSession.delete("menu.delete", menu_seq);
	}
	
	public List<Integer> seqList(int f_seq){
		return sqlSession.selectList("menu.seqList", f_seq);
	}
	
	public int nowMenu() {
		return sqlSession.selectOne("menu.nowMenu");
	}
	
	public int menuUpdate (MenuVO vo) {
		return sqlSession.update("menu.update", vo);
	}
	
	public String imgPath(int menu_seq) {
		return sqlSession.selectOne("menu.imgPath", menu_seq);
	}
}
