<%@page import="com.bloodbank.blood.BloodDao"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDao"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDto"%>
<%
if(request.getMethod().equalsIgnoreCase("post")){
	if(request.getParameter("mno")!=null){
		%>
		<jsp:useBean id="dto" class="com.bloodbank.bloodbank.BloodbankDto"></jsp:useBean>			<!-- use bean/action tag of JSP to set all the requests -->
		<jsp:setProperty property="*" name="dto"/>												<!-- class specifies the class of which we need object-->
																	  <!-- dto is the reference where the object is to be stored; * set all the parameters -->
		<%
		session.setAttribute("dto",dto);
		int otp  = OTP.RandomOTP();
		OTP.MessageOTP(dto.getMno(),otp, dto.getLogin_id());
		
		%>
		
		<%@page import="com.bloodbank.utility.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forget Password</title>
<link rel="stylesheet" href="css/form.css">

</head>
<body>
<%@include file="navBar.html" %>

		<form action="addbloodbankOtp.jsp" method="post">
		
		
		
					<input type="hidden" name="otp1" value="<%=otp %>">
					<input type="text" name="otp" placeholder="Enter OTP" required>
					<input type="submit" name="otp_form" class="button" value="confirm_otp">
		
		
		</form>
</body>
</html>
		
		<%
	}else if(request.getParameter("otp")!=null){
		if(request.getParameter("otp").equalsIgnoreCase(request.getParameter("otp1"))){
			BloodbankDto dto = (BloodbankDto)session.getAttribute("dto");
			if(new BloodbankDao().addBloodbank(dto)){
				
				
				//////////////////////////////////////////////////////////////////
				int bloodbank_id = new BloodbankDao().loginBloodbank(dto.getLogin_id(), dto.getPassword());
				new BloodDao().addBlood(bloodbank_id);
				
				out.print("<script>alert('Successfully registered')</script>");
				session.removeAttribute("dto");
				request.getRequestDispatcher("login.jsp").include(request, response);
			}else{
				out.print("<script>alert('Phir se bhar')</script>");
			}
		}else{
			out.print("<script>alert('Enter correct OTP')</script>");
		}
	}else{
		response.sendRedirect("addBloodbank.jsp");
	}
}else{
	response.sendRedirect("addBloodbank.jsp");
}

%>