package kr.co.mt.mypage;

	import java.util.List;

	import org.apache.ibatis.session.SqlSession;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;

	@Repository
	public class MyPageDAO {
		
		@Autowired
		SqlSession sqlSession;

		public void updateSellerYN(String mem_no) {
			sqlSession.update("MyPageMapper.updateSellerYN", mem_no);
		}

	
}
