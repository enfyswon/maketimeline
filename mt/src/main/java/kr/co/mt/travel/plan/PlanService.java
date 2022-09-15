package kr.co.mt.travel.plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.travel.category.CategoryDTO;

@Service
public class PlanService {
	@Autowired
	private PlanDAO dao;
	
	public int insert(PlanDTO dto) {
		int successCnt = 0;
		successCnt = dao.insert(dto);
		
		return successCnt;
	}//insert
	
	public PlanDTO plan_select(String plan_no) {
		PlanDTO dto = new PlanDTO();
		dto = dao.plan_select(plan_no);
		
		return dto;
	}//plan_select
	
	public List<PlanDTO> selectList( String cate_no ) {
		List<PlanDTO> list = null;
		list = dao.selectList( cate_no );
		return list;
	}//searchList

	public List<MoneyDTO> selectMoneyList() {
		List<MoneyDTO> list = null;
		list = dao.selectMoneyList();
		
		return list;
	}
	
	
}//class
