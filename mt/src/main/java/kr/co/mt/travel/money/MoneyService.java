package kr.co.mt.travel.money;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.memo.MemoDTO;

@Service
public class MoneyService {
	@Autowired
	private MoneyDAO dao;
	
	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = dao.insert(dto);
		
		return successCnt;
	}
	
	public List<MoneyDTO> MoneyListByMno(String loginMno) {
		List<MoneyDTO> list = null;
		list = dao.moneyListByMno( loginMno );
		return list;
	}//myRoomListByMno
}
