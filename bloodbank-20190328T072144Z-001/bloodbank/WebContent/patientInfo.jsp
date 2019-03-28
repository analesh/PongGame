<%@page import="com.bloodbank.blood.BloodDto"%>
<%@page import="com.bloodbank.blood.BloodDao"%>
<%@page import="com.bloodbank.order.OrderDao"%>
<%@page import="com.bloodbank.patient.PatientDao"%>
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
	if("Next".equalsIgnoreCase(request.getParameter("submit"))){
		%>
		<jsp:useBean id="dto" class="com.bloodbank.patient.PatientDto"></jsp:useBean>			<!-- use bean/action tag of JSP to set all the requests -->
		<jsp:setProperty property="*" name="dto"/>												<!-- class specifies the class of which we need object-->
																	  <!-- dto is the reference where the object is to be stored; * set all the parameters -->
		<%
		
		//
		PatientDao dao = new PatientDao();
		if (dao.addPatient(dto)){
		int patient_id = dao.getPatientId(request.getParameter("mno"), request.getParameter("name"));
			session.setAttribute("patient_id", patient_id);
			session.setAttribute("bg_id",request.getParameter("bg_id"));
		
			
			session.setAttribute("cost",request.getParameter("cost"));
			response.sendRedirect("orderInfo.jsp");
		}else{
			out.print("<script>alert('Failed to add patient')</script>");
		}
	}
}
%>
<%
	  session.setAttribute("bloodbank_id",Integer.parseInt(request.getParameter("bloodbank_id")));
	  session.setAttribute("blood_group", request.getParameter("blood_group"));
	  session.setAttribute("bg_id", Integer.parseInt(request.getParameter("bg_id")));
%>	
		<div style="width: 50%;margin-left: 25%;margin-top: 5%">
<form action="patientInfo.jsp" method="post">
<input class="field" type="hidden" name="cost" value="<%=request.getParameter("cost")%>" >
<input class="field" type="hidden" name="bg_id" value="<%=request.getParameter("bg_id")%>" >
<input class="field" type="hidden" name="bloodbank_id" value="<%=session.getAttribute("bloodbank_id")%>" >
<input class="field" type="hidden" name="blood_group" value="<%=session.getAttribute("blood_group")%>" >
<input class="field" type="text" name="name" placeholder="Enter Patient name" required="required" >
<input class="field" type="radio" name="gender" value="male" checked="checked" >male
<input class="field" type="radio" name="gender" value="female" >female<br>
<input class="field" type="text" name="dob" placeholder="Enter Date of birth" required="required" >
<input class="field" type="text" name="mno" placeholder="Enter mobile no." required="required" >
<input class="field" type="text" name="hospital" placeholder="Enter hospital" required="required" >
<input class="field" type="text" name="address" placeholder="Enter address" required="required" >
<input class="field" type="submit" value="Next" name="submit">
</form>
</div>
<script src="js/index.js"></script>
</body>
</html>