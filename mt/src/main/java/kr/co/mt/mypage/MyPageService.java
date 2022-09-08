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
	
	public int info_update(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.info_update(dto);
		return updateYN;
	}

	public Object profile_update(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.profile_update(dto);
		return updateYN;
	}

	public MemberDTO myprofile(String mno) {
		MemberDTO dto=dao.myprofile(mno);
		return dto;
	}
	
}
