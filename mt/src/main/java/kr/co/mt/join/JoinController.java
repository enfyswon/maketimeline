package kr.co.mt.join;

import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;

import kr.co.mt.dto.MemberDTO;

@Controller
@RequestMapping( value = "/join" )
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public void gMailSend(String email, Model model, PrintWriter out) {

		String resultOfGMailSend = "";

		try {
			//인증 번호 만들기 시작
			String [] upperCase = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"
					, "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"
					, "U", "V", "W", "X", "Y", "Z"};//26개
			String [] lowerCase = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"
					, "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"
					, "u", "v", "w", "x", "y", "z"};//26개//소문자 변경 : crtl + shift + y

			String tmpPwd = "";
			for(int i = 1; i <= 3; i++) {
				tmpPwd = tmpPwd + upperCase[ (int)(Math.random() * 26) ];
				tmpPwd = tmpPwd + (int)(Math.random() * 10);
				tmpPwd = tmpPwd + lowerCase[ (int)(Math.random() * 26) ];
			}//for - 3번 수행 => 임시비번은 12자
			//인증 번호 만들기 끝

			//스프링 메일 전송 시작
			String setFrom = "maketimeline0@gmail.com";//보내는 사람 이메일 주소
			String toMail = email;//"wldud__0104@naver.com";//받는 사람 이메일 주소
			String mailTitle = "[MakeTimeline]이메일 인증 번호";//메일 제목
			String contents = tmpPwd;

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setFrom);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(mailTitle);
			messageHelper.setText(contents);

			mailSender.send(message);//보낼 때 주석 풀고, root-context에 비번 설정할 것.

			resultOfGMailSend = toMail + "으로 메일이 발송 되었습니다.";

			JsonObject obj = new JsonObject();
			obj.addProperty("message", resultOfGMailSend);
			obj.addProperty("contents", contents);
			out.print(obj.toString());

		} catch( MessagingException e ) {
			logger.info("메일 전송 에러 start ==========");
			e.printStackTrace();
			logger.info("메일 전송 에러 end ==========");
			resultOfGMailSend = "메일 발송이 실패 하였습니다.";
		}
		//스프링 메일 전송 끝

	}//mailSend

	@RequestMapping( value = "/email_chk", method = RequestMethod.GET )
	public void emailCheck( String email, PrintWriter out ) {
		int isYN = 0;
		isYN = service.emailCheck( email );
		out.print(isYN);
		out.close();
	}//emailCheck

	@RequestMapping( value = "/", method = RequestMethod.POST )
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join

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
