package kr.co.mt.join;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mt.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/join" )
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;

	@RequestMapping( value = "/", method = RequestMethod.POST )
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join

	@RequestMapping( value = "/id_chk", method = RequestMethod.GET )
	public void idCheck( String mid, PrintWriter out ) {
		int isYN = 0;
		isYN = service.idCheck( mid );
		out.print(isYN);
		out.close();
	}//idCheck

	@RequestMapping( value = "/form", method = RequestMethod.GET )
	public String joinForm() {
		return "/join/join_form";//jsp file name
	}//joinForm

}//class

/*
drop table member;

CREATE TABLE `member` (
  `mem_no` int NOT NULL AUTO_INCREMENT,
  `mem_nick` varchar(100) NOT NULL,
  `mem_email` varchar(255) NOT NULL,
  `mem_pwd` varchar(255) NOT NULL,
  `pnum` varchar(100) NOT NULL,
  `mem_photo` varchar(100) DEFAULT NULL,
  `mem_photopath` varchar(255) DEFAULT NULL,
  `mem_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mem_no`)
);
*/
