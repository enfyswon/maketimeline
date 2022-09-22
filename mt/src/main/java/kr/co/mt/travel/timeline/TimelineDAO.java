package kr.co.mt.travel.timeline;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.dto.SearchDTO;
import kr.co.mt.travel.category.CategoryDTO;

@Repository
public class TimelineDAO {
	@Autowired
	private SqlSession sqlSession;

	public int timeline_insert(TimelineDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("TimelineMapper.timeInsert", dto);
		
		return successCnt;
	}

	public List<TimelineDTO> timeline_list(String cate_no) {
		List<TimelineDTO> list = null;
		list = sqlSession.selectList("TimelineMapper.timeList", cate_no);
		
		return list;
	}
	
	public int time_delete(String timeline_no) {
		int successCnt = 0;
		successCnt = sqlSession.delete("TimelineMapper.timeDelete", timeline_no);
		
		return successCnt;
	}
	
	public int time_update(TimelineDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("TimelineMapper.timelineUpdate", dto);
		
		return successCnt;
	}
	public TimelineDTO time_select(String timeline_no) {
		TimelineDTO dto = new TimelineDTO();
		dto = sqlSession.selectOne("TimelineMapper.timeSelect", timeline_no);
		
		return dto;
	}

	public List<TimelineDTO> timeline_maplist(String cate_no) {
		List<TimelineDTO> list = null;
		list = sqlSession.selectList("TimelineMapper.mapList", cate_no);
		
		return list;
	}
	public List<TimelineDTO> searchList( SearchDTO dto ) {
		List<TimelineDTO> list = null;
		list = sqlSession.selectList("TimelineMapper.selectList", dto);
		return list;
	}//searchList

	public List<MoneyDTO> selectMoneyList() {
		List<MoneyDTO> list = null;
		list = sqlSession.selectList("TimelineMapper.selectMoney");
		
		return list;
	}
	
}
