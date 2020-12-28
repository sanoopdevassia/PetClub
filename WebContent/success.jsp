<%@page import="com.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
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
	
	
	
	
	
	<div class="container">
	<center><h2>Pet Club</h2>
	
	<h3>Invoice</h3>
	</center>
	

	<table>
		<tr>
			<th>Item Name</th>
			<th>Price</th>
			<th>Category</th>
		</tr>
	</table>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlist }" var="i">
			<c:forEach items="${list }" var="Product">
				<c:if test="${i == Product.getId() }">
				
				<c:set var="total" value="${total + Product.getPrice() }"></c:set>
				
			<table style="table-layout: fixed;width: 100%;">
				<tr>
					<td style="width: 100px;"><img src="${Product.getImage()}" height="100" width="150" >  (<c:out value="${Product.getName()}"/>)</td>
					<td style="width: 50px;"><c:out value="${Product.getPrice()}"/></td>
					<td style="width: 100px;"><c:out value="${Product.getCategory()}"/></td>
				</tr>
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Amount Paid: &#x20b9; (<c:out value="${ total}"></c:out>)</h4>
	

	</div>
	
	
	<c:choose>
		<c:when test="${session == null}">
				<%
				JOptionPane.showMessageDialog(null, "Please Login first", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				%>
		</c:when>
		
		
		
		<c:when test="${session != null}">
				
				
				<div class="container" style="margin-top: 60px;margin-bottom: 60px;">
					<h4>Thank you <font color="#6bb1f8"><c:out value="${name }"></c:out></font> for Shopping with us. We received your order and it will be delivered to <font color="#6bb1f8"><c:out value="${address }"></c:out></font> with in 4-5 working days.</h4>
					
					
					<br><br>
				<a href="Controller?page=success"><input type="submit" value="Continue Shopping" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
				</div>
			
		</c:when>
	
	</c:choose>
	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<div class="footer"> &copy; 2020 Copyright:
	      <a href="Controller?page=index"> Petclub.com</a>
	    </div>
	</footer>
</body>
</html>