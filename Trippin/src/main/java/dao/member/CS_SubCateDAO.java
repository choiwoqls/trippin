package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.CS_SubCateVO;

public class CS_SubCateDAO {
	private SqlSession sqlSession;
	
	public CS_SubCateDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public List<CS_SubCateVO> csSubCateAll(){
		return sqlSession.selectList("cs_subcate.csSubCateAll");
	}

	public List<CS_SubCateVO> csSubCateList(){
		return sqlSession.selectList("cs_subcate.csSubCateList");
	}
	public List<CS_SubCateVO> csSubCateAllaj(Map<String, Object> map){
		return sqlSession.selectList("cs_subcate.csSubCateAllAjax",map);
	}
	
	public List<CS_SubCateVO> csSubCateOne(int cs_cate_seq){
		return sqlSession.selectList("cs_subcate.csSubCateOne",cs_cate_seq);
	}
	
	public CS_SubCateVO csSubCateMyOn(int cs_seq){
		return sqlSession.selectOne("cs_subcate.csSubCateMyOne",cs_seq);
	}
	

	
	
	public List<CS_SubCateVO> csSubCateAll1(){
		return sqlSession.selectList("cs_subcate.csSubCateAll1");
	}
	
	
	public List<CS_SubCateVO> csSubCateAll2(){
		return sqlSession.selectList("cs_subcate.csSubCateAll2");
	}
	
	public List<CS_SubCateVO> csSubCateAll3(){
		return sqlSession.selectList("cs_subcate.csSubCateAll3");
	}
	
	public List<CS_SubCateVO> allClist(Map<String, Object>map){
		return sqlSession.selectList("cs_subcate.allClist",map);
	}
	
	
	
	
}
