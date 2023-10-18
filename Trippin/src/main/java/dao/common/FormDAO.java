package dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.common.FormVO;

public class FormDAO {

	private SqlSession sqlSession;
	
	public FormDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public int insert(FormVO vo) {
		return sqlSession.insert("form.insert", vo);
	}
	
	public int nowSeq() {
		return sqlSession.selectOne("form.nowSeq");
	}
	
	//[현지]*****************************************************************
	public Map<String, Object> selectTour(int f_seq){
		return sqlSession.selectOne("form.selectTour", f_seq);
	}
	
	public Map<String, Object> selectForm(int f_seq) {
		return sqlSession.selectOne("form.selectForm", f_seq);
	}
	
	
	//[희지]*****************************************************************
	
	// 맛집 insert
	public int insertHotple(FormVO fvo) {
		return sqlSession.insert("form.insert", fvo);
	}
	
	// 맛집, 관광지 하나 상세
	public FormVO selectOne(int f_seq) {
		return sqlSession.selectOne("form.form", f_seq);
	}
	
	// 관광지, 맛집 리스트 뽑기
	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return sqlSession.selectList("form.selectList",map);
	}
	
	// 맛집 하나 상세
	public Map<String, Object> selectHotple(int f_seq){
		return sqlSession.selectOne("form.selectHotple", f_seq);
	}
	
	// 리스트용 페이징 수
	public int count(int cate_seq) {
		return sqlSession.selectOne("form.count", cate_seq);
	}
	
	// 폼 삭제
	public int delete(int f_seq) {
		return sqlSession.delete("form.delete", f_seq);
	}
	
	// 폼 이미지 경로
	public String path(int f_seq) {
		return sqlSession.selectOne("form.path", f_seq);
	}
	
	// 관리자용 카테별 리스트
	public List<Map<String, Object>> adminList(Map<String, Object> map){
		return sqlSession.selectList("form.adminList", map);
	}
	
	// 폼 수정
	public int update(FormVO vo) {
		return sqlSession.update("form.update", vo);
	}

	// 본점 리스트
	public List<Map<String, Object>> headList(Map<String, Object> map){
		return sqlSession.selectList("form.headList", map);
	}
	
	// 지점 리스트
	public List<Map<String, Object>> branches(int f_seq){
		return sqlSession.selectList("form.branches", f_seq);
	}
	
	
	
	//[재빈]*****************************************************************
	public List<Map<String, Object>> selectScheList(int cate_seq){
		return sqlSession.selectList("form.selectScheList", cate_seq);
	}
	
	//일정 추가 
	public List<Map<String, Object>> selectAddrForm(Map<String, Object> map){
		return sqlSession.selectList("selectAddrForm", map);
	}
	//관광지 종류
	public String tourCate(int t_cate_seq) {
		return sqlSession.selectOne("tourCate", t_cate_seq);
	}
	
	//맛집 종류
	public String hotpleCate(int h_cate_seq) {
		return sqlSession.selectOne("hotpleCate", h_cate_seq);
	}
	
	//숙소 종류
	public String accCate(int a_cate_seq) {
		return sqlSession.selectOne("accCate", a_cate_seq);
	}

	//2023-08-13
	//모든 form 리스트
	public List<Map<String, Object>> selectAllScheList(int addr1_seq){
		return sqlSession.selectList("selectAllScheList", addr1_seq);
	}
	
	//2023-08-14
	public List<Map<String, Object>> afList(){
		return sqlSession.selectList("afList");
	}
	
	
	
	//[새미]*****************************************************************
	public List<FormVO> formList(){
		return sqlSession.selectList("form.formList");
	}
	
	
}
