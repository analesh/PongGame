
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Integer id=(Integer)session.getAttribute("bloodbank_id");
if(id==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="css/sidebar.css" type="text/css">
</head>
<body>
<%@include file="sidebar.html" %>
                    
</body>

</html>
