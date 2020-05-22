<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
background-image: url('C:\Users\Aryak Deshpande\Desktop\IP\htdocs\formbg1.jpg');
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ADMIN LOGIN</title>
<% String Msg= (String)request.getAttribute("msg"); %>
<% String username= (String)request.getAttribute("username"); %>
</head>
<body>
<p class="text-center">
<h2>LOGIN PAGE</h2>
</p>
<hr>
<p class="text-center">
<font color="red"><% out.println(Msg);%></font>
</p>

<div class="container">
<form action="AdminServlet?id=login" method="post">
<p class="text-center">

<font color="blue">PLEASE ENTER YOUR CRENDENTIALS:</font>
<BR><BR>

Username: <input type="text" name="username" value="<%out.print(username);%>">

<br><br>

Password: <input type="password" name="password">

<br>
<br>
<input type="submit" class="btn btn-primary" value="LOGIN"/>

<br>
<br>
<a href="AppServlet?id=signup">SIGN-UP</a>

</p>

</form>
</div>
</body>
</html>