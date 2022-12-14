package kr.co.mt.mypage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mt.dto.MemberDTO;

@Controller
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService service;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String myprofile(String email, HttpSession session, Model model) {
		MemberDTO dto=service.myprofile(email);
		model.addAttribute("pf", dto);
		return "/mypage/myprofile";
	}

	// 프로필 수정
	@RequestMapping(value = "/profile_update", method = RequestMethod.GET)
	public String profile_update(HttpSession session, Model model) {
		String email = ((MemberDTO) session.getAttribute("login_info")).getEmail();
		MemberDTO dto = new MemberDTO(); 
		dto = service.myprofile(email);

		model.addAttribute("pf", dto);

		return "/mypage/myprofile_up";
	}
	
	@RequestMapping(value = "/profile_update", method = RequestMethod.POST)
	public void profile_update( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
		
		String mno = ((MemberDTO) session.getAttribute("login_info")).getMno();
		File newFolder = new File("C:/upload/user/" + mno + "/");
		System.out.println(1111);
		if( newFolder.exists() == false ) newFolder.mkdirs();
		InputStream is = null;
		FileOutputStream fos = null;
		MultipartFile profile = dto.getProfile();
		System.out.println(2222);
		if (profile != null && !profile.getOriginalFilename().equals("")) {
			is = profile.getInputStream();
			fos = new FileOutputStream("C:/upload/user/" + mno + "_" + profile.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setMpho(profile.getOriginalFilename());
			dto.setMpho_path("/upload/user/" + mno + "_" + profile.getOriginalFilename());
		}
		System.out.println(3333);
		int updateYn = 0;
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		updateYn = service.profile_update(dto);
		System.out.println(dto.toString());
		out.print(updateYn);
		out.close();
	}
	
	//프로필 사진 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	   public void delete(PrintWriter out, HttpSession session) {
		String mno = ((MemberDTO)session.getAttribute("login_info")).getMno();
		int updateYn = 0;
		updateYn = service.delete(mno);
		out.print(updateYn);
		out.close();
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/info_update", method = RequestMethod.GET)
	   public String info_update(HttpSession session, Model model) {
		String email = ((MemberDTO) session.getAttribute("login_info")).getEmail();
		MemberDTO dto = new MemberDTO(); 
		dto = service.myprofile(email);
		
		model.addAttribute("pf", dto);
	    
		return "/mypage/myinfo_up";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
		public void info_update( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
			
			String mno = ((MemberDTO) session.getAttribute("login_info")).getMno();
			File newFolder = new File("C:/upload/user/" + mno + "/");
			
			if( newFolder.exists() == false ) newFolder.mkdirs();
			InputStream is = null;
			FileOutputStream fos = null;
			MultipartFile profile = dto.getProfile();
			
			if (profile != null && !profile.getOriginalFilename().equals("")) {
				is = profile.getInputStream();
				fos = new FileOutputStream("C:/upload/user/" + mno + "_" + profile.getOriginalFilename() );
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}
			int updateYn = 0;
			dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
			updateYn = service.info_update(dto);
			System.out.println(dto.toString());
			out.print(updateYn);
			out.close();
		}

}
