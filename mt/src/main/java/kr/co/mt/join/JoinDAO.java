package kr.co.mt.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MemberDTO;

@Repository
public class JoinDAO {

	@Autowired
	private SqlSession sqlSession;

	public int join( MemberDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("JoinMapper.join", dto);
		return successCount;
	}//join

	public int emailCheck( String email ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("JoinMapper.emailCheck", email);
		return isYN;
	}//emailCheck
}//class
