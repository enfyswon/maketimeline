package kr.co.mt.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
		
	
	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.infoUpdate", dto);
		
		return updateYN;
	}

	public int profileUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.profileUpdate", dto);
		
		return updateYN;
	}
	
	public int completeCnt(String mno) {
		int completeCnt = 0;
		completeCnt = sqlSession.selectOne("MyPageMapper.completeCnt", mno);
		
		return completeCnt;
	}
}
