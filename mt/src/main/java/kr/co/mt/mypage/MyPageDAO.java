package kr.co.mt.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
		
	public int info_update(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.info_update", dto);
		return updateYN;
	}

	public int profile_update(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.profile_update", dto);
		return updateYN;
	}

	public MemberDTO myprofile(String email) {
		MemberDTO dto=sqlSession.selectOne("MyPageMapper.myProfile", email);
		return dto;
	}

	public int delete(String mno) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.delete", mno);
		return updateYN;
	}

}
