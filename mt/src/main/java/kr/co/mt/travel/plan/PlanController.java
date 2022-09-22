package kr.co.mt.travel.plan;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.mt.dto.MemberDTO;
import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.test.KoreaDTO;
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
	
	@RequestMapping(value = "/calc", method = RequestMethod.GET)
	public String money(String cate_no, Model model) {
		CategoryDTO dto = new CategoryDTO();
		dto = cservice.cate_select(cate_no);

		model.addAttribute("category", dto);
		
		return "/travel/plan/money";
	}
	
	@RequestMapping(value = "/dateUpdate", method = RequestMethod.POST)
	public void dateUpdate(PlanDTO dto, PrintWriter out) {
		int successCnt = 0;
		successCnt = service.dateUpdate(dto);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete(String plan_no, PrintWriter out) {
		int successCnt = 0;
		successCnt = service.delete(plan_no);
		
		out.print(successCnt);
		out.close();
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(PlanDTO dto, PrintWriter out) {
		int successCnt = 0;
		successCnt = service.update(dto);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/money", method = RequestMethod.GET)
	public void money(PrintWriter out) {
		List<MoneyDTO> list = null;
		list = service.selectMoneyList();
		
		out.print(new Gson().toJson(list));
		out.close();
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void planList(String cate_no, PrintWriter out) {
		List<PlanDTO> list = null;
		list = service.planList(cate_no);
		
		out.print(new Gson().toJson(list));
		out.close();
	}//list
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String plan(String cate_no, Model model) {
		CategoryDTO dto = new CategoryDTO();
		dto = cservice.cate_select(cate_no);
		
		List<KoreaDTO> list = null;
		list = service.tourlist();

		model.addAttribute("category", dto);
		model.addAttribute("list", list);
		
		return "/travel/plan/plan";
	}//travel/plan
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String plan_add(String cate_no, Model model) {
		
		model.addAttribute("cate_no", cate_no);
		
		return "/travel/plan/add";
	}//travel/add
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	
	public void insert( PlanDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.insert( dto );
		out.print(successCount);
		out.close();
	}//insert
}//class
