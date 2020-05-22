<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
 <%@page import="java.util.List" %>
 <%@page import="com.beans.Contact" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MESSAGES</title>
    <link href="https://fonts.googleapis.com/css?family=Nosifer&display=swap" rel="stylesheet">

<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

<style>
p{
text-align:center;
}
#subjects {
  font-family: helvetica;
  border-collapse: collapse;
  text-align: center;
}
h2{
color: yellow;
background-color: red;
padding:10px;
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
h3{
  color: black;
  font-family: arial;
  font-size: 20px;
  font-weight: normal;
  margin: 5px;
  margin-top: 5px;
}
#buttonlink:link, #buttonlink:visited {
  background-color: red;
  color: yellow;
  padding: 8px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border: 2px solid black;
}

#buttonlink:hover, #buttonlink:active {
  background-color:#4CAF50 ;
}
.images{
height: 350px;
width: 300px;
padding: 10px;
align-content: center;
}
body{
background-image: url("back1.png");
background-size: cover;
background-repeat: no-repeat;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
     <div class="container">
      <img src="logo.png" height="40px" width="65px">&nbsp;&nbsp;
    	<a class="navbar-brand" href="#">
    	      <font color="white" style="font-family: 'Nosifer', cursive; font-size:25px" >ARYAK'S</font></a>
        <font color="red" style="font-family: 'Nosifer', cursive; font-size:25px" id="font"><b>A</b></font>
        <font color="yellow" style="font-family: 'Nosifer', cursive; font-size:25px" id="font"><b>R</b></font>
        <font color="blue" style="font-family: 'Nosifer', cursive; font-size:25px" id="font"><b>T</b></font>&nbsp;&nbsp;
        <font color="white" style="font-family: 'Nosifer', cursive; font-size:25px" > WEBSITE</font></a>
    	</a>
    	 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        	<span class="navbar-toggler-icon"></span>
      	</button>
            
      	
      	<div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="AdminServlet?id=logout">Log out</a>
          </li>
        </ul>
      </div>
      
	</div>
</nav>    

<div class="container">

	<div class="row" style="align-text:center;">
	
	      

             <div class="col-lg-9">
             <br><br><br><br>
             YOUR MESSAGES:<br>
				<p class="text-center">
				<div>     
				  <table align="center" id="subjects">
				    <thead>
				      <tr>
				        <th>ID</th>
				        <th>NAME</th>
				        <th>EMAIL</th>
				        
				        <th>MESSAGE</th>
				      
				      </tr>
				    </thead>
				    <tbody>
				        
				<% 
				List <Contact> list = (List<Contact>)request.getAttribute("listContact");
				for(Contact ct:list){
				%>
				
				      <tr>
				        <td><%out.println(ct.getId());%></td>
				        <td><%out.println(ct.getName());%></td>
				        <td><%out.println(ct.getEmail()); %></td>
				        
				        <td><%out.println(ct.getComment());%></td>
				        
				       
				      </tr>
				    <% 
				}
				%>
				</p>
				    
				    </tbody>
				  </table>
				</div>
		 </div>


	</div>
</div>
 
 <br>
 <a href="AdminServlet">log out</a>
</body>
</html>