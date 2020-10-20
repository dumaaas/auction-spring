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
	<title>Registration</title>
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
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/css/main.css">
	<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/images/bid1.png');">
			<div class="wrap-login100 p-t-30 p-b-50">				
				<c:if test="${userExist=='userExist' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							User with this username already exist!
						</p>			
					</div>
				</c:if>				
				<c:if test="${shortPassword=='shortPassword' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Password must have at least 6 characters!
						</p>			
					</div>
				</c:if>				
				<c:if test="${shortUsername=='shortUsername' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Username must have at least 6 characters!
						</p>			
					</div>
				</c:if>				
				<c:if test="${doesntMatch=='doesntMatch' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Password doesn't match!
						</p>			
					</div>
				</c:if>			
				<c:if test="${notValidEmail=='notValidEmail' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							Email is not valid!
						</p>			
					</div>
				</c:if>		
				<c:if test="${emailExist=='emailExist' }">
					<div class="alert alert-danger">
						<p class="text text-center">
							User with this email already exist!
						</p>			
					</div>
				</c:if>							
				<form action="registration" method="post" class="login100-form validate-form p-b-33 p-t-5">
					${errors }
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="firstname" placeholder="Firstname" required >
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>					
					<div class="wrap-input100 validate-input" data-validate = "Enter lastname">
						<input class="input100" type="text" name="lastname" placeholder="Lastname" required>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>				
					<div class="wrap-input100 validate-input" data-validate = "Enter email">
						<input class="input100" type="text" name="email" placeholder="Email" required>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>				
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password" required>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>				
					<div class="wrap-input100 validate-input" data-validate="Confirm password">
						<input class="input100" type="password" name="password2" placeholder="Confirm password" required>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>									
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Register
						</button>
					</div>				
					<span class="login100-form-title p-b-41">
						<a href="userLogin">Already have an account? Login now!</a>
					</span>					
				</form>			
			</div>		
		</div>	
	</div>	
	<div id="dropDownSelect1"></div>
	<!--=========================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--=========================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--=========================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--=========================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--=========================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<!--=========================================================-->
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--=========================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--=========================================================-->
	<script src="js/main.js"></script>
</body>
</html>