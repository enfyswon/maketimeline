package kr.co.mt.travel.money;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.travel.plan.PlanDTO;

@Repository
public class MoneyDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insert(MoneyDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("MoneyMapper.MoneyInsert", dto);
		
		return successCnt;
	}//insert
	
	public MoneyDTO plan_select(String plan_no) {
		MoneyDTO dto = new MoneyDTO();
		dto = sqlSession.selectOne("MoneyMapper.planSelect", plan_no);
		
		return dto;
	}//plan_select
	
	public List<MoneyDTO> selectList( String plan_no ) {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("MoneyMapper.selectList", plan_no);
		return list;
	}//selectList
	
}//class