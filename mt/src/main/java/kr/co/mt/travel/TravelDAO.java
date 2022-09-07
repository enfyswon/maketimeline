package kr.co.mt.travel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.RegionDTO;

@Repository
public class TravelDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<RegionDTO> regionList() {
		List<RegionDTO> list = null;
		list = sqlSession.selectList("TravelMapper.regionList");
		
		return list;
	}

	public int cate_insert(CategoryDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("TravelMapper.cateInsert", dto);
		
		return successCnt;
	}

	public List<CategoryDTO> cateList(String mno) {
		List<CategoryDTO> list = null;
		list = sqlSession.selectList("TravelMapper.cateList", mno);
		
		return list;
	}

	public int cate_delete(String cate_no) {
		int successCnt = 0;
		successCnt = sqlSession.delete("TravelMapper.cateDelete", cate_no);
		
		return successCnt;
	}
}
