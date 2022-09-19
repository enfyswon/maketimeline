<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Make Timeline</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member-style.css"> 
   </head>
   
   <body>
   <%@ include file="/WEB-INF/views/header.jsp" %>
   		<main>
   			<div id="join-box">
   				<div class="join-input">
   					<p>
	   					<label for="email" class="input-label">이메일</label>
	                  	<label for="email" id="email_label" class="write_label"></label>
   					</p>
					<input type="text" id="email" name="email" class="join-email-input" maxlength="30" placeholder="이메일 주소 입력 ">
                    <button id="email_btn"> 중복 확인 </button>
   				</div>
   				<div class="join-input join-email">
   					<p>
	   					<label class="input-label">메일 본인 인증</label>
	                    <button id="email_ck"> 메일 발송 </button>
   					</p>
	                <script type="text/javascript">
	               	let email_cf = "";
	                $(document).ready(function() {
	                	$("#email_ck").click(function() {
	                    	if(checkedEMAIL == ""){
	                        	alert("먼저 중복 확인을 하세요.");
	                        	return;
	                        }
	                        let tmpyn = confirm(checkedEMAIL + "으로 인증 메일을 보내시게습니까?");
	                       	if( tmpyn == false ){
	                       		return;
	                       	}
	                       	
	                       	$.get(
	                       			"${pageContext.request.contextPath}/join/send"
	                       			, {
	                       				email : $("#email").val()
	                       			}
	                       			, function(data, status) {
	                       				alert(data.message);
	                       				email_cf = data.contents;
	                       			}
	                       			, "json"
	                       	);//get
	                    });//click
	                });//ready
	                </script>
   				</div>
   				<div class="join-input join-email">
   					<p>
	   					<label for="email2" class="input-label">인증 번호</label>
	                  	<label for="email2" id="email2_label" class="write_label"></label>
   					</p>
					<input type="text" id="email2" name="email2" class="join-email-input" placeholder="인증번호 입력 ">
                    <button id="email_ck2"> 인증번호 확인 </button>
                    <script type="text/javascript">
	                $(document).ready(function() {
	                    $("#email_ck2").click(function() {
	                       	if( $("#email2").val() == email_cf ){
	                       		alert("인증번호가 일치합니다.")
	                       	} else {
	                       		alert("인증번호가 일치하지않습니다.")
	                       		return;
	                       	}
	                    });//click
	                });//ready
	                </script>
   				</div>
   				<div class="join-input">
   					<p>
	   					<label for="mpwd" class="input-label">비밀번호</label>
	                  	<label for="mpwd" id="mpwd_label" class="write_label"></label>
   					</p>
					<input type="password" id="mpwd" name="mpwd" maxlength="20" placeholder="비밀번호 입력 ">
	                <input type="password" id="rempwd" name="rempwd" maxlength="20" placeholder="비밀번호 확인 ">
   				</div>
   				<div class="join-input">
   					<p>
	   					<label for="mni" class="input-label">닉네임</label>
	                  	<label for="mni" id="mni_label" class="write_label"></label>
   					</p>
					<input type="text" id="mni" name="mni" maxlength="20" placeholder="닉네임 입력 ">
   				</div>
   				<div class="join-input">
   					<p>
	   					<label for="tel" class="input-label">핸드폰 번호</label>
	                  	<label for="tel" id="tel_label" class="write_label"></label>
   					</p>
					<input type="text" id="tel" name="tel" maxlength="20" placeholder="핸드폰 번호를 '-'없이 입력해주세요.">
   				</div>
   				<div class="join-input" id="term-box">
					<input type="checkbox" id="selectAll" name="selectAll" onclick="selectAll(this)"> 필수 내용 모두 동의합니다.
					<hr>
					<input type="checkbox" name="terms" onclick="checkSelectAll()"> 만 14세 이상입니다. (필수)<br>
					<input type="checkbox" name="terms" onclick="checkSelectAll()"> 이용약관 필수 동의 (필수)<br>
					<input type="checkbox" name="terms" onclick="checkSelectAll()"> 개인정보 수집 및 이용 동의 (필수)
					<label id="terms_label"></label>
   				</div>
   				<div>
 	            	<button id="join_btn"> 회원 가입 </button>
   				</div>
   			</div>
   		</main>
   <script type="text/javascript">
   
   let checkedEMAIL = "";
   let onlyNum = /^[0-9]+$/;
   let engLowerAndNum = /^[a-z0-9]+$/;
   let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
   let onlyEmail = /^[a-zA-Z0-9.@]+$/;
   let onlyMni = /^[가-힣]+$/;

   $(document).ready(function() {
      $("#join_btn").click(function() {
        //alert( service_agree.checked );//javascript
         //alert( $("#service_agree").prop("checked") );//jquery

    	  if( checkedEMAIL == "" || checkedEMAIL != $("#email").val() ){
              $("#email_label").text("이메일을 확인해주세요.");
              $("#email_label").css("color", "red");
              return;
           } else { $("#email_label").text(""); }
         
    	  if( email_cf == "" || email_cf != $("#email2").val() ){
              $("#email_label2").text("인증번호를 확인해주세요.");
              $("#email_label2").css("color", "red");
              return;
           } else { $("#email_label2").text(""); }
         
         if( $("#mpwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
            $("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
            $("#mpwd_label").css("color", "red");
            return;
         } else { $("#mpwd_label").text(""); }

         if( $("#mpwd").val() != $("#rempwd").val() ){
            $("#mpwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
            $("#mpwd_label").css("color", "red");
            return;
         } else { $("#mpwd_label").text(""); }

         if( $("#tel").val().match(onlyNum) == null  ){
            $("#tel_label").text("숫자만 허용 됩니다.");
            $("#tel_label").css("color", "red");
            return;
         } else { $("#tel_label").text(""); }


		 if (!$("#selectAll").is(':checked')) {
			 $("#terms_label").text("필수 사항을 모두 체크해야합니다.");
			 $("#terms_label").css("color", "red");
			 return;
		 } else { $("#terms_label").text(""); }

         $.post(
               "${pageContext.request.contextPath}/join/"
               , {
                  email : $("#email").val()
                  , mpwd : $("#mpwd").val()
                  , mni : $("#mni").val()
                  , tel : $("#tel").val()
               }
               , function(data, status) {
                  if(data == 1){
                     alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
                     location.href="${pageContext.request.contextPath}/login";
                  } else {
                     alert("잠시 후 다시 시도해 주세요.");
                  }
               }//call back function
         );//post

      });//click
   });//ready

   $(document).ready(function() {
      $("#email_btn").click(function() {

         if( $.trim( $("#email").val() ) == "" ){
            return;
         }

//          if( $("#email").val().match(onlyEmail) == null ){//허용되지 않은 글자는 null.
//              $("#email_label").text("영문 대소문자와 숫자 . @만 허용 됩니다.");
//              $("#email_label").css("color", "red");
//              return;
//           } else { $("#email_label").text(""); }

         if( $("#email").val().includes(".") == false || $("#email").val().includes("@") == false ){//허용되지 않은 글자는 null.
             $("#email_label").text("이메일 형식이 올바르지 않습니다.");
             $("#email_label").css("color", "red");
             return;
          } else { $("#email_label").text(""); }

         $.get(
               "${pageContext.request.contextPath}/join/email_chk"
               , { email : $("#email").val() }
               , function(data, status) {
                  if(data == 0){
                     $("#email_label").text("사용 가능한 이메일 입니다.");
                     $("#email_label").css("color", "blue");
                     checkedEMAIL = $("#email").val();
                     
                     if ($(".join-email").is(":visible")) {
                    	 $(".join-email").hide();
                     } else {
                    	 email-$(".join-email").show();
                     }
                  } else if(data >= 1){
                     $("#email_label").text("이미 사용 중인 이메일 입니다.");
                     $("#email_label").css("color", "red");
                  } else {
                     alert("잠시 후 다시 시도해 주세요.");
                  }
               }//call back function
         );//get
      });//click
   });//ready
     
	function checkSelectAll()  {
		  const checkboxes 
		    = document.querySelectorAll('input[name="terms"]');
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="terms"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="selectAll"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  } else {
		    selectAll.checked = false;
		  }

		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('terms');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
		
   </script>
   </body>
</html>