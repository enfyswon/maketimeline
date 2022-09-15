package kr.co.mt.travel.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public List<TimelineDTO> timeline_maplist(String cate_no) {
		List<TimelineDTO> list = null;
		list = dao.timeline_maplist(cate_no);
		
		return list;
	}
	
}
