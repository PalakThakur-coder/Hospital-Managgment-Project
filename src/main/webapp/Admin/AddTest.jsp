<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/Test.css">
</head>
<style>
body {
            font-family: Arial, sans-serif;
             background-image: url('../img/lbg.jpg');
               background-size: cover;
                 
             
        } 
        </style>  
<body>
 
    
  
    <h2>Add a New Item</h2>
    <form action="../AddTest" method="get"class="form border">
        <label for="testName">Item Name:</label>
        <input type="text" id="testName" name="testname" required><br>
       
        <input type="submit" value="Add Item">
    </form>
    
   
</body>
</html>