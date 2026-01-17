<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="Stylesheet" href="css/Index.css">
</head>

<style>
body{
	
	background-image: url('img/colage1.jpg');
    background-size: cover;
	background-position: center;
 }
 .title {
    width: 80%;
    text-align: center;
    font-weight: 500;
    font-size: 40px;
}
 .title h1 {
   
   color: red; /* Set the color to red */
   text-shadow: 2px 2px yellow; /* Add a yellow shadow */
      
}
</style>

<body>
   <div class="container">
        <nav class="navbar">
        <div class="logo">
       <img src="img/lifelogo.jpeg">
       </div>
        <div class="title">
        <h1>Life Line Hospital</h1></div>
            <ul class="nav-links">
            
                 <li class="nav-link login">
                 
                    <a href="#">Login</a>
                     
                    
                    <ul class="drop-down">
                        <li><a href="Admin/AdminLogin.jsp">Admin</a></li>
                        
                        <li><a href="Recp/RecpLogin.jsp">Executive</a></li>
                        <li><a href="Doctor/DoctorLogin.jsp">Doctor</a></li>
                       
                    </ul>
                </li>
               
            </ul>
        </nav>
    </div>
</body>
</html>