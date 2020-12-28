<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	  <header>
		<h1>
		 	<i><b>Pet <font color="#00a8e0">Club</font></b></i>
		</h1>
		<nav >
	
			<ul>
			
			   <li class="nav-item active"> <a class="nav-link" href="main.jsp" data-blast="color">Home <span class="sr-only">(current)</span></a> </li>
                               
                                
                                
                                
		
				<c:choose>
					<c:when test="${session == null}">
						<li class="nav-item"><a class="nav-link" href="Controller?page=login">Login</a></li>
						
					</c:when>
					<c:when test="${session != null}">
					<li class="nav-item"><a class="nav-link" href="Controller?page=order">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
			
		</nav>
	</header>
	
	<div class="tiazon-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-4"><!-- left -->
 						<div class="list-group"><!-- products -->
						  <a href="Controller?page=all-products" class="list-group-item" style="background:  #d6d4d3;">
						    All Products
						  </a>
						    <a href="Controller?page=mobiles" class="list-group-item">Fish</a>
						  <a href="Controller?page=laptops" class="list-group-item">Cat</a>
						  <a href="Controller?page=clothing" class="list-group-item">Dog</a>
						  <a href="Controller?page=home-decor" class="list-group-item">Bird</a>
						</div> 
 				</div><!-- left -->

 				<div class="col-md-8"><!-- right -->
 					<h2 style="text-align: center;">All Products</h2><br>
 					
 					<h5>Sort by(Price):</h5>
					<form action="Controller" method="get" style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="all-products">
					<select name="sort">
					<option value="low-to-high">Low to high</option>
					<option value="high-to-high">high to low</option>
					</select>
					<input type="submit" value="Go!">
					</form>
 					
 					<c:forEach items="${list }" var="product">
 						
 							
		 					<div class="col-md-4">
		 						<img src="${product.getImage() }" height="150px" width="150"><br>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;"> &#x20b9;  <c:out value="${ product.getPrice() }"></c:out></p>
		 						<div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&action=allproducts&id=<c:out value="${product.getId()}"/>">Add to Cart</a> </div><br>
		 					</div>
 							
 						
 						
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
	
	<footer>
		<div class="footer"> &copy; 2020 Copyright:
	      <a href="Controller?page=index"> Petclub.com</a>
	    </div>
	</footer>
	
</body>
</html>