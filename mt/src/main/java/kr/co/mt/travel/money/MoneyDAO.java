package kr.co.mt.travel.money;

import java.util.List;

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
	
	public List<MoneyDTO> MoneyDTO(String value_no) {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("MoneyMapper.moneySelect", value_no);
		return list;
	}//moneySelect
	
	public List<MoneyDTO> dongName( String key_word ) {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("MoneyMapper.moneyName", key_word);
		return list;
	}//dongName

	

}//class