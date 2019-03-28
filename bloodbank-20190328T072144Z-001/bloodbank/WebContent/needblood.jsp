<%@page import="com.bloodbank.blood.BloodDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bloodbank.blood.BloodDao"%>

	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="css/table.css" type="text/css">

	</head>
	<body>
	<%@include file="navBar.html" %>
	<form action="needblood.jsp" method="post">
	<select name="blood type">
		<option>Select Blood Group</option>
	 <option value="A+">A+</option>
	<option value="B+">B+</option>
	<option value="AB+">AB+</option>
	<option value="O+">O+</option>
	<option value="O-">O-</option>
	</select>
	<input type="submit" value="show bloodbank" name="show bloodbank">
	</form>
<%

if(request.getParameter("show bloodbank")!=null){
	%>
	<div  style="overflow-x:auto;">
	<table>
	   <tr align="center" border="2" cellpadding="3">
	    <th>S.no</th>
	        <th>Blood Bank Name</th>
	    <th>Quantity/Unit</th>
	    <th>Price/unit</th>
	    <th>Buy</th>
	  </tr>
	  <%
	  BloodDao dao = new BloodDao();
	ArrayList<BloodDto> al = dao.getAllBlood(request.getParameter("blood type"));
	if(al != null) {
		int s = 0;
		for(BloodDto dto : al) {
		
		%>
	  <tr>  
	  
	  <td><%=++s %></td>
	  <td><%=dto.getBloodbank_name() %></td>
	  
	  <td><%=dto.getQuantity() %></td>
	  <td><%=dto.getCost() %></td>
	  
	  <td>
	  <form action="patientInfo.jsp" method="post">
	  <input type="hidden" value="<%=dto.getBg_id()%>" name="bg_id">
	  	  <input type="hidden" value="<%=dto.getBloodbank_id()%>" name="bloodbank_id">
	  	  <input type="hidden" value="<%=dto.getBlood_group()%>" name="blood_group">
	  	  	  	  <input type="hidden" value="<%=dto.getCost()%>" name="cost">
	  	  
	  <input type="submit" name="Buy" value="Buy">
	  
	  </form>
	  </td>
	  </tr>
	 <%}}	else {
		out.print("not available");
	 }}%>


	</table>
	</div>
	<script src="js/index.js"></script>
	</body>
	</html>

