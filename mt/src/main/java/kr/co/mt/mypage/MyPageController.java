
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
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService service;
	
	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public String myprofile(HttpSession session, Model model) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		MemberDTO dto=service.myprofile(mDto.getMno());
		model.addAttribute("pf", dto);
		return "/mypage/myprofile";
	}
	// 프로필 수정
	@RequestMapping(value = "/profile_update", method = RequestMethod.GET)
	public String profile_update(HttpSession session, Model model) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		MemberDTO dto=service.myprofile(mDto.getMno());
		model.addAttribute("pf", dto);
		return "/mypage/myprofile_up";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/info_update", method = RequestMethod.GET)
	   public String info_update(HttpSession session, Model model) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		MemberDTO dto=service.myprofile(mDto.getMno());
		model.addAttribute("pf", dto);
	      return "/mypage/myinfo_up";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
		
		public void infoUpdate( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
			
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
				dto.setMpho(profile.getOriginalFilename());
				dto.setMpho_path("/upload/user/" + mno + "_" + profile.getOriginalFilename());
			}
			int updateYn = 0;
			dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
			updateYn = service.info_update(dto);
			System.out.println(dto.toString());
			out.print(updateYn);
			out.close();
		}

}//class
