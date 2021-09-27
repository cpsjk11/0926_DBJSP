<%@page import="Service.FactoryService"%>
<%@page import="vo.UserVO"%>

<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    // 여기는 파라미터로 값을 받아 DB와 연결을 한 후 HttpSession에 넣어두자!
    	
    	//요청시 한글처리
    	request.setCharacterEncoding("utf-8");
    	
    	// 파라미터를 통해 값을 얻어내자!
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	// 이제 받아온 값을 맵 구조에 담아 DB와 연결하자!
    	Map<String,String> map = new HashMap<String,String>();
    	map.put("u_id", id);
    	map.put("u_pw", pw);
    	
    	// 이제 맵을 준비를 완료 했다 DB연결 시작!
    	SqlSession ss = FactoryService.getFacTory().openSession();
    	
    	UserVO vo = ss.selectOne("user.login",map);
    	
    	if(vo != null){
			//세션에 저장
    		session.setAttribute("user", vo);
    		//페이지 강제 이동
    		response.sendRedirect("Main.jsp");
		
		}else{
			response.sendRedirect("Main.jsp");
		}
	
%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
</body>
</html>