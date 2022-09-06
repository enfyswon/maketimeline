package kr.co.mt.travel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.util.dto.RegionDTO;

@Repository
public class TravelDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<RegionDTO> regionList() {
		List<RegionDTO> list = null;
		list = sqlSession.selectList("TravelMapper.regionList");
		
		return list;
	}
}
