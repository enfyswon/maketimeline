package kr.co.mt.travel.money;

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
	}
}
