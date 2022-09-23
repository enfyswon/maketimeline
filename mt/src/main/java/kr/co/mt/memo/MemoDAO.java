package kr.co.mt.memo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mt.dto.MemberDTO;

@Repository
public class MemoDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<MemoDTO> myRoomListByMno(String loginMno) {
		List<MemoDTO> list = null;
		list = sqlSession.selectList("MemoMapper.myRoomListByMno", loginMno);
		return list;
	}//myRoomListByMno

	public int insert(MemoDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("MemoMapper.insert", dto);
		System.out.println(successCount);
		return successCount;
	}//insert

	public List<MemoDTO> chatListByNo(MemoDTO dto) {
		List<MemoDTO> list = null;
		list = sqlSession.selectList("MemoMapper.chatListByNo", dto);
		return list;
	}//chatListByNo

	public MemoDTO roomInfoByNo(String room_no) {
		MemoDTO dto = null;
		dto = sqlSession.selectOne("MemoMapper.roomInfoByNo", room_no);
		return dto;
	}//roomInfoByNo

	public String getRoomNo(MemoDTO dto) {
		String roomNo = null;
		roomNo = sqlSession.selectOne("MemoMapper.getRoomNo", dto);
		return roomNo;
	}//getRoomNo

	public int createRoomNo(MemoDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("MemoMapper.createRoomNo", dto);
		return successCount;
	}//createRoomNo

	public int deleteChat( MemoDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("MemoMapper.deleteChat", dto);
		return successCount;
	}//deleteChat
	
	public int delete(  MemoDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("MemoMapper.delete", dto);
		return successCount;
	}//delete

	public int unreadCnt(MemoDTO dto) {
		int unread = 0;
		unread = sqlSession.selectOne("MemoMapper.unreadCnt", dto);
		
		return unread;
	}

	public MemberDTO otherMem(MemoDTO dto) {
		MemberDTO mdto = null;
		mdto = sqlSession.selectOne("MemoMapper.otherMem", dto);
		
		return mdto;
	}

	public String getPhoto(String mno) {
		String mpho_path = null;
		mpho_path = sqlSession.selectOne("MemoMapper.getPhoto", mno);
		
		return mpho_path;
	}

	public void updateChat(MemoDTO dto) {
		sqlSession.update("MemoMapper.updateChat", dto);
	}

	public String setRoomNo(MemoDTO dto) {
		String room_no = null;
		room_no = sqlSession.selectOne("MemoMapper.setRoomNo", dto);
		
		return room_no;
	}

	public String getName(String other_mno) {
		String other_mni = null;
		other_mni = sqlSession.selectOne("MemoMapper.getName", other_mno);
		
		return other_mni;
	}

}//class
