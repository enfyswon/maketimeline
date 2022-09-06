package kr.co.mt.travel;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TravelDAO {
	@Autowired
	private SqlSession sqlSession;
}
