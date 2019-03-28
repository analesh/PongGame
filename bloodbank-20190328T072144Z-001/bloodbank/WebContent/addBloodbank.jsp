<%@page import="com.bloodbank.blood.BloodDao"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDao"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>

<%@include file="navBar.html" %>


	<div style="width: 50%;margin-left: 25%;margin-top: 5%">
<form action="addbloodbankOtp.jsp" method="post">
<input class="field" type="text" name="bloodbank_name" placeholder="Enter Bloodbank name" required="required" >
<input class="field" type="text" name="reg_no" placeholder="Enter Registration no" required="required" >
<input class="field" type="text" name="login_id" placeholder="Enter Username" required="required" >
<input class="field" type="password" name="password" placeholder="Enter Password" required="required" >
<input class="field" type="text" name="mno" placeholder="Enter mobile no." required="required" >
<input class="field" type="email" name="email" placeholder="Enter email" required="required" >
<input class="field" type="text" name="country" placeholder="Enter country" required="required" >
<input class="field" type="text" name="state" placeholder="Enter state" required="required" >
<input class="field" type="text" name="city" placeholder="Enter city" required="required" >
<input class="field" type="text" name="address" placeholder="Enter address" required="required" >

<input class="field" type="submit"  name="submit" value="Add bloodbank">
</form>

</div>


<script src="js/index.js"></script>
</body>
</html>