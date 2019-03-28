

<%
if(request.getMethod().equalsIgnoreCase("post")){
	BloodDto dto  = new BloodDto();
	dto.setBg_id(Integer.parseInt(request.getParameter("bg_id")));
	dto.setQuantity(Integer.parseInt(request.getParameter("quantity")));
	dto.setCost(Integer.parseInt(request.getParameter("cost")));

    if(new BloodDao().updateBlood(dto)){
    	out.print("<script><alert>updated</alert></script>");
    	
    	
    }
    else{
    	out.print("<script><alert>Not updated</alert></script>");

    }
  response.sendRedirect("updateBlood.jsp");
}else{
	%>
	

<%@page import="java.util.ArrayList"%>

<%@page import="com.bloodbank.blood.BloodDao" %>
<%@page import="com.bloodbank.blood.BloodDto" %>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/sidebar.css" type="text/css">
<link rel="stylesheet" href="css/table.css" type="text/css">

<title>Insert title here</title>

</head>
<body>
<%@include file="sidebar.html" %>
<%
if(request.getMethod().equalsIgnoreCase("post")){ %>
<jsp:useBean id="dto" class="com.bloodbank.blood.BloodDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%}%>


<div  style="overflow-x:auto;">
<table>
   <tr align="center" border="2" cellpadding="3">
    <th>S.no</th>
    <th>Blood Type</th>
    <th>Quantity/Unit</th>
    <th>Price/unit</th>
    <th>Update</th>
  </tr>
  <%
ArrayList<BloodDto> al = new BloodDao().getAllBlood((int)session.getAttribute("bloodbank_id"));
if(al != null) {
	int s = 0;
	for(BloodDto dto : al) {
	
	
	%>
	<form action="updateBlood.jsp" method="post">
  <tr>
  <input type="hidden" name="bg_id" value="<%=dto.getBg_id() %>">
  <td><%=++s %></td>
  <td><%=dto.getBlood_group() %></td>
<td><input type="text" name="quantity" value="<%=dto.getQuantity() %>"></td>
<td><input type="text" name="cost" value="<%=dto.getCost() %>"></td>
 <td><input type="submit" value="update"></td>
  </tr>
 </form>
 <%}}	else {
		response.sendRedirect("updateBlood.jsp");
 }
 %>


</table>
</div>
</form>

</body>
</html>
	<%
}
%>
