<%@page import="com.bloodbank.order.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="css/table.css" type="text/css">
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>


<%@include file="navBar.html" %>
<%
if(request.getMethod().equalsIgnoreCase("post")){
	if(request.getParameter("submit")!=null){
		%>
		<jsp:useBean id="dto" class="com.bloodbank.order.OrderDto"></jsp:useBean>			<!-- use bean/action tag of JSP to set all the requests -->
		<jsp:setProperty property="*" name="dto"/>												<!-- class specifies the class of which we need object-->
																	  <!-- dto is the reference where the object is to be stored; * set all the parameters -->
		<%
		dto.setPrice(Integer.parseInt(request.getParameter("quantity"))*Integer.parseInt(request.getParameter("cost")));
		if (new OrderDao().addOrder(dto)){
		    
		 response.sendRedirect("reciept.jsp");
		session.setAttribute("price", dto.getPrice());
		session.setAttribute("quantity",dto.getQuantity());
		}else{
			out.print("OHHH fuck");

		}
	}
}
%>
	<div style="width: 50%;margin-left: 25%;margin-top: 5%">
<form action="orderInfo.jsp" method="post">
<input class="field" type="text" name="quantity" placeholder="Enter quantity" required="required" >

<input class="field" type="hidden" name="cost" value="<%= session.getAttribute("cost")%>">
<input class="field" type="hidden" name="bloodbank_id" value="<%=session.getAttribute("bloodbank_id")%>" >
<input class="field" type="hidden" name="patient_id" value="<%=session.getAttribute("patient_id") %>" >
<input class="field" type="hidden" name="blood_group" value="<%=session.getAttribute("blood_group")%>">

<input class="field" type="submit" name="submit" value="Place Order" >


</form>

</div>


<script src="js/index.js"></script>
</body>
</html>