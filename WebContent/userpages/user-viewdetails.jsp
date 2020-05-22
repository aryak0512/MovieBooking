<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIEW MOVIE</title>
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<style>
body{
background-image: url("theatre.jpg");
background-size: cover;
}
#info{
padding:3%;
font-size:20px;
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
#textside{
background-color: white;

}
.contain{
margin-left:10%;
margin-right: 10%;
margin-top: 5%;
margin-bottom: 2%;
}
</style>
</head>
<body>
<c:import url="header1.jsp"/>

<div class="contain">
	<div class="row">
		<div class="col-lg-7" id="textside">
				<c:forEach items="${list }" var="c">
				<p id="info">
		   		<font color="red"><b>ID: </b></font>&nbsp;
		   		<c:out value="${c.getMovie_id()}" /> <br><br>
		   		<font color="red"><b>NAME: </b></font>&nbsp;
		   		<c:out value="${c.getMovie_name()}" /><br><br> 
		   		<font color="red"><b>PLOT: </b></font>&nbsp; 
		   		<c:out value="${c.getDescription()}" /> <br><br>
		   		<font color="red"><b>CERTIFICATE: </b></font>&nbsp;
		   		<c:out value="${c.getMovie_type()}" /> <br><br>
		   		<font color="red"><b>RELEASED: </b></font>&nbsp;
		   		<c:out value="${c.getMovie_release_date()}" /> <br><br>
		   		<a href="UserServlet?id=booktickets&mid=${c.getMovie_id()}">BOOK TICKETS</a>
		   		</p>
		   		</c:forEach>
		</div>
		<div class="col-lg-5">
		
				<c:forEach items="${list }" var="c">
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