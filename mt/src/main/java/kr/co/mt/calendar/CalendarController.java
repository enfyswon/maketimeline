package kr.co.mt.calendar;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "/calendar" )
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@Autowired
	private CalendarService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String calendarMain(CalendarDTO dto, Model model) {

		String userWantMonth = "";
	      if( dto != null
	              && dto.getThis_year() != null && !dto.getThis_year().equals( "" )
	              && dto.getThis_month() != null && !dto.getThis_month().equals( "" ) ) {
			userWantMonth = dto.getThis_year() + "-" + dto.getThis_month() + "-01";
		} else {
			Date today = new Date();
			DateFormat monthFormat = new SimpleDateFormat("YYYY-MM-01");
			userWantMonth = monthFormat.format(today);
		}

		dto = service.dateInfo(userWantMonth);
		model.addAttribute("date_info", dto);

		return "calendar/main";//jsp file name

	}//calendarMain

}//class
