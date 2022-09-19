package kr.co.mt.travel.money;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.travel.category.CategoryDTO;

@Service
public class MoneyService {
	@Autowired
	private MoneyDAO dao;
	
	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = dao.insert(dto);
		
		return successCnt;
	}//insert
	
	public MoneyDTO plan_select(String plan_no) {
		MoneyDTO dto = new MoneyDTO();
		dto = dao.plan_select(plan_no);
		
		return dto;
	}//plan_select
	
	public List<MoneyDTO> selectList( String cate_no ) {
		List<MoneyDTO> list = null;
		list = dao.selectList( cate_no );
		return list;
	}//searchList
	
	
}//class
