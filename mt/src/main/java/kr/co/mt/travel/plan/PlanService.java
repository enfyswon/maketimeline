package kr.co.mt.travel.plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.test.KoreaDTO;
import kr.co.mt.travel.category.CategoryDTO;
import kr.co.mt.travel.timeline.TimelineDTO;

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
	
	public List<PlanDTO> planList( String cate_no ) {
		List<PlanDTO> list = null;
		list = dao.planList( cate_no );
		return list;
	}//searchList

	public List<MoneyDTO> selectMoneyList() {
		List<MoneyDTO> list = null;
		list = dao.selectMoneyList();
		
		return list;
	}

	public int update(PlanDTO dto) {
		int successCnt = 0;
		successCnt = dao.update(dto);
		
		return successCnt;
	}

	public int delete(String plan_no) {
		int successCnt = 0;
		successCnt = dao.delete(plan_no);
		
		return successCnt;
	}

	public int dateUpdate(PlanDTO dto) {
		int successCnt = 0;
		successCnt = dao.dateUpdate(dto);
		
		return successCnt;
	}
	
	public List<KoreaDTO> tourlist(String region_no) {
		List<KoreaDTO> list = null;
		list = dao.tourlist(region_no);
		
		return list;
	}
	
}//class
