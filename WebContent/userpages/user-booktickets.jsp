<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>REGISTER</title>
<style type="text/css">
body{
background-image: url("theatre.jpg");
background-size: cover;
}
fieldset{
background-color:white;
padding:5%;
margin:5%;
}
.contain{
margin-left:5%;
margin-right: 5%;
margin-top: 5%;
margin-bottom: 5%;
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
padding:3%;
font-size:20px;
}
#textside{
padding:2%;
}
</style>
</head>
<body>
<c:import url="header1.jsp"/>
<%
int mid=(Integer)request.getAttribute("mid");
%>
<div class="contain">
	<div class="row">
			<div class="col-lg-2">
        		
		    </div>  
		    
		    
		    <div class="col-lg-8" id="textside">
        		
					  <form action="UserServlet?id=selectseats&mid=<% out.println(mid);%>" method="post">
					    <fieldset>
					    <p id="info">
					    <br>
					    <font color="red"><b>NAME:</b></font>&nbsp;
						<input type="text" name="fname" placeholder="first name" pattern="[A-Za-z]{1,32}" required>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="lname" placeholder="last name" pattern="[A-Za-z]{1,32}"  required>
						<br>
						<br>
						<font color="red"><b>EMAIL:</b></font>&nbsp;
						<input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" placeholder="Email-ID" required>
						<br>
						<br>
						<font color="red"><b>MOBILE:</b></font>&nbsp;
						<input type="tel" pattern="[0-9]{10}" name="phone" placeholder="10 digit mobile no." required>
						<br>
						<br>
						<font color="red"><b>SELECT YOUR LOCALITY:</b></font>&nbsp;
						<select name="locality" required>
		
					    <option value="Bandra">Bandra</option>
					    <option value="Borivali">Borivali</option>
					    
					    <option value="Andheri">Andheri</option>
					    <option value="Dadar">Dadar</option>
					    <option value="Churchgate">Churchgate</option>
					    <option value="Jogeshwari">Jogeshwari</option>
					    <option value="Goregaon">Goregaon</option>
					    <option value="Malad">Malad</option>
					    <option value="Mulund">Mulund</option>
					    <option value="Thane">Thane</option>
					    <option value="Vile Parle">Vile Parle</option>
					    <option value="Wadala">Wadala</option>
					    </select>
					    <br>
						<br>
						<font color="red"><b>YOUR MOVIE:</b></font>&nbsp;
						<c:forEach var="m" items="${list }">
						<c:out value="${m.getMovie_name() }"/>
						</c:forEach>
						
						<br>
						<br>
					    <input type="submit" class="btn btn-primary" value="SELECT THEATRE">
					    <br>
					    <br>
					    </p>
					    </fieldset>
					</form>	
		    </div>  
		    
		    
		    <div class="col-lg-2">
        		
		    </div>  
	</div>
</div>

<div class="footer">
  <p style="font-family: 'Gotu', sans-serif;font-weight: bold; font-size: 15px; ">Copyright &copy; Aryak's BookMyShow 2020 | MADE BY: Aryak Deshpande</p>
</div>

</body>
</html>