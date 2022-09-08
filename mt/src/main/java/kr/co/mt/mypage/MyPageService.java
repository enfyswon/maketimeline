package kr.co.mt.mypage;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.MemberDTO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.infoUpdate(dto);
		return updateYN;
	}

	public Object profileUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.profileUpdate(dto);
		return updateYN;
	}
	
}
