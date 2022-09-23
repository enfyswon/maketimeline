package kr.co.mt.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class TestDAO {

	@Autowired
	private SqlSession sqlSession;

	public int insert(List<KoreaDTO> list) {
		int successCnt = 0;
		successCnt = sqlSession.insert("TestMapper.testInsert", list);
		
		return successCnt;
	}//insert
	
}//class







	

