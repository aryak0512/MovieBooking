<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.beans.Customer" %>
    <%@page import="com.beans.Theatre" %>
    <%@page import="com.beans.Movie" %>
    <%@page import="java.util.List" %>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OVERVIEW</title>
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<style>
body{
background-image: url("theatre.jpg");
background-size: cover;
}
.contain{
margin-left:5%;
margin-right: 5%;
margin-top: 5%;
margin-bottom: 2%;
}
#textside{
background-color: white;
padding:5%;
align-content: center;
}
.row{
align-content: center;
align-items: center;

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
</style>
<%
List<Customer>custData=(List<Customer>)request.getAttribute("custData");
List<Theatre>theatreData=(List<Theatre>)request.getAttribute("theatreData");
List<Movie>movieData=(List<Movie>)request.getAttribute("movieData");
String []seats =(String [])request.getAttribute("seats");
String time=(String)request.getAttribute("time");
String date=(String)request.getAttribute("date");

double amount =(Double)request.getAttribute("bill");
%>


<c:import url="header1.jsp"/>

<div class="contain">
	<div class="row">
	    <div class="col-lg-2">
	    </div>
	    <div class="col-lg-8" id="textside">
	    <p align="center">
	    
	    <img alt="LOGO" src="logo.png" height="5%" width="7%">
	    &nbsp;
	   &nbsp;
	    <label style=" color:black;font-family: 'Gotu', sans-serif;font-weight: bold;font-size: 40px; margin-bottom: 0%;">Aryak's BookMyShow
	    </label>

	    </p>
	   
	    
	    <p align="center"><font color="green">YOUR TICKETS HAVE BEEN BOOKED. A CONFIRMATION EMAIL WILL REACH YOU SHORTLY.</font></p>
	    		<BR>
	    		<b><font color=red>CUSTOMER DETAILS:</font></b>
				<BR>
				<%for(Customer c:custData){%>
					<b>Name: </b><%out.println(c.getName()); %><br>
					<b>Email: </b><%out.println(c.getEmail()); %><br>
					<b>Location: </b><%out.println(c.getLocation()); %><br>
				<%}%>
				<br>
				
				<b><font color=red>MOVIE DETAILS:</font></b>
				<BR>
				<%for(Movie m:movieData){%>
					<b>Name:</b> <%out.println(m.getMovie_name()); %><br>
					<b>Category:</b>  <%out.println(m.getMovie_type()); %><br>
					<b>Date:</b> <%out.println(m.getMovie_release_date()); %><br>
				<%}%>
				<br>
				
				<b><font color=red>THEATRE DETAILS:</font></b>
				<BR>
				<%for(Theatre t:theatreData){%>
					<b>Name:</b> <%out.println(t.getName()); %><br>
					<b>Address:</b> <%out.println(t.getAddress()); %><br>
					<b>Contact:</b> <%out.println(t.getContact()); %><br>
				<%}%>
				<br>
				
				<b><font color=red>SEATS :</font></b>
				
				<%
				for(String s:seats){
					out.println(s+", ");
				}
				%>
				<br>
				<br>
				<b><font color=red>SHOW DATE AND TIME :</font></b>
				<%out.println(date+", "+time+ "hrs"); %>
				<br><br>
				<b><font color=red>Total amount :</font></b>
				<%out.println("Rs. "+amount+" "); %>
				(Payable at the venue in cash)
				<br><br>
				You may close this window now.
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