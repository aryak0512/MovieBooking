<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.time.LocalDate"%>
    <%@page import="com.beans.Theatre" %>
  
    <%@page import="java.util.List" %>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SEAT MAP</title>
<link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> 
body{
background-image: url("theatre.jpg");
background-size: cover;
}

hr.border{
border: 1px solid white;
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
        input.largerCheckbox { 
            width: 20px; 
            height: 20px; 
        } 
input[type="checkbox"] {
      background: blue;
      border: #7f83a2 1px solid;
   }       
#screen{
background-color: white;
color:red;
font-weight: bold;
font-size: 16px;
text-align: center;

}
</style> 
</head>
<body>
<c:import url="header1.jsp"/>
<%
int cid= (Integer)request.getAttribute("cid");
int mid= (Integer)request.getAttribute("mid");
//out.println("Movie id:"+mid);
int tid= (Integer)request.getAttribute("tid");
//out.println("Theatre id:"+Tid);
List<Theatre>theatreData=(List<Theatre>)request.getAttribute("theatreData");
String msg=(String)request.getAttribute("msg");

LocalDate date = LocalDate.now(); 



%>

<div class="contain">
	<div class="row">
	    <div class="col-lg-2">
	    </div>
	
	    <div class="col-lg-8" id="textside">
		    <form action="UserServlet?id=seats_confirm" method="post">
		    <p class="text-center">
		    <font color="red">THEATRE:</font>
		    
		     <%
		    for(Theatre t:theatreData){
		    	out.println(t.getName());
		     }%>
		     
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<font color="red">DATE: </font>
				<select name="date" required>
				    <option value="<%out.println(date.plusDays(1)); %>"><%out.println(date.plusDays(1)); %></option>
				    <option value=<%out.println(date.plusDays(2)); %>"><%out.println(date.plusDays(2)); %></option>
				    <option value="<%out.println(date.plusDays(3)); %>"><%out.println(date.plusDays(3)); %></option>
				    <option value="<%out.println(date.plusDays(4)); %>"><%out.println(date.plusDays(4)); %></option>
				    </select>
				    
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				    
				<font color="red">TIME:</font>
				 <select name="time" required>
				    <option value="11:00">11:00</option>
				    <option value="16:00">16:00</option>
				    <option value="18:30">18:30</option>
				    <option value="20:30">20:30</option>
				    <option value="22:30">22:30</option>
				    </select>
			</p>
		    <BR>
		    <BR>
		    <input type="hidden" name="mid" value=<%out.println(mid);%>>
		    <input type="hidden" name="tid" value=<%out.println(tid);%>>
		    <input type="hidden" name="cid" value=<%out.println(cid);%>>
		    <font color="blue">CLASS PLATINUM Rs. 450</font><br><BR>
			<%
			int sid=10;
			char t;
			int i;
			
			for(i=1,t='A';  i<=2 && t<='Z';  i++,t++){      
			    for(int j=1;j<=3;j++){ 
			        for(int k=1;k<=8;k++,sid++){
			        	%>
			        	<input type="checkbox" id="seats" name="seat" placeholder="<%out.println(t+""+sid); %>"   value="P<%out.println(t+""+sid); %>" class="largerCheckbox">
			        	<%
			            //System.out.print(t+""+sid+"   ");
			        }%>
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       <%
			    }
			    %>
			    
			    <br>
			    <%
			}
			
			%>
			
			<HR class="border">
			<font color="blue">CLASS GOLD Rs. 350</font><br><br>
			<%
			
			
			for(i=1,t='A';  i<=5 && t<='Z';  i++,t++){      
			    for(int j=1;j<=3;j++){ 
			        for(int k=1;k<=8;k++,sid++){
			        	%>
			        	<input type="checkbox" id="seats" name="seat" placeholder="<%out.println(t+""+sid); %>"   value="G<%out.println(t+""+sid); %>" class="largerCheckbox">
			        	<%
			            //System.out.print(t+""+sid+"   ");
			        }%>
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       <%
			    }
			    %>
			    <br>
			    <%
			}
			
			%>
			<HR class="border">
			<font color="blue">CLASS SILVER Rs. 250</font><BR><br>
			<% 
			
			for(i=1,t='A';  i<=3 && t<='Z';  i++,t++){      
			    for(int j=1;j<=3;j++){ 
			        for(int k=1;k<=8;k++,sid++){
			        	%>
			        	<input type="checkbox" id="seats" name="seat" placeholder="<%out.println(t+""+sid); %>"   value="S<%out.println(t+""+sid); %>" class="largerCheckbox" >
			        	<%
			            //System.out.print(t+""+sid+"   ");
			        }%>
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       <%
			    }
			    %>
			    <br>
			    <%
			}
			%>
			<br>
			<br>
			<p id="screen" >SCREEN THIS WAY</p>
			<br>
			<font color="green"><%out.println(msg); %></font>
			<br><br>
			<input type="submit" class="btn btn-primary" value="CONFIRM BOOKING">
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