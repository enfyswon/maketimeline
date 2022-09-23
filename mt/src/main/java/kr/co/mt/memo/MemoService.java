package kr.co.mt.memo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mt.dto.MemberDTO;


@Service
public class MemoService {

	@Autowired
	private MemoDAO dao;

	public List<MemoDTO> myRoomListByMno(String loginMno) {
		List<MemoDTO> list = null;
		list = dao.myRoomListByMno( loginMno );
		
		for (MemoDTO dto : list) {
			dto.setMno(loginMno);
			int unread = dao.unreadCnt(dto);
			MemberDTO mdto = new MemberDTO();
			mdto = dao.otherMem(dto);
			dto.setUnread(unread);
			dto.setOther_mno(mdto.getMno());
			dto.setOther_mni(mdto.getMni());
			dto.setMpho_path(mdto.getMpho_path());
		}
		
		return list;
	}//myRoomListByMno

	public int insert( MemoDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

	public List<MemoDTO> chatListByNo(MemoDTO dto) {
		List<MemoDTO> list = null;
		list = dao.chatListByNo( dto );
		
		if (list.size() > 0) {
			dao.updateChat(dto);
		}
		
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
System.out.println(roomNo);
		if(roomNo == null) {
			int successCnt = 0;
			successCnt = dao.createRoomNo(dto);
			if(successCnt == 0) roomNo = "0";
			else roomNo = dto.getRoom_no();
System.out.println(successCnt);
System.out.println(roomNo);
		}
		return roomNo;
	}//getRoomNo

	public int delete( MemoDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		successCount = dao.deleteChat( dto );
		return successCount;
	}//delete

	public String getPhoto(String mno) {
		String mpho_path = null;
		mpho_path = dao.getPhoto(mno);
		
		return mpho_path;
	}
	

}//class
