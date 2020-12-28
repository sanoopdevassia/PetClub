<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
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

	<div class="signup-header">
	 	<h2>Login to <mark>Petclub</mark></h2>
	</div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		New to Petclub? <a href="Controller?page=sign-up" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<div class="footer"> &copy; 2020 Copyright:
	      <a href="Controller?page=index"> Petclub.com</a>
	    </div>
	</footer>


</body>
</html>