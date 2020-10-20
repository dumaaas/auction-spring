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
	<title>User Profile</title>
	<!--============================================================================================================================================================================================================-->	
	<meta charset="UTF-8">	
	<!--============================================================================================================================================================================================================-->	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!--============================================================================================================================================================================================================-->	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!--============================================================================================================================================================================================================-->	
	<link rel="stylesheet" href="/css/auction2.css">
	<!--============================================================================================================================================================================================================-->
</head>
<body>
	<!--=====================================NEREGISTROVAN CLAN===========================================-->
	<c:if test="${u.role!=1 }">
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
		<br/><br/><br/>
		<center><a href="#" class="btn btn-warning">You are not allowed to see this page. Join us if you want to see more.</a></center>
		<br/>
		<center><a href="/auth/registracija" class="btn btn-outline-info">Register</a></center>
	</c:if>
	<!--=====================================================================================================-->

	<!--=======================================REGISTROVAN CLAN==============================================-->
	<c:if test="${u.role==1 }">
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
		<br/><br/>
		<div class="container emp-profile">
        	<form method="post">
            	<div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="/images/bid1.png" alt=""/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                        	<h5>
                            	${u.firstname } ${u.lastname }
                            </h5>
                            <div class="text-muted"><small>Joined: ${u.time }</small></div>                 
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                            	<li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>                           
                            </ul>
                        </div>
                    </div>
                    <c:if test="${u.idUser==user.idUser }">
		                    <div class="col-md-2">
		                        <a href="editProfile" class="btn btn-primary">Edit profile</a>
		                    </div>
		            </c:if>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>Last 5 auctions</p>
                            	<c:if test="${empty lastFive }">
                            		<a>Don't have any auction yet!</a>
                            	</c:if>
	                            <c:forEach items="${lastFive }" var="lf">
		                            <a href="/auction/advert?idProduct=${lf.idAdvert }">${lf.name }</a><br/>		                           
	                            </c:forEach>
                            <p>Ratings as seller</p>
                            <i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }<br/>
                            <i class="fas fa-frown"></i> : ${ratingOveralNegative }<br/>
                            <i class="fas fa-meh"></i> : ${ratingOveralNeutral }<br/>           
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            	<div class="row">
                    	            <div class="col-md-6">
             	                       <label>Username</label>
                                    </div>
                                    <div class="col-md-6">
              		                    <p>${u.username }</p>
                                    </div>
    	                    	</div>
                                <div class="row">
                     	        	<div class="col-md-6">
           		                    	<label>Email</label>
                                   	</div>
                                   	<div class="col-md-6">
         	                        	<p>${u.email }</p>
                                   	</div>
                                </div>
                                <div class="row">
                                	<div class="col-md-6">
                                    	<label>Phone number</label>
                                    </div>
                                    <div class="col-md-6">
                        	            <p>${u.phoneNumber }</p>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-6">
                          	        	<label>Country</label>
                                    </div>
	                       	        <div class="col-md-6">
	                                	<p>${u.country }</p>
	                                </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-6">
                                    	<label>City</label>
                                    </div>
                                    <div class="col-md-6">
                             	       <p>${u.city }</p>
                                    </div>
                                 </div>
                                 <div class="row">
                                 	<div class="col-md-6">
                                    	<label>Description</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>${u.description }</p>
                                    </div>
                                 </div>
              	         	</div>
                        </div>
                    </div>
                </div>   
            </form>           
        </div>
	</c:if>
</body>
</html>