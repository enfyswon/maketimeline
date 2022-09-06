package kr.co.mt.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
	@RequestMapping(value = "/mypage")
	public class MyPageController {
		private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
		
		@Autowired
		MyPageService service;

	
}
