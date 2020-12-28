<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	
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

	 
	  
	
	<div class="container">
	<h2>My Orders:</h2>
		 <table>
			<tr>
			
			<th>Name</th>
			<th>Price</th>
				<th>Date of order</th>
			<th>Status</th>
			<th>Image</th>
		
		</tr>
	</table>
		
		 <c:forEach items="${list4 }" var="product">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					
					<td style="width: 100px;"><c:out value="${product.getName() }"></c:out></td>
					<td style="width: 100px;"><c:out value="${product.getPrice() }"></c:out></td>
					<td style="width: 100px;"><c:out value="${product.getDATE_OF_ORDER() }"></c:out></td>
					<td style="width: 100px;"><c:out value="${product.getSTATUS() }"></c:out></td>
					
					<td style="width: 100px;"><img src="${product.getImage() }" height="100" width="150" ></td>
					
				</tr>
			</table>
		 </c:forEach>
		 </div>
	<footer>
		<div class="footer"> &copy; 2020 Copyright:
	      <a href="Controller?page=index"> Petclub.com</a>
	    </div>
	</footer>
</body>
</html>