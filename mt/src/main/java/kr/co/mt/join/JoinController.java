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

create table member (
  mno int not null auto_increment,
  mid varchar(20) not null,
  mpwd varchar(20) not null,
  tel varchar(15) default null,
  email varchar(50) default null,
  mdate datetime not null,
  service_agree varchar(5) not null default 'true',
  info_agree varchar(5) not null default 'true',
  sms_agree varchar(5) not null default 'false',
  email_agree varchar(5) not null default 'false',
  post_code varchar(10) default null,
  addr1 varchar(150) default null,
  addr2 varchar(150) default null,
  primary key (mno)
);
*/
