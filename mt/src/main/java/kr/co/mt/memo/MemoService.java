package kr.co.mt.memo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemoService {

	@Autowired
	private MemoDAO dao;

	public List<MemoDTO> myRoomListByMno(String loginMno) {
		List<MemoDTO> list = null;
		list = dao.myRoomListByMno( loginMno );
		return list;
	}//myRoomListByMno

	public int insert( MemoDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

	public List<MemoDTO> chatListByNo(String room_no) {
		List<MemoDTO> list = null;
		list = dao.chatListByNo( room_no );
		return list;
	}//chatListByNo

	public MemoDTO roomInfoByNo(String room_no) {
		MemoDTO dto = null;
		dto = dao.roomInfoByNo( room_no );
		return dto;
	}//roomInfoByNo

	public String getRoomNo(MemoDTO dto) {
		String roomNo = null;
		roomNo = dao.getRoomNo(dto);

		if(roomNo == null) {
			int successCnt = 0;
			successCnt = dao.createRoomNo(dto);
			if(successCnt == 0) roomNo = "0";
			else roomNo = dto.getRoom_no();
		}
		return roomNo;
	}//getRoomNo

	public int delete( MemoDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		successCount = dao.deleteChat( dto );
		return successCount;
	}//delete
	

}//class
