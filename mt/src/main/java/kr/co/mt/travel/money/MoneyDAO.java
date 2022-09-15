package kr.co.mt.travel.money;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.memo.MemoDTO;

@Repository
public class MoneyDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("MoneyMapper.moneyInsert", dto);
		
		return successCnt;
	}//insert
	
	public List<MoneyDTO> moneyListByMno(String loginMno) {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("MoneyMapper.moneyListByMno", loginMno);
		return list;
	}//myRoomListByMno
	

	

}//class