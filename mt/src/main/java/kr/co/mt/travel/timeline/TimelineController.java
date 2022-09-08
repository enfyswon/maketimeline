package kr.co.mt.travel.timeline;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/timeline")
public class TimelineController {
	private final static Logger logger = LoggerFactory.getLogger(TimelineController.class);
	
	@Autowired
	private TimelineService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String timeline(String cate_no) {
		
		return "/travel/timeline/timeline";
	}

}
