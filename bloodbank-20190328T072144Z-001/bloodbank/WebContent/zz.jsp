<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/login1.css">
</head>
<body>

	 <%@include file="navBar.html" %>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" method="post" action="BloodbankLoginController">
					<span class="login100-form-title">OTP</span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Please enter username">
						<input class="input100" type="text" name="login_id"
							placeholder="login id"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Please enter password">
						<input class="input100" type="password" name="password"
							placeholder="password"> <span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1"> Forgot </span> <a href="resetPassword.jsp" class="txt2">
							Username / Password? </a>
					</div>

					<div class="container-login100-form-btn">
					
					
					<button class="login100-form-btn">Sign in</button>
					
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9"> Don’t have an account? </span>
						 <a href="addBloodbank.jsp" class="txt3"> Sign up now </a>
					</div>
				</form>
			</div>
		</div>
	</div>












	<script src="js/index.js"></script>
</body>
</html>