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
	<title>My Ratings</title>
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
	<link rel="stylesheet" href="/css/rating2.css">
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
			<form action="myRatings" method="post">
				<select class="form-control" name="idUser"> 
						<c:forEach items="${users }" var="u">
							<option value="${u.idUser }">${u.firstname} ${u.lastname }</option>
						</c:forEach>
				</select>
				<br/>
				<button class="form-control btn btn-primary" type="submit" value="Show">Show</button>
				<br/>
			</form>
		</div>
		<br/> 
		<c:if test="${!empty myRatings }">
			<div class="filter card text-white bg-dark mb-3 ">
				<div class="card-header"><center>My ratings (as buyer)</center></div>
				<table class="table table-dark">
					<thead>
						<tr>
					    	<th scope="col">User</th>
					        <th scope="col">Product</th>
					        <th scope="col">Rating</th>
					   	</tr>
					</thead>
					<tbody>
						<c:forEach items="${myRatings}" var="r">
							<c:if test="${user.idUser==r.user.idUser }">
				 	  			<c:if test="${!empty r.rateBuyer }">
					    			<tr>
								    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${r.advert.user.idUser }">${r.advert.user.firstname } ${r.advert.user.lastname }</a></td>
								      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
					      				<c:if test="${r.rateBuyer=='POSITIVE'}">
					      					<td style="color: #4A8938;">${r.rateBuyer }</td>
					      				</c:if>
					      				<c:if test="${r.rateBuyer=='NEGATIVE'}">
					      					<td style="color: #CA4633;">${r.rateBuyer }</td>
					      				</c:if>
									    <c:if test="${r.rateBuyer=='NEUTRAL'}">
									    <td style="color: #E0A818;">${r.rateBuyer }</td>
									    </c:if>
					   				</tr>
					  			</c:if>
					  		</c:if>
					  	</c:forEach>
					</tbody>
				</table>
				<a href="" class="btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive2 }<br/></a>
				<a href="" class="btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative2 }<br/></a>
				<a href="" class="btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral2 }<br/> </a>
			</div>
			<br/>
			<div class="filter card text-white bg-dark mb-3 ">
				<div class="card-header"><center>My ratings (as seller)</center></div>
				<table class="table table-dark">
					<thead>
						<tr>
					    	<th scope="col">User</th>
					      	<th scope="col">Product</th>
					      	<th scope="col">Rating</th>
					    </tr>
					</thead>
					<tbody>
				 		<c:forEach items="${myRatings}" var="r">
				 	  		<c:forEach items="${offers }" var="o">
				 				<c:if test="${r.advert.idAdvert ==o.advert.idAdvert}">
				 					<c:if test="${user.idUser == r.advert.user.idUser }">
				 						<c:if test="${!empty r.rateSeller }">
					    					<tr>
										    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${o.user.idUser }">${o.user.firstname } ${o.user.lastname }</a></td>
										        <td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
					      						<c:if test="${r.rateSeller=='POSITIVE'}">
					      							<td style="color: #4A8938;">${r.rateSeller }</td>
											     </c:if>
											     <c:if test="${r.rateSeller=='NEGATIVE'}">
											     	<td style="color: #CA4633;">${r.rateSeller }</td>
											     </c:if>
											     <c:if test="${r.rateSeller=='NEUTRAL'}">
											     	<td style="color: #E0A818;">${r.rateSeller }</td>
											     </c:if>
											</tr>
					  					</c:if>
					  				</c:if>
					  			</c:if>
					  		</c:forEach>
					  	</c:forEach>
					</tbody>
				</table>
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }</a>
				<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative }</a>
				<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral }</a>
			</div>
		</c:if>	
		<c:if test="${!empty u }">
			<div class="filter card text-white bg-dark mb-3 ">	
				<div class="card-header"><center>${u.firstname } ${u.lastname } ratings (as buyer)</center></div>
				<table class="table table-dark">
					<thead>
				    	<tr>
				      		<th scope="col">User</th>
				      		<th scope="col">Product</th>
				      		<th scope="col">Rating</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${ratings}" var="r">
				  			<c:forEach items="${users }" var="u"> 	
			 	  				<c:if test="${u.idUser==r.user.idUser }">
			 	  					<c:if test="${!empty r.rateBuyer }">
									    <tr>
									    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${r.advert.user.idUser }">${r.advert.user.firstname } ${r.advert.user.lastname }</a></td>
									      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
									       	<c:if test="${r.rateBuyer=='POSITIVE'}">
									      		<td style="color: #4A8938;">${r.rateBuyer }</td>
									      	</c:if>
									      	<c:if test="${r.rateBuyer=='NEGATIVE'}">
									      		<td style="color: #CA4633;">${r.rateBuyer }</td>
									      	</c:if>
									      	<c:if test="${r.rateBuyer=='NEUTRAL'}">
									      		<td style="color: #E0A818;">${r.rateBuyer }</td>
									      	</c:if>
									    </tr>
				  					</c:if>
				  				</c:if>
				  			</c:forEach>
				 		</c:forEach>
				  	</tbody>
				</table>
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive2 }<br/></a>
			 	<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative2 }<br/></a>
			 	<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral2 }<br/> </a>
			</div>
			<br/>				
			<div class="filter card text-white bg-dark mb-3 ">	
				<div class="card-header"><center>${u.firstname } ${u.lastname } ratings (as seller)</center></div>
				<table class="table table-dark">
			 		<thead>
						<tr>
					    	<th scope="col">User</th>
					      	<th scope="col">Product</th>
					      	<th scope="col">Rating</th>
					    </tr>
					</thead>
					<tbody>
				 		<c:forEach items="${ratings}" var="r">
				 			<c:forEach items="${finalno }" var="o">
				 				<c:if test="${r.advert.idAdvert ==o.advert.idAdvert}">
				 					<c:if test="${r.user.idUser == r.advert.user.idUser }">
				 						<c:if test="${!empty r.rateSeller }">
					    				<tr>
									    	<td><a class="isDisabled" href="/auction/myProfile2?idUser=${o.user.idUser }">${o.user.firstname } ${o.user.lastname }</a></td>
									      	<td><a class="isDisabled" href="advert?idProduct=${r.advert.idAdvert }">'${r.advert.name}'</a></td>
									      	<c:if test="${r.rateSeller=='POSITIVE'}">
									      		<td style="color: #4A8938;">${r.rateSeller }</td>
									      	</c:if>
									     	<c:if test="${r.rateSeller=='NEGATIVE'}">
									      		<td style="color: #CA4633;">${r.rateSeller }</td>
									      	</c:if>
									      	<c:if test="${r.rateSeller=='NEUTRAL'}">
									      		<td style="color: #E0A818;">${r.rateSeller }</td>
									      	</c:if>				    
									    </tr>
					  					</c:if>
					  				</c:if>
					  			</c:if>
					 	 	</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				<a href="" class="form-control btn btn-success"><i class="fas fa-smile-beam"></i> : ${ratingOveralPositive }</a>
			 	<a href="" class="form-control btn btn-danger"><i class="fas fa-frown"></i> : ${ratingOveralNegative }</a>
			 	<a href="" class="form-control btn btn-warning"><i class="fas fa-meh"></i> : ${ratingOveralNeutral }</a>				
			</div>
		</c:if>
	</c:if>
</body>
</html>