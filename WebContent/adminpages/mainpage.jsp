<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN MAIN PAGE</title>
</head>
<body>
<form action="AdminServlet?id=createMovie" method="post">
Enter movie name:
<br>
<input type="text" name="movie_name">
<br><br>
Enter poster:
<br>
<input type="file" name="path">
<br><br>
Enter category:
<select name="category" required>
    <option value="1">01</option>
    <option value="2">02</option>
    <option value="3">03</option>
</select>
<br><br>
Enter type:
<select name="type" required>
    <option value="universal">universal</option>
    <option value="universal adult">universal adult</option>
    <option value="adult">adult</option>
</select>
<br><br>
Enter release date:
<br>
<input type="text" name="release_date">
<br><br>
Enter description:
<br>
<textarea rows="20" cols="40" name="description"></textarea>
<br><br>
<input type="submit" value="CREATE MOVIE">
</form>
<br>
<a href="AdminServlet">log out</a>
<br>
<a href="AdminServlet?id=checkmessages">CHECK MESSAGES</a>
</body>
</html>