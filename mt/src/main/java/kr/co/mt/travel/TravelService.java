package kr.co.mt.travel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.util.dto.RegionDTO;

@Service
public class TravelService {
	@Autowired
	private TravelDAO dao;

	public List<RegionDTO> regionList() {
		List<RegionDTO> list = null;
		list = dao.regionList();
		
		return list;
	}
	
}
