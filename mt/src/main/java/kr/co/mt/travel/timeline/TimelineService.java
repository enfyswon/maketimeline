package kr.co.mt.travel.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.SearchDTO;
import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.travel.category.CategoryDTO;

@Service
public class TimelineService {
	@Autowired
	private TimelineDAO dao;

	public int timeline_insert(TimelineDTO dto) {
		int successCnt = 0;
		successCnt = dao.timeline_insert(dto);
		
		return successCnt;
	}

	public List<TimelineDTO> timeline_list(String cate_no) {
		List<TimelineDTO> list = null;
		list = dao.timeline_list(cate_no);
		
		return list;
	}
	
	public int time_delete(String timeline_no) {
		int successCnt = 0;
		successCnt = dao.time_delete(timeline_no);
		
		return successCnt;
	}

	public int time_update(TimelineDTO dto) {
		int successCnt = 0;
		successCnt = dao.time_update(dto);
		
		return successCnt;
	}
	
	public List<TimelineDTO> timeline_maplist(String cate_no) {
		List<TimelineDTO> list = null;
		list = dao.timeline_maplist(cate_no);
		
		return list;
	}
	public List<TimelineDTO> searchList( SearchDTO dto ) {
		List<TimelineDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public List<MoneyDTO> selectMoneyList() {
		List<MoneyDTO> list = null;
		list = dao.selectMoneyList();
		
		return list;
	}

	public TimelineDTO time_select(String timeline_no) {
		TimelineDTO dto = new TimelineDTO();
		dto = dao.time_select(timeline_no);
		
		return dto;
	}
	
}
