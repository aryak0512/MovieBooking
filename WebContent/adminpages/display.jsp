<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OUTPUT</title>
</head>
<body>
CATEGORY 1============================
<br><br>
<c:forEach items="${list}" var="m">
	<c:if test="${m.getCategory_id() ==1 }">
		ID:<c:out value="${m.getMovie_id() }" />
		<br>
		NAME: <c:out value="${m.getMovie_name()}"/>
		<br>
		DESCRIPTION: <c:out value="${m.getDescription()}"/>
		<br>
		TYPE: <c:out value="${m.getMovie_type()}"/>
		<br>
		DATE: <c:out value="${m.getMovie_release_date()}"/>
		<br>
		POSTER:
		<br>
		<img alt="cant display" height="200px" width="150px" src="data:image/jpg;base64,${m.getPoster() }">
	    <br><br>
	 </c:if>
</c:forEach>
<br><br>
CATEGORY 2============================
<br><br>
<c:forEach items="${list}" var="m">
	<c:if test="${m.getCategory_id() ==2 }">
		ID:<c:out value="${m.getMovie_id() }" />
		<br>
		NAME: <c:out value="${m.getMovie_name()}"/>
		<br>
		DESCRIPTION: <c:out value="${m.getDescription()}"/>
		<br>
		TYPE: <c:out value="${m.getMovie_type()}"/>
		<br>
		DATE: <c:out value="${m.getMovie_release_date()}"/>
		<br>
		POSTER:
		<br>
		<img alt="cant display" height="200px" width="150px" src="data:image/jpg;base64,${m.getPoster() }">
	    <br><br>
	 </c:if>
</c:forEach> 	
<br><br>
CATEGORY 3:============================
<br><br>
<c:forEach items="${list}" var="m">
	<c:if test="${m.getCategory_id() ==3 }">
		ID:<c:out value="${m.getMovie_id() }" />
		<br>
		NAME: <c:out value="${m.getMovie_name()}"/>
		<br>
		DESCRIPTION: <c:out value="${m.getDescription()}"/>
		<br>
		TYPE: <c:out value="${m.getMovie_type()}"/>
		<br>
		DATE: <c:out value="${m.getMovie_release_date()}"/>
		<br>
		POSTER:
		<br>
		<img alt="cant display" height="200px" width="150px" src="data:image/jpg;base64,${m.getPoster() }">
	    <br><br>
	 </c:if>
</c:forEach>

</body>
</html>