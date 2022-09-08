package kr.co.mt.travel.plan;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlanDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insert(PlanDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("PlanMapper.planInsert", dto);
		
		return successCnt;
	}//insert
}