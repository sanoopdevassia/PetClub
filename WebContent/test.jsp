<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>


/* Style the header */


/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 20%;

 
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  
  height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}



/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>

<br /><br /><br /><br />

<section>
  <nav>
  
    <ul>
    
    
    
    
    
    
    
   <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="dog-info">
	
		Size:<input type="radio" name="size" value="small" size="10" >small
					<input type="radio" name="size" value="medium" size="10" >medium
					<input type="radio" name="size" value="large" size="10" >large
					
					|
					
		Origin:<input type="radio" name="origin" value="Canada" size="10" >Canada
					<input type="radio" name="origin" value="Germany" size="10" >Germany
					<input type="radio" name="origin" value="United Kingdom" size="10" >United Kingdom
					
					|
					
		Colour:<input type="radio" name="colour" value="black" size="10" >Black
					<input type="radio" name="colour" value="white" size="10" >White
					<input type="radio" name="colour" value="brown" size="10" >Brown		
					<input type="radio" name="colour" value="golden" size="10" >Golden	
	
	
					|
					
		<input type="submit" value="SUBMIT">
	</form>
    
    
    </ul>
    
  </nav>
  
  <article>









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
  </article>
</section>

  <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />

</body>
</html>




