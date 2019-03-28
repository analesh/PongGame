<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
Integer id=(Integer)session.getAttribute("bloodbank_id");
if(id==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/sidebar.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<%@include file="sidebar.html" %>
</body>
</html>