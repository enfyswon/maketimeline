package kr.co.mt.travel.money;

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
import kr.co.mt.travel.money.MoneyDTO;
import kr.co.mt.travel.plan.PlanDTO;
import kr.co.mt.travel.plan.PlanService;

@Controller
@RequestMapping(value = "/money")
public class MoneyController {
	private final static Logger logger = LoggerFactory.getLogger(MoneyController.class);
	
	@Autowired
	private MoneyService service;
	
	@Autowired
	private PlanService pservice;
	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String moneyList( HttpSession session, Model model ) {

		String loginMno = ( (MemberDTO) session.getAttribute("login_info") ).getMno();

		List<MoneyDTO> list = null;
		list = service.MoneyListByMno(loginMno);
		model.addAttribute("money_list", list);

		return "money/money_list";//jsp file name
	}//myRoomList
		
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String plan(String plan_no, Model model) {
		PlanDTO dto = new PlanDTO();
		dto = pservice.plan_select(plan_no);
		model.addAttribute("plan", dto);
		
		return "/travel/money/money";
	}//travel/plan
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String plan_add(String plan_no, Model model) {
		model.addAttribute("plan_no", plan_no);
		
		return "/travel/money/money";
	}//
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	
	public void insert( MoneyDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.insert( dto );
		out.print(successCount);
		out.close();
	}//insert
}//class
