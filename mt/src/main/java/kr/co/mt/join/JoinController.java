package kr.co.mt.join;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mt.dto.MemberDTO;

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
	
	@RequestMapping( value = "/email_chk", method = RequestMethod.GET )
	public void emailCheck( String email, PrintWriter out ) {
		int isYN = 0;
		isYN = service.emailCheck( email );
		out.print(isYN);
		out.close();
	}//emailCheck


	@RequestMapping( value = "", method = RequestMethod.GET )
	public String joinForm() {
		return "/join/join_form";//jsp file name
	}//joinForm

}//class

/*
drop table member;

create table member (
  mno int not null auto_increment,
  mni varchar(100) not null,
  mpwd varchar(255) not null,
  tel varchar(100) default null,
  email varchar(255) default null,
  mpho varchar(100) default null,
  mpho_path varchar(255) default null,
  mdes varchar(255) default null,
  primary key (mno)
);

*/
