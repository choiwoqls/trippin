package dao.hotple;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.hotple.BranchVO;

public class BranchDAO {

	private SqlSession sqlSession;
	
	public BranchDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int main(int f_seq) {
		return sqlSession.selectOne("branch.main", f_seq);
	}
	
	public int registerMain(int f_seq) {
		return sqlSession.insert("branch.registerMain", f_seq);
	}
	
	public BranchVO branch(int f_seq) {
		return sqlSession.selectOne("branch.branch", f_seq);
	}
	
	public int register(BranchVO vo) {
		return sqlSession.update("branch.register", vo);
	}
	
	public List<Integer> subList(){
		return sqlSession.selectList("branch.subList");
	}

}
