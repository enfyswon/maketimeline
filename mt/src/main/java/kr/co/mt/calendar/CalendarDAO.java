package kr.co.mt.calendar;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession sqlSession;

	public CalendarDTO dateInfo(String userWantMonth) {
		CalendarDTO dto = null;
		dto = sqlSession.selectOne("CalendarMapper.dateInfo", userWantMonth);
		return dto;
	}//dateInfo

}//class
