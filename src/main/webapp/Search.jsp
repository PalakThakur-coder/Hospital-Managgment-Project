<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="Stylesheet" href="Search.css">
</head>
<body>
<form action="ControlSearch.jsp"method="post">
<div class= "search">
<h2>Patient Search</h2>
    
         
        <label for="searchType">Search by:</label>
        <select name="searchType" id="searchType">
            <option value="id">ID</option>
            <option value="name">Name</option>
            <option value="email">Email</option>
            <option value="mobileno">Mobile No</option>
        </select>
        <br><br>
        <label for="searchTerm">Search Term:</label>
        <input type="text" name="searchTerm" id="searchTerm">
        <br><br>
        <input type="submit" value="Search">
  </div>
 </form>
</body>
</html>