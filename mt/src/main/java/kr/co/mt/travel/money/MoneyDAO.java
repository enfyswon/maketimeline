package kr.co.mt.travel.money;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MoneyDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("MoneyMapper.moneyInsert", dto);
		
		return successCnt;
	}//insert
}