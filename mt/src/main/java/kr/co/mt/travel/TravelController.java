package kr.co.mt.travel;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.mt.dto.RegionDTO;

@Controller
@RequestMapping(value = "/travel")
public class TravelController {
	private final static Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	private TravelService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list() {
		return "/travel/category_list";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String categoryAdd() {
		
		return "/travel/category_write";
	}
	
	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public void region(PrintWriter out) {
		List<RegionDTO> list = null;
		list = service.regionList();
		
		out.print( new Gson().toJson(list) );
		out.close();
	}
}
