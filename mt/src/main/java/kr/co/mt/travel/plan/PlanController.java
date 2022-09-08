package kr.co.mt.travel.plan;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mt.travel.category.CategoryDTO;
import kr.co.mt.travel.category.CategoryService;

@Controller
@RequestMapping(value = "/plan")
public class PlanController {
	private final static Logger logger = LoggerFactory.getLogger(PlanController.class);
	
	@Autowired
	private PlanService service;
	
	@Autowired
	private CategoryService cservice;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String plan(String cate_no, Model model) {
		CategoryDTO dto = new CategoryDTO();
		dto = cservice.cate_select(cate_no);
		model.addAttribute("category", dto);
		
		return "/travel/plan/plan";
	}
}
