package kr.co.mt.mypage;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mt.dto.MemberDTO;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);



	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list( Model model, HttpSession session ) {

		return "mypage/list";
	}//list

}//class
