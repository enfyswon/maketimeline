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
	public String myprofile(HttpSession session) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		int successCount = 0;
		successCount = service.myprofile(mDto.getMno());
		out.
		return "/mypage/myprofile";
	}

	// 프로필 수정
	@RequestMapping(value = "/profile_update", method = RequestMethod.GET)
	public String profileUpdate(@ModelAttribute MemberDTO member, HttpSession session, RedirectAttributes rttr) throws Exception{
		return "/mypage/myprofile_up";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/info_update", method = RequestMethod.GET)
	   public String infoUpdate(@ModelAttribute MemberDTO member, HttpSession session, PrintWriter out) throws IOException {
	      return "/mypage/myinfo_up";
	   }

}
