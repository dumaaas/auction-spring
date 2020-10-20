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
	<title>Home</title>
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
		  		<img src="/images/hammer.png" width="30" height="30" class="d-inline-block align-top" alt="">   
		  		Let's bid!
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
		<div class="filtriranje">	
			<form action="/auction/showAdverts" method="post">
				<select class="form-control" name="advertCategory"> 
					<c:forEach items="${advertCategories }" var="ac">
						<option value="${ac.idAdvertCategory }">${ac.category}</option>
					</c:forEach>
				</select>	
				<br/>		
				<button class="form-control btn btn-primary" type="submit" value="Show">Show</button>				
				<br/>	
			</form>
			<br/>
			<c:if test="${user.role==1 }">
				<a class="form-control btn btn-outline-warning" href="/auction/activeAdvertReport "><i class="fas fas fa-file-pdf">&nbsp;&nbsp;Report [active auctions]</i></a>
			</c:if>
		</div>
		<br/>    
		<c:if test="${!empty adverts}">	
			<div class="card-columns">		
				<c:forEach items="${adverts }" var="a">
					<div class="card text-white bg-dark mb-3 ">	
						<c:if test="${a.isActive==1 }">
							<div class="card-header"><a href="#" class="form-control btn btn-outline-success">ACTIVE</a></div>
							<div class="card-header"><center>${a.name }</center> </div>
						  	<div class="card-body">					
						   		<p class="card-header">Starting prize: ${a.startingPrice } $</p>						   		
						   		<p class="card-header">Description: ${a.description }</p>						   		
						   		<c:if test="${user.role==1}">
						   			<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
								</c:if>					
								<c:if test="${user.role!=1}">
						   			<p class="card-header">Owner: ${a.user.firstname } ${a.user.lastname }</p>
								</c:if>										   		
						   		<br/>		   		
						   		<c:if test="${user.idUser!=a.user.idUser }"> 
						   			<a href="/auction/advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Bid now!</a>
						   		</c:if>		   		
						   		<c:if test="${user.idUser==a.user.idUser }"> 
						   			<a href="/auction/advert?idProduct=${a.idAdvert }" class="form-control btn btn-primary">Check your auction!</a>
						   		</c:if>
							</div>		
							<div class="card-footer">
			    				 <small class="text-muted">Posted at: ${a.time }</small>
			   				</div>	
						</c:if>	
						<c:if test="${a.isActive==0 }">		
							<div class="card-header"><a href="#" class="form-control btn btn-outline-danger">CLOSED</a></div>						
							<div class="card-header"><center> ${a.name }</center></div>					  	
						  	<div class="card-body">				   		
						   		<p class="card-header">Starting prize: ${a.startingPrice } $</p>						 	
							 	<p class="card-header">Saled for: ${a.currentPrice } $</p>						  	
							  	<c:if test="${user.role==1}">
						   			<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${a.user.idUser }">${a.user.firstname } ${a.user.lastname }</a></p>
								</c:if>								
								<c:if test="${user.role!=1}">
						   			<p class="card-header">Owner: ${a.user.firstname } ${a.user.lastname }</p>
								</c:if>						  
								<c:forEach items="${offers }" var="b">			  	
								  	<c:if test="${a.idAdvert == b.advert.idAdvert }">
								  		<c:if test="${user.role==1}">
											<p class="card-header">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${b.user.idUser }">${b.user.firstname} ${b.user.lastname }</a></p>
										</c:if>			
									</c:if>							
									<c:if test="${a.idAdvert == b.advert.idAdvert }">
								  		<c:if test="${user.role!=1}">
											<p class="card-header">Buyer: ${b.user.firstname} ${b.user.lastname }</p>
										</c:if>			
									</c:if>											
									<c:if test="${a.idAdvert == b.advert.idAdvert }">							
										<c:if test="${b.user.idUser == user.idUser }">
											<p class="form-control btn btn-success">CONGRATULATIONS. You won auction!</p>
										</c:if>								
										<c:if test="${a.user.idUser == user.idUser}">
											<p class="form-control btn btn-success">CONGRATULATIONS. You selled product!</p>
										</c:if>
									
										<c:if test="${b.user.idUser != user.idUser && a.user.idUser != user.idUser  }">
											<p class="form-control btn btn-warning">You missed this one. Better luck next time!</p>
										</c:if>							
									</c:if>								
								</c:forEach>
								<br/>						
							</div>
							<div class="card-footer">
			    				 <small class="text-muted">Closed at: ${a.time }</small>
			   				</div>			   				
						</c:if>	
					</div>
				</c:forEach>
			</div>
		</c:if>
</body>
</html>