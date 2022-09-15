package kr.co.mt.travel.money;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MoneyService {
	@Autowired
	private MoneyDAO dao;
	
	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = dao.insert(dto);
		
		return successCnt;
	}
	public List<MoneyDTO> moneyName( String key_word ) {
		List<MoneyDTO> list = null;
		list = dao.dongName( key_word );
		return list;
	}//dongName
	
	public List<MoneyDTO> moneySelect( String value_no ) {
		List<MoneyDTO> list = null;
		list = dao.MoneyDTO( value_no );
		return list;
	}//dongSelect
}
