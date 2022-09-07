package kr.co.mt.mypage;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mt.dto.MemberDTO;

@Controller
	@RequestMapping(value = "/mypage")
	public class MyPageController {
		private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
		
		@Autowired
		MyPageService service;
		
		@RequestMapping(value = "/mypage")
		public String mypage() throws Exception{
			return "/mypage/myprofile";
		}

		
		// 프로필 수정
		@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
		public String profileUpdate(@ModelAttribute MemberDTO member, HttpSession session, RedirectAttributes rttr) throws Exception{
			session.setAttribute("member", service.profileUpdate(member));
			rttr.addFlashAttribute("msg", "프로필 수정 완료");
			return "/mypage/myprofile";
		}

	// 회원정보 수정
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String infoUpdate(@ModelAttribute MemberDTO member, HttpSession session, RedirectAttributes rttr) throws Exception{
		session.setAttribute("member", service.infoUpdate(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "/mypage/myinfo";
	}
	
	
}
