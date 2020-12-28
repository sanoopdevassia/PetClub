<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css/style2.css">
<title>Dogs</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
*
{
margin:0px;
}

/* Style the header */


/* Create two columns/boxes that floats next to each other */
navs {
  float: left;
  width: 15%;
 
  align: left;

 
  
}

/* Style the list inside the menu */


articles {
  float: left;
  padding:30px;
  width: 80%;
  
   /* only for demonstration, should be removed */
}


</style>
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
						<li class="nav-item"><a class="nav-link" href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
			
			</ul>
			
		</nav>
	</header>
	
	
	
<br /><br /><br /><br /><br /><br />

	<center><h2>Dogs Information:</h2></center>
<sections>
  <navs>
  
    <ul>
    
    
    
    
    
    
    
   <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="dog-info">
	
		<b>Size:</b><br><input type="radio" name="size" value="small" size="10" > small<br>
					<input type="radio" name="size" value="medium" size="10" > medium<br>
					<input type="radio" name="size" value="large" size="10" > large<br>
					
					<br>
					
		<b>Origin:</b><br><input type="radio" name="origin" value="Canada" size="10" > Canada<br>
					<input type="radio" name="origin" value="Germany" size="10" > Germany<br>
					<input type="radio" name="origin" value="United Kingdom" size="10" > United Kingdom<br>
					
					<br>
					
		<b>Colour:</b><br><input type="radio" name="colour" value="black" size="10" > Black<br>
					<input type="radio" name="colour" value="white" size="10" > White<br>
					<input type="radio" name="colour" value="brown" size="10" > Brown	<br>	
					<input type="radio" name="colour" value="golden" size="10" > Golden	<br>
	
	
					<br>
					
		
		<input type="submit" value="Search" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;">
		<input type="hidden" name="action" value="index">
	</form>
    
    
    </ul>
    
  </navs>
  
  <articles>









 <table>
			<tr>
			<th>Dogs</th>
			<th>Name</th>
			<th>Origin</th>
				<th>Popularity</th>
			
			<th>Behaviour</th>
		
		</tr>
		
	</table>
		
		 <c:forEach items="${list3 }" var="dogs">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 100px;"><img src="${dogs.getBREEDPIC() }" height="150" width="200" ></td>
					<td style="width: 100px;"><c:out value="${dogs.getBREEDNAME() }"></c:out></td>
			
					
					<td style="width: 100px;"><c:out value="${dogs.getBREEDORIGIN() }"></c:out></td>
					<td style="width: 100px;"><c:out value="${dogs.getBREEDPOP() }"></c:out></td>
					
						<td style="width: 50px;"><c:out value="${dogs.getBREEDINFO() }"></c:out></td>
						
						

					
				</tr>
			</table>
		 </c:forEach>
  </articles>
</sections>

  <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />

</body>
</html>




