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
	<title>Edit Profile</title>
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
	<link rel="stylesheet" href="/css/editProfile.css">
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
			<div class="container">
			<div class="row flex-lg-nowrap">  
			  <div class="col">
			    <div class="row">
			      <div class="col mb-3">
			        <div class="card">
			          <div class="card-body">
			            <div class="e-profile">
			              <div class="row">
			                <div class="col-12 col-sm-auto mb-3">
			                  <div class="mx-auto" style="width: 140px;">
			                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">                
		                            <img src="/images/bid1.png" height="140" width="140" alt="Profile photo"/>                         
			                    </div>
			                  </div>
			                </div>
			                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
			                  <div class="text-center text-sm-left mb-2 mb-sm-0">
			                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${user.firstname } ${user.lastname }</h4>
			                    <p class="mb-0">@${user.username }</p>                 
			                    <div class="mt-2">
			                       <a href="userProfile" class="btn btn-primary">
						                <i class="fa fa-sign-out"></i>
						                <span>Back to profile</span>
						           </a>
			                    </div>
			                  </div>
			                  <div class="text-center text-sm-right">
			                    <span class="badge badge-secondary">user</span>
			                    <div class="text-muted"><small>Joined: ${user.time }</small></div>
			                  </div>
			                </div>
			              </div>
			              <ul class="nav nav-tabs">
			                <li class="nav-item"><a href="" class="active nav-link">Edit profile</a></li>
			              </ul>
			              <div class="tab-content pt-3">
			                <div class="tab-pane active">
			                  <form action="backToProfile" method="post" class="form">
			                    <div class="row">
			                      <div class="col">
			                      <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>Username</label>
			                              <input class="form-control" type="text" name="username" value="${user.username }" placeholder="${user.username }">
			                            </div>
			                          </div>
			                        </div>
			                        <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>Email</label>
			                              <input class="form-control" type="text" name="email" value="${user.email }" placeholder="${user.email }">
			                            </div>
			                          </div>
			                        </div>
			                        <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>Country</label>
			                              <input class="form-control" type="text" name="country" value="${user.country }" placeholder="${user.country }">
			                            </div>
			                          </div>
			                          <div class="col">
			                            <div class="form-group">
			                              <label>City</label>
			                              <input class="form-control" type="text" name="city" value="${user.city }" placeholder="${user.city }">
			                            </div>
			                          </div>
			                        </div>                        
			                        <div class="row">
			                          <div class="col mb-3">
			                            <div class="form-group">
			                              <label>Description</label>
			                              <input class="form-control" rows="5" name="description" value="${user.description }" placeholder="${user.description }"></textarea>
			                            </div>
			                          </div>
			                        </div>
			                      </div>
			                    </div>
			                    <div class="row">
			                      <div class="col-12 col-sm-6 mb-3">
			                        <div class="mb-2"><b>Change Password</b></div>                      
			                        <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>New Password</label>
			                              <input class="form-control" name="password" type="password" value="${user.password }" placeholder="${user.password }">
			                            </div>
			                          </div>
			                        </div>
			                        <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>Confirm Password <span class="d-none d-xl-inline">Password</span></label>
			                              <input class="form-control" type="password" name="password2" value="${user.password2 }" placeholder="${user.password2 }"></div>
			                          </div>
			                        </div>
			                      </div>
			                      <div class="col-12 col-sm-5 offset-sm-1 mb-3">
			                        <div class="mb-2"><b>Keeping in Touch</b></div>
			                        <div class="row">
			                          <div class="col">
			                            <div class="form-group">
			                              <label>Phone number</label>
			                              <input class="form-control" type="text" name="phoneNumber" value="${user.phoneNumber }" placeholder="${user.phoneNumber }">
			                            </div>
			                          </div>
			                        </div>
			                      </div>
			                    </div>
			                    <div class="row">
			                      <div class="col d-flex justify-content-end">
			                        <button class="btn btn-primary" type="submit">Save Changes</button>
			                      </div>
			                    </div>
			                  </form>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>	
			  </div>
			</div>
		</div>
	</c:if>
</body>
</html>