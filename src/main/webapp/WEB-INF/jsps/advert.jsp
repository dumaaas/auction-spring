<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Advert</title>
	<meta charset="UTF-8">
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
	<!--==================================================================================================-->
	  
    <!--===================================NEREGISTROVAN CLAN=============================================-->
	<c:if test="${user.role!=1}">
		<div class="card text-white bg-dark mb-3 ">
			<img class="card-img-top" src="/images/bid1.png" alt="Card image cap" width="30" height="140">
			<div class="card-header"><center>${advert.name } <br/> <small>${advert.time }</center></small> </div>
			<div class="card-body">
			 	<p class="card-header">Starting prize: ${advert.startingPrice } $</p>
			 	<p class="card-header">Current prize: <a class="card-text" href="/auth/registracija">Join us to see :)</a></p>
			  	<p class="card-header">Description: ${advert.description }</p>
			  	<p class="card-header">Owner: ${advert.user.firstname } ${advert.user.lastname }</p>
			  	<p class="card-header">Owner description: ${advert.user.description }</p>
			  	<p class="card-header">Country: ${advert.user.country }</p>
			  	<p class="card-header">Town: ${advert.user.city }</p>
			  	<p class="card-header">Phone number: ${advert.user.phoneNumber }</p>
			  	
			  	<br/>
				<p class="card-text"><center>Last bids:</center></p>
				<c:if test="${empty offers }">
					<p class="card-text"><center>Noone bid on this product. Be first one!</center></p>
				</c:if>
				<c:if test="${!empty offers }">
					<c:forEach items="${offers }" var="o">
						<div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
						  <div class="card-header"><center>${o.user.firstname } ${o.user.lastname }</center></div>
						  <div class="card-body">
						    <p class="card-title"><center>${o.price } $</center></p>
						    <p class="card-text"><center><small>${o.time }</small></center></p>
						  </div>
						</div>
					
						<br/>
					</c:forEach>
				</c:if>
				<div class="alert alert-primary" role="alert">
 				 	<a class="card-text" href="/auth/registracija"><center>If you want to bid, join us!</center></a>
				</div>
			</div>
		</div>
	</c:if>
	<!--==================================================================================================-->
	  
    <!--=============================REGISTROVAN CLAN (OTVORENA AUKCIJA)==================================-->
	<c:if test="${user.role==1 }">
	<c:if test="${advert.isActive==1 }">
		<div class="card text-white bg-dark mb-3 ">
			<img class="card-img-top" src="/images/bid1.png" alt="Card image cap" width="30" height="140">
			<div class="card-header"><a href="closeBid?idProduct=${advert.idAdvert }" class="form-control btn btn-outline-success">ACTIVE</a></div>
			<div class="card-header"><center>${advert.name } <br/> <small>${advert.time }</small> </center> </div>
			<div class="card-body">
			 	<p class="card-header">Starting prize: ${advert.startingPrice } $</p>
			 	<p class="card-header">Current prize: ${advert.currentPrice } $</p>
			  	<p class="card-header">Description: ${advert.description }</p>
			  	<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${advert.user.idUser }">${advert.user.firstname } ${advert.user.lastname } </a></p>
			  	<p class="card-header">Owner description: ${advert.user.description }</p>
			  	<p class="card-header">Country: ${advert.user.country }</p>
			  	<p class="card-header">Town: ${advert.user.city }</p>
			  	<p class="card-header">Phone number: ${advert.user.phoneNumber }</p>
			  	<br/>
			  	<p class="card-text"><center>You can bid here for this product:</center></p>
				<form action="offer" method="post">
					<input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="currentPrice">
					<br/>
					<input type="submit" class="form-control btn btn-primary" value="Bid!">
				</form>
				<br/>
				<p class="card-text"><center>Last bids:</center></p>
				<c:if test="${empty offers }">
					<p class="card-text"><center>Noone bid on this product. Be first one!</center></p>
				</c:if>
				<c:if test="${!empty offers }">
					<c:forEach items="${offers }" var="o">
						<div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
						  <div class="card-header"><center><a class="isDisabled" href="/auction/myProfile2?idUser=${o.user.idUser }">${o.user.firstname } ${o.user.lastname }</a></center></div>
						  <div class="card-body">
						    <h5 class="card-title"><center>${o.price } $</center></h5>
						    <p class="card-text"><center><small>${o.time }</small></center></p>
						  </div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<form action="addComment" method="post">
			<div class="formClass">
				<h1 class="fontA">Comments</h1>
				<textarea placeholder="Add comment.."class="form-control textareaClass"  name="content"></textarea>
				<input class="btn btn-success form-control" type="submit" name="submit" value="Comment">
			</div>
		</form>
		<c:forEach items="${messages }" var="m">
		<c:if test="${m.advert.idAdvert == advert.idAdvert }">
			<div class='postovi'>
			<p class='pKlasa'>${m.content }</p>	
			<p class='smallKlasa'><small class='bold'>${m.user.username }</small></p>
			<p class='smallKlasa2'><small class='bold'>${m.time } </small></p>
			</div>
		</c:if>
		</c:forEach>
		
	
	</c:if>
	</c:if>
	<!--===================================================================================================-->	

	<!--=============================REGISTROVAN CLAN (ZATVORENA AUKCIJA)==================================-->	
	<c:if test="${user.role==1 }">
	<c:if test="${advert.isActive==0 }">
		<div class="card text-white bg-dark mb-3 ">
			<img class="card-img-top" src="/images/bid1.png" alt="Card image cap" width="30" height="140">
			<div class="card-header"><a href="#" class="form-control btn btn-outline-danger">CLOSED</a></div>
			<div class="card-header"><center>${advert.name } <br/> <small>${advert.time }</small></center> </div>
			<div class="card-body">
			 	<p class="card-header">Starting prize: ${advert.startingPrice } $</p>
			 	<p class="card-header">Saled for: ${advert.currentPrice } $</p>
			  	<p class="card-header">Owner: <a class="isDisabled" href="/auction/myProfile2?idUser=${advert.user.idUser }">${advert.user.username }</a></p>
				<p class="card-header">Buyer: <a class="isDisabled" href="/auction/myProfile2?idUser=${buyer.user.idUser }">${buyer.user.username }</a></p>
				<br/>
			 		<c:if test="${user.idUser==advert.user.idUser }">
			 		<c:if test="${!empty advert.ratingBuyer }">
			 			<p class="form-control btn btn-success">You already gave your rate!</p>
			 		</c:if>
			 		<c:if test="${empty advert.ratingBuyer }">
			 		 <form action="rateBuyer" method="post">
			 		 <center>Rate ${buyer.user.username} for buying ${advert.name }</center>
			 		 <select class="form-control" name="ratingBuyer">
			 		 	<option>POSITIVE</option>
			 		 	<option>NEGATIVE</option>
			 		 	<option>NEUTRAL</option>
			 		 </select>
			 		 <br/>
			 		 <input class="form-control btn btn-outline-success" type="submit" value="Rate">
			 		 </form>
			 		 </c:if>
			 		 </c:if>
			 		 
			 		 <c:if test="${buyer.user.idUser==user.idUser }">
			 		 <c:if test="${!empty rating.rateSeller }">
			 			<p class="form-control btn btn-success">You alredy gave your rate</p>
			 		</c:if>
			 		<c:if test="${empty rating.rateSeller }">
			 		 <form action="rateSeller" method="post">
			 		 <center>Rate ${advert.user.username} for selling ${advert.name }</center>
			 		 <select class="form-control" name="ratingSeller">
			 		 	<option>POSITIVE</option>
			 		 	<option>NEGATIVE</option>
			 		 	<option>NEUTRAL</option>
			 		 </select>
			 		 <br/>
			 		 <input class="form-control btn btn-outline-success" type="submit" value="Rate">
			 		 </form>
			 		 </c:if>
			 		 </c:if>
			 		 
			 
			</div>
		</div>
	</c:if>
	</c:if>
	<!--===================================================================================================-->	
</body>
</html>