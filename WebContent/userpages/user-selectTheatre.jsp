<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.List" %>
    <%@page import="com.beans.Theatre" %>
    <%@page import="com.beans.Movie" %>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>SELECT THEATRE</title>
<style type="text/css">
body{
background-image: url("theatre.jpg");
background-size: cover;
}
.footer {
   position: relative;
   left: 0;
   bottom: 0;
   margin-top:5%;
   width: 100%;
   background-color: transparent;
   color: white;
   text-align: center;
}
#info{
padding:2%;
font-size:15px;
}
#subjects td, #subjects th {
  border: 1px solid black;
  padding: 8px;
  background-color:#f2f2f2;
  font-weight: bold;
}

#subjects tr:{background-color:#FFFFFF;}

#subjects tr:hover {background-color: #ddd;}

#subjects th {
  padding-top: 8px;
  padding-bottom: 5px;
  text-align: center;
  background-color: #4CAF50;
  color: white;
}
.contain{
margin-left:5%;
margin-right: 5%;
margin-top: 5%;
margin-bottom: 2%;
}
#textside{
background-color: white;

}
</style>
</head>
<body>
<c:import url="header1.jsp"/>

<%
int cust_id=(Integer)request.getAttribute("cust_id"); 

%>
<div class="contain">
	<div class="row">
	
	<div class="col-lg-7" id="textside">
				<c:forEach items="${movieData }" var="c">
				<c:set var="movie_id" value="${c.getMovie_id() }"/>
				<p id="info">
		   		<font color="blue">MOVIE DETAILS:</font>&nbsp;
		   		<br><br>
		   		<font color="red">NAME:</font>&nbsp;
		   		<c:out value="${c.getMovie_name()}" /> <br>
		   		<font color="red">CERTIFICATE:</font>&nbsp;
		   		<c:out value="${c.getMovie_type()}" /><br>
		   		<font color="red">RELEASED:</font>&nbsp;
		   		<c:out value="${c.getMovie_release_date()}" /><br><br>
		   		<font color="blue">Select a theatre from available options:</font>&nbsp;
		   		
		   		<p class="text-center">


			<div>     
			  <table align="center" id="subjects">
			    <thead>
			      <tr>
			        <th>ID</th>
			        <th>NAME</th>
			        <th>ADDRESS</th>
			        <th>CONTACT</th>
			        
			      </tr>
			    </thead>
			    <tbody>
			        
			<% 
			List <Theatre> theatreData = (List<Theatre>)request.getAttribute("theatreData");
			for(Theatre s:theatreData){
			%>
			
			      <tr>
			      	<td><%out.println(s.getId());%></td>
			        <td><%out.println(s.getName());%></td>
			        <td><%out.println(s.getAddress()); %></td>
			        <td><%out.println(s.getContact()); %></td>
			      </tr>
			    <% 
			}
			%>
			</p>
			    
			    </tbody>
			  </table>
			</div>
		   		
		   		</c:forEach>
		   		
		   	
		   		
		   		<form action="UserServlet?id=book_seats&mid=${movie_id}&cust_id=<%out.println(cust_id); %>" method="post">
		   		<br>
		   		<% 
			    List <Theatre> theatreData = (List<Theatre>)request.getAttribute("theatreData");
		   		for(Theatre s:theatreData){%>
		   		<input type="hidden" name="cid" value=<%out.println(cust_id);%> >
		   		
		   		<input type="radio" name="theatre" id="<%out.println(s.getName());%>" value=<%out.println(s.getId());%> required>
		   		<label for="<%out.println(s.getName());%>"><%out.println(s.getName());%></label>
		   		
		   		
		   		<BR><BR>		
		   		<% }%>
		   		<input type="submit" class="btn btn-primary" value="SELECT SEATS">
		   		</form>
		   		
		   		</p>
	   		
		</div>
		<div class="col-lg-5">
		
				<c:forEach items="${movieData }" var="c">
				<img alt="cant display" height="100%" width="100%"  src="data:image/jpg;base64,${c.getPoster() }">
        		</c:forEach>
        		
		</div>     
	
	
	</div><!-- row ends here -->
</div><!-- contain ends here -->

<div class="footer">
  <p style="font-family: 'Gotu', sans-serif;font-weight: bold; font-size: 15px; ">Copyright &copy; Aryak's BookMyShow 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>