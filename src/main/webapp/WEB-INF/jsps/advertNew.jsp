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
	<!--============================================================================================================================================================================================================-->	
	<title>Your new advert</title>
	<!--============================================================================================================================================================================================================-->	
	<meta charset="UTF-8">
	<!--============================================================================================================================================================================================================-->		
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="/css/auction.css">
	<!--============================================================================================================================================================================================================-->	
</head>
<body>
	<!--=====================================NEREGISTROVAN CLAN============================================-->
	<c:if test="${user.role!=1 }">
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/auction/welcome">
		  		<img src="/images/hammer.png" width="30" height="30" class="d-inline-block align-top" alt="">    									Let's bid!
		  	</a> 
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		  		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		    		<li class="nav-item active">		        
		        		<a class="nav-link" href="welcome">Home <span class="sr-only">(current)</span></a>
			  		</li>		  	
		    	</ul>	    
		    	<form class="form-inline my-2 my-lg-0">
	      			<a href="/auth/userLogin" class="btn btn-outline-success">Login</a>
	    		</form>
	   	   		&nbsp &nbsp   
	   	    	<form class="form-inline my-2 my-lg-0">
		      		<a href="/auth/registracija" class="btn btn-outline-info">Register</a>
		    	</form>  	
	  	  	</div>
		</nav>
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!--=====================================================================================================-->
	
	<!--=======================================REGISTROVAN CLAN==============================================-->
	<c:if test="${user.role==1 }">
		<!--=====================================NEREGISTROVAN CLAN===========================================-->
	<c:if test="${user.role!=1 }">
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/auction/welcome">
		  		<img src="/images/hammer.png" width="30" height="30" class="d-inline-block align-top" alt="">    									Let's bid!
		  	</a> 
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		  		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		    		<li class="nav-item active">		        
		        		<a class="nav-link" href="welcome">Home <span class="sr-only">(current)</span></a>
			  		</li>		  	
		    	</ul>	    
		    	<form class="form-inline my-2 my-lg-0">
	      			<a href="/auth/userLogin" class="btn btn-outline-success">Login</a>
	    		</form>
	   	   		&nbsp &nbsp   
	   	    	<form class="form-inline my-2 my-lg-0">
		      		<a href="/auth/registracija" class="btn btn-outline-info">Register</a>
		    	</form>  	
	  	  	</div>
		</nav>
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!--=====================================================================================================-->

	<!--=======================================REGISTROVAN CLAN==============================================-->
	<c:if test="${user.role==1 }">
  		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
	  		<a class="navbar-brand" href="/auction/welcome">
	  			<img src="/images/hammer.png" width="30" height="30" class="d-inline-block align-top" alt="">
	    		Let's bid!
	  		</a>
	  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">	
			  	<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			    	<li class="nav-item active">		        
			      		<a class="nav-link" href="/auction/welcome">Home <span class="sr-only">(current)</span></a>
				  	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/addAuction">Add auction</a>
			      	</li>
			     	<li class="nav-item">
			        	<a class="nav-link" href="/auction/myProfile">My profile</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/myAuctions">My auctions</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="showRatings">My ratings</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="/auction/showAdvertsBids">My bids</a>
			      	</li>
			      	<li class="nav-item">
				        	<a class="nav-link" href="/auction/allUsers">All users</a>
				    </li>
			    </ul>
		   	    <form class="form-inline my-2 my-lg-0">
		      		<a href="/auth/logout" class="btn btn-outline-danger">Logout</a>
		    	</form>
  	  		</div>
		</nav>
	</c:if>	
		<br/><br/><br/><br/>
		<div class="card text-white bg-dark mb-3 ">
			<img class="card-img-top" src="/images/bid1.png" alt="Card image cap" width="30" height="140">
			<div class="card-header"><a href="#" class="form-control btn btn-outline-success">ACTIVE</a></div>
			<div class="card-header"><center>${newAdvert.name } <br/> <small>${newAdvert.time }</center></small></div>
			<div class="card-body">
			 	<p class="card-header">Starting prize: ${newAdvert.startingPrice } $</p>
			 	<p class="card-header">Current prize: ${newAdvert.currentPrice } $</p>
			  	<p class="card-header">Description: ${newAdvert.description }</p>
			  	<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${newAdvert.user.idUser }">${newAdvert.user.firstname } ${newAdvert.user.lastname }</a></p>
			  	<p class="card-header">Owner description: ${newAdvert.user.description }</p>
			  	<p class="card-header">Country: ${newAdvert.user.country }</p>
			  	<p class="card-header">Town: ${newAdvert.user.city }</p>
			  	<p class="card-header">Phone number: ${newAdvert.user.phoneNumber }</p>
			  	<br/>
			  	<p class="form-control btn btn-success">${success }</p>				
			</div>
		</div>
	</c:if>
</body>
</html>