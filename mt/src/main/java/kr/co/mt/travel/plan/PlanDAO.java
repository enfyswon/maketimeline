package kr.co.mt.travel.plan;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.travel.category.CategoryDTO;

@Repository
public class PlanDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insert(PlanDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("PlanMapper.planInsert", dto);
		
		return successCnt;
	}//insert
	
	public PlanDTO plan_select(String plan_no) {
		PlanDTO dto = new PlanDTO();
		dto = sqlSession.selectOne("PlanMapper.cateSelect", plan_no);
		
		return dto;
	}//plan_select
	
	public List<PlanDTO> selectList( String cate_no ) {
		List<PlanDTO> list = null;
		list = sqlSession.selectList("PlanMapper.selectList", cate_no);
		return list;
	}//selectList

	public List<MoneyDTO> selectMoneyList() {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("PlanMapper.selecetMoney");
		
		return list;
	}
	
}//class