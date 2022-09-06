<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title> Join </title>
     
     <style type="text/css">
      h1 { 
      text-align : center; 
      }
      #buttons {
         text-align: right;
      }
      #join_btn {
         margin-right: 35%;
      }
      </style>
   </head>
   
   <body>
      <%@ include file="/WEB-INF/views/header.jsp" %>
      <br><br><br>
      <br><br><br>
      <br><br><br>
      
      <table class="table table-hover">
         <tbody>
         
            <tr>
               <th> 이메일 </th>
               <td>
                     <input type="text" id="email" name="email" maxlength="25" class="form-control"  placeholder="이메일 주소 입력 ">
                        <button id="email_btn" class="btn btn-secondary" > 중복 확인 </button>
                  <label for="email" id="email_label"></label>
               </td>
            </tr>
            <tr>
               <th> 비밀번호 </th>
               <td>
                  <input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control" placeholder="비밀번호 입력 ">
                  <label for="mpwd" id="mpwd_label"></label>
               </td>
            </tr>
            <tr>
            	 <th>  </th>
               <td>
                  <input type="password" id="rempwd" name="rempwd" maxlength="20" class="form-control" placeholder="비밀번호 확인 ">
                  <label for="rempwd" id="rempwd_label"></label>
               </td>
            </tr>
            <tr>
               <th> 닉네임 </th>
               <td>
                  <input type="text" id="mni" name="mni" maxlength="20" class="form-control" placeholder="닉네임 ">
                  <label for="mni" id="mni_label"></label>
               </td>
            </tr>
            <tr>
               <th> 핸드폰번호 </th>
               <td>
                     <input type="text" id="tel" name="tel" maxlength="11" class="form-control" placeholder="핸드폰 번호를 '-'없이 입력해주세요.">
                  <label for="tel" id="tel_label"></label>
               </td>
            </tr>
            
         </tbody>
      </table>
      <div class="clearfix" id="buttons">
         <button id="join_btn" class="btn btn-secondary float-right"> J O I N </button>
      </div>
      <br><br><br>
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
         
         if( $("#mpwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
            $("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
            $("#mpwd_label").css("color", "red");
            return;
         } else { $("#mpwd_label").text(""); }

         if( $("#mpwd").val() != $("#rempwd").val() ){
            $("#rempwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
            $("#rempwd_label").css("color", "red");
            return;
         } else { $("#rempwd_label").text(""); }

         if( $("#tel").val().match(onlyNum) == null  ){
            $("#tel_label").text("숫자만 허용 됩니다.");
            $("#tel_label").css("color", "red");
            return;
         } else { $("#tel_label").text(""); }


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
                     location.href="${pageContext.request.contextPath}/login/login_form";
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
         if( $("#email").val().match(onlyEmail) == null ){//허용되지 않은 글자는 null.
            $("#email_label").text("영문 대소문자와 숫자 . @만 허용 됩니다.");
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
         
   </script>
   </body>
</html>