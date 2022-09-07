package kr.co.mt.travel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.RegionDTO;

@Service
public class TravelService {
	@Autowired
	private TravelDAO dao;

	public List<RegionDTO> regionList() {
		List<RegionDTO> list = null;
		list = dao.regionList();
		
		return list;
	}

	public int cate_insert(CategoryDTO dto) {
		int successCnt = 0;
		successCnt = dao.cate_insert(dto);
		
		return successCnt;
	}

	public List<CategoryDTO> cateList(String mno) {
		List<CategoryDTO> list = null;
		list = dao.cateList(mno);
		
		return list;
	}
	
}
