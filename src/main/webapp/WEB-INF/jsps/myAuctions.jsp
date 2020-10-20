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
	<title>My Auctions</title>
	<!--============================================================================================================================================================================================================-->	
	<meta charset="UTF-8">	
	<!--============================================================================================================================================================================================================-->	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">		
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
	<link rel="stylesheet" href="/css/welcome.css">
	<!--============================================================================================================================================================================================================-->	
</head>
<body>
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
		<br/><br/><br/><br/>	  
		<div class="filtriranje">
			<form action="showAdvertsActiveClosed" method="post">
				<select class="form-control" name="isActive"> 
					<option value="1">Active</option>
	   				<option value="0">Closed</option>
				</select>
				<br/>
				<button class="form-control btn btn-primary" type="submit" value="Show">Show</button>
				<br/>
			</form>
			<br/>
			<a class="form-control btn btn-outline-warning" href="/auction/closedAuctionsReport "><i class="fas fas fa-file-pdf">&nbsp;&nbsp;Report [closed auctions]</i></a>
		</div>
		<br/> 
		<c:if test="${!empty adverts}">
			<div class="card-columns">
				<c:forEach items="${adverts }" var="a">
					<div class="card text-white bg-dark mb-3 ">
						<c:if test="${a.isActive==1 }">
							<div class="card-header"><a href="#" class="form-control btn btn-outline-success">ACTIVE</a></div>
							<div class="card-header"><a class="isDisabled" href="advert?idProduct=${a.idAdvert }"><center>${a.name } <br/> </center></a> </div>
				  			<div class="card-body">
						   		<p class="card-header">Starting prize: ${a.startingPrice } $</p>
						   		<p class="card-header">Description: ${a.description }</p>
						   		<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
						   		<a href="advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Check your auction!</a>
							</div>
							<div class="card-footer">
	    						<small class="text-muted">Posted at: ${a.time }</small>
	   						</div>
						</c:if>
						<c:if test="${a.isActive==0 }">
							<div class="card-header"><a href="#" class="form-control btn btn-outline-danger">CLOSED</a></div>
							<div class="card-header"><a class="isDisabled" href="advert?idProduct=${a.idAdvert }"><center>${a.name } <br/> </center></a> </div>
						  	<div class="card-body">
						   		<p class="card-header">Starting prize: ${a.startingPrice } $</p>
							 	<p class="card-header">Saled for: ${a.currentPrice } $</p>
							  	<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
							  	<c:forEach items="${buyer }" var="b">
							  		<c:if test="${a.idAdvert == b.advert.idAdvert }">
										<p class="card-header">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${b.user.idUser }">${b.user.firstname} ${b.user.lastname }</a></p>
									</c:if>
								</c:forEach>
								<c:if test="${empty a.ratingBuyer }">
									<p class="form-control btn btn-success">CONGRATULATIONS. You selled product!</p>
									<a href="advert?idProduct=${a.idAdvert }" class="form-control btn btn-danger">Please rate buyer!</a>
								</c:if>
								<c:if test="${!empty a.ratingBuyer }">
									<a href="" class="form-control btn btn-success">You already gave your rate</a>
								</c:if>
							</div>
							<div class="card-footer">
			    				 <small class="text-muted">Closed at: ${a.time }</small>
			   				</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</c:if>
</body>
</html>