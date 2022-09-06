package kr.co.mt.travel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/travel")
public class TravelController {
	private final static Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	private TravelService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list() {
		return "/travel/list";
	}
}
