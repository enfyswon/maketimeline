package kr.co.mt.travel.timeline;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.SearchDTO;

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
	
}
