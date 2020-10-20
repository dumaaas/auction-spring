<!--===============================================================================-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--===============================================================================-->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!--===============================================================================-->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!--===============================================================================-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--===============================================================================-->
<!DOCTYPE html>
<html>
<head>
	<!--===============================================================================================-->		
	<title>Login</title>
	<!--===============================================================================================-->		
	<meta charset="UTF-8">	
	<!--===============================================================================================-->		
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!--===============================================================================================-->	
		<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/css/util.css">
		<link rel="stylesheet" type="text/css" href="/css/main.css">
	<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/images/bid1.png');">	
			<div class=" p-t-30 p-b-50">			
				<c:if test="${wrongUsernameOrPassword=='wrongUsernameOrPassword' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Wrong username or password!
						</p>			
					</div>
				</c:if>			
				<form action="login" method="post" class="login100-form validate-form p-b-33 p-t-5">
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100">
						<input class="input100" type="password" name="password" placeholder="Password" required>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Login
						</button>
					</div>				
					<span class="login100-form-title p-b-41">
						<a href="registracija">Don't have an account? Register now!</a>
					</span>					
				</form>				
			</div>		
		</div>	
	</div>
	<div id="dropDownSelect1"></div>
	<!--==========================================================-->
	<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--==========================================================-->
	<script src="/vendor/animsition/js/animsition.min.js"></script>
	<!--==========================================================-->
	<script src="/vendor/bootstrap/js/popper.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--==========================================================-->
	<script src="/vendor/select2/select2.min.js"></script>
	<!--==========================================================-->
	<script src="/vendor/daterangepicker/moment.min.js"></script>
	<!--==========================================================-->
	<script src="/vendor/daterangepicker/daterangepicker.js"></script>
	<!--==========================================================-->
	<script src="/vendor/countdowntime/countdowntime.js"></script>
	<!--==========================================================-->
	<script src="/js/main.js"></script>
	<!--==========================================================-->
</body>
</html>