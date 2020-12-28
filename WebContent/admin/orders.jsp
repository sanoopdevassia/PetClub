<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Welcome admin
		</h1>
		<nav>
			<ul>
				<li><a href="admin?page=index">Home</a></li>
				<li><a href="admin?page=addproduct">Add Products</a></li>
					<li><a href="admin?page=orders">Customer Orders</a></li>
				
				<li><a href="admin?page=out">Out of Stock</a></li>
			</ul>
		</nav>
	</header>

	 <sql:setDataSource user="system" password="melvin" url="jdbc:oracle:thin:@localhost:1521:XE" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from orders
		 
	   </sql:query>
	   
	  
	
	<div class="container">
	<h2>Customer Orders:</h2>
		 <table>
			<tr>
			<th>Item id</th>
			<th>Name</th>
			<th>Amount Paid</th>
				<th>Date of order</th>
			<th>Customer Name</th>
			<th>Image</th>
			<th>Options</th>
		
		</tr>
	</table>
		
		 <c:forEach items="${result.rows }" var="row">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 50px;"><c:out value="${row.id }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.NAME }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.price }"></c:out></td>
						<td style="width: 100px;"><c:out value="${row.DATE_OF_ORDER}"/></td>
					<td style="width: 100px;"><c:out value="${row.username}"/></td>
					<td style="width: 100px;"><img src="${row.image}" height="100" width="150" ></td>
					<td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=details&id=${row.id}" style="color: #6bb1f8;">Details</a> </td>
					
				</tr>
			</table>
		 </c:forEach>
		 </div>
		 <br><br><br><br><br><br><br>
	<footer>
		<div class="footer"> &copy; 2020 Copyright:
	      <a href="Controller?page=index"> Petclub.com</a>
	    </div>
	</footer>
	
</body>
</html>