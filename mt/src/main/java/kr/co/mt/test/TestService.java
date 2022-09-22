package kr.co.mt.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	
	@Autowired
	private TestDAO dao;
	
	public int insert(List<KoreaDTO> list) {
		int successCnt = 0;
		successCnt = dao.insert(list);
		
		return successCnt;
		
	}//insert
}//class
