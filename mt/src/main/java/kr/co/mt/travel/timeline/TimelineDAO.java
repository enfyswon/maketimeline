package kr.co.mt.travel.timeline;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimelineDAO {
	@Autowired
	private SqlSession sqlSession;
	
}
