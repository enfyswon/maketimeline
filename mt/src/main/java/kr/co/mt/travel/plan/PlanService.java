package kr.co.mt.travel.plan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.travel.category.CategoryDTO;

@Service
public class PlanService {
	@Autowired
	private PlanDAO dao;
	
	public int insert(PlanDTO dto) {
		int successCnt = 0;
		successCnt = dao.insert(dto);
		
		return successCnt;
	}
	public PlanDTO plan_select(String plan_no) {
		PlanDTO dto = new PlanDTO();
		dto = dao.plan_select(plan_no);
		
		return dto;
	}
}
