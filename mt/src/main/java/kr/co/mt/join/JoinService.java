package kr.co.mt.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.util.dto.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO dao;

	public int join( MemberDTO dto ) {
		int successCount = 0;

		

		successCount = dao.join( dto );
		return successCount;
	}//join

	public int emailCheck( String email ) {
		int isYN = 0;
		isYN = dao.emailCheck( email );
		return isYN;
	}//emailCheck

}//class
