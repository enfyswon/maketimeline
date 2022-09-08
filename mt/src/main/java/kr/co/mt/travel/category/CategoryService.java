package kr.co.mt.travel.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.RegionDTO;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDAO dao;
	
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

	public int cate_delete(String cate_no) {
		int successCnt = 0;
		successCnt = dao.cate_delete(cate_no);
		
		return successCnt;
	}

	public CategoryDTO cate_select(String cate_no) {
		CategoryDTO dto = new CategoryDTO();
		dto = dao.cate_select(cate_no);
		
		return dto;
	}

	public int cate_update(CategoryDTO dto) {
		int successCnt = 0;
		successCnt = dao.cate_update(dto);
		
		return successCnt;
	}
}
