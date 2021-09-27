<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	// 먼저 HttpSession에 값이 있다면 로그아웃이다!
	Object obj = session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	<style>
		.p-5{
			margin: 100px auto;
			width: 500px;
		}
		#text_area{
			width: 100%;
			text-align: center;
			margin: 10px 0;
		}
	</style>
</head>
<body>
<%
	if(obj == null){
%>
	 <div class="p-5">
	   <form action="login.jsp" method="post">
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4">HI ~!</h1>
        </div>
        
            <div class="form-group">
                <input type="email" class="form-control form-control-user" id="s_id" aria-describedby="emailHelp"
                    placeholder="아이디를 입력해주세요..." name="id">
            </div>
            <div class="form-group">
                <input type="password" class="form-control form-control-user"
                    id="s_pw" placeholder="비밀번호" name="pw">
            </div>
            <div class="form-group">
                <div class="custom-control custom-checkbox small">
                    <input type="checkbox" class="custom-control-input" id="customCheck">
                    <label class="custom-control-label" for="customCheck">Remember
                        Me</label>
                </div>
            </div>
		        <div id="button">
		        	<button id="login_btn" class="btn btn-primary btn-user btn-block" type="button">
		        	로그인</button>
		        	</form>
		        </div>   
        
        <hr>
    
    </div>
<%
	}else{// 널이 아니라면 값이 들어왔으니 uservo로 캐스팅 하자!
		UserVO uvo = (UserVO)obj;
%>
    
    <div id="logout_area" class="p-5">
    	 <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4">로그인 완료!</h1>
        </div>
        <div id="text_area">
        	<span><%=uvo.getU_name() %>(<%=uvo.getU_id()%>)환영</span>
        </div>
        <div id="logout_area">
	    	<button id="login_btn" class="btn btn-primary btn-user btn-block"onclick="javascript:location.href='Logout.jsp'">로그아웃</button>
	    	</form>
		</div>
    </div>
<%} %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#login_btn").bind("click",function(){
			var id = $("#s_id").val();
			var pw = $("#s_pw").val();
			if(id.trim().length <= 0){
				alert("아이디를 입력해주세요");
				$("#s_id").val("");
				$("#s_id").focus();
				return;
			}
			if(pw.trim().length <= 0){
				alert("비밀번호를 입력해주세요");
				$("#s_pw").val("");
				$("#s_pw").focus();
				return;
			}
			
			document.forms[0].submit();
		});
	});
</script>
</body>
</html>