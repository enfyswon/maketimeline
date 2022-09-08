package kr.co.mt.travel.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.RegionDTO;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<RegionDTO> regionList() {
		List<RegionDTO> list = null;
		list = sqlSession.selectList("CategoryMapper.regionList");
		
		return list;
	}

	public int cate_insert(CategoryDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("CategoryMapper.cateInsert", dto);
		
		return successCnt;
	}

	public List<CategoryDTO> cateList(String mno) {
		List<CategoryDTO> list = null;
		list = sqlSession.selectList("CategoryMapper.cateList", mno);
		
		return list;
	}

	public int cate_delete(String cate_no) {
		int successCnt = 0;
		successCnt = sqlSession.delete("CategoryMapper.cateDelete", cate_no);
		
		return successCnt;
	}

	public CategoryDTO cate_select(String cate_no) {
		CategoryDTO dto = new CategoryDTO();
		dto = sqlSession.selectOne("CategoryMapper.cateSelect", cate_no);
		
		return dto;
	}

	public int cate_update(CategoryDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("CategoryMapper.cateUpdate", dto);
		
		return successCnt;
	}
}
