<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>HOME PAGE</title>
<style>
body{
background-image: url("theatre.jpg");

}
#display{
padding-left: 5%;
padding-right: 5%;
align-content: center;
}
.movie_type{
font-size: 20px;
font-weight: bold;
color:white;
}
<!--
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

.contain{
margin-left:5%;
margin-right: 5%;
margin-top: 5%;
margin-bottom: 2%;
}


fieldset{
border: 1px solid white;
background-color: transparent;
}


input,textarea{
background-color: white;
border-radius: 10px;
}



</style>





</head>
<body>

<%String msg=(String)request.getAttribute("msg"); %>
<c:import url="header.jsp"/>


<!-- Page Content -->
<div class="contain">
	<div class="row">
	
		<div class="col-lg-3">
			<form action="UserServlet?id=filledcontactform" method="post">
			<fieldset>
			<legend><font color="white">CONTACT US</font></legend>
			<BR>
			
			<font color="white">NAME:</font>
			<input type="text" name="name" placeholder="Full Name" pattern="[A-Za-z ]{1,32}" required/>
			<BR><BR>
			<font color="white">EMAIL:</font>
			<input type="text" name="email" placeholder="Valid email ID" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required/>
			<BR><BR>
			<font color="white">MESSAGE:</font>
			<BR>
			<textarea rows="3" cols="29" name="message" placeholder="Your message" required></textarea>
			<br><BR>
			<input type="submit" value="SUBMIT" style="color:white; background-color: green; font-weight:bold;"/>
			<br>
			<br>
			<font color="white"><%out.println(msg); %></font>
			</fieldset>
			</form>
		</div>
		
		<div class="col-lg-9">
			<font color="white">NOW SHOWING:</font>
			<br>
			<br>
			<marquee behavior="scroll" direction="left" scrollamount="15" loop="infinite">
			    <img src="1.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="2.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="3.jpg"  width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="4.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="5.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="6.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="7.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="8.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="9.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <img src="10.jpg" width="250" height="350" alt="Natural" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
  			</marquee>	
		</div>

	</div><!-- row ends here -->
	
	<br><br>
    <font color="white" class="movie_type" id="action">ACTION:</font>
    <br><br>
    <div class="row" id="display">
    <c:forEach items="${list }" var="c">
			<c:if test="${c.getCategory_id() ==1 }">
			<div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><c:out value="${c.getMovie_name()}" /> </a>
                </h4>
                
                 <p class="card-text" style="margin-left:5%;">
               		<img alt="cant display" height="300px" width="250px" src="data:image/jpg;base64,${c.getPoster() }" style="align-content: center; padding:1%;">
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><a href="UserServlet?id=viewmoviedetails&mid=${c.getMovie_id()}" class="btn btn-warning" id="selectbuttons">VIEW MOVIE DETAILS</a> &nbsp;&nbsp;
               
               
                </small>
              </div>
            </div>
          </div>
          				
			</c:if>
			
		</c:forEach>
	</div>	
	
	
	
	<br><br>
    <font color="white" class="movie_type" id="horror">HORROR:</font>
    <br><br>
    <div class="row" id="display">
    <c:forEach items="${list }" var="c">
			<c:if test="${c.getCategory_id() ==2 }">
			<div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100" id="card h-100">
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><c:out value="${c.getMovie_name()}" /> </a>
                </h4>
                
                 <p class="card-text" style="margin-left:5%;">
               		<img alt="cant display" height="300px" width="250px" src="data:image/jpg;base64,${c.getPoster() }">
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><a href="UserServlet?id=viewmoviedetails&mid=${c.getMovie_id()}" class="btn btn-warning" id="selectbuttons">VIEW MOVIE DETAILS</a> &nbsp;&nbsp;
               
               
                </small>
              </div>
            </div>
          </div>
          				
			</c:if>
			
		</c:forEach>
	</div>
	
	
	
	
	<br><br>
	<font color="white" class="movie_type" id="comedy">COMEDY:</font>
    <br><br>
    <div class="row" id="display">
    <c:forEach items="${list }" var="c">
			<c:if test="${c.getCategory_id() ==3 }">
			<div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><c:out value="${c.getMovie_name()}" /> </a>
                </h4>
                
                 <p class="card-text" style="margin-left:5%;">
               		<img alt="cant display" height="300px" width="250px" src="data:image/jpg;base64,${c.getPoster() }" style="align-content: center; padding:1%;">
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted"><a href="UserServlet?id=viewmoviedetails&mid=${c.getMovie_id()}" class="btn btn-warning" id="selectbuttons">VIEW MOVIE DETAILS</a> &nbsp;&nbsp;
               
               
                </small>
              </div>
            </div>
          </div>
          				
			</c:if>
			
		</c:forEach>
	</div>


 
<div class="footer">
  <p style="font-family: 'Gotu', sans-serif;font-weight: bold; font-size: 15px; ">Copyright &copy; Aryak's BookMyShow 2020 | MADE BY: Aryak Deshpande</p>
</div>


</body>
</html>