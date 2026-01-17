<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="connect.Connect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <style>
     @charset "ISO-8859-1";
*{
	list-style: none;
	text-decoration: none;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Open Sans', sans-serif;
}

body{
	background: #f5f6fa;
}

.wrapper .sidebar{
	background: rgb(5, 68, 104);
	position: fixed;
	top: 0;
	left: 0;
	overflow-y: auto;
	width: 225px;
	height: 100%;
	padding: 20px 0;
	transition: all 0.5s ease;
	flex-direction: column;
	display: flex;
}

.wrapper .sidebar .profile{
	margin-bottom: 30px;
	text-align: center;
}
wrapper .sidebar .profile ul li a{
	display: block;
	padding: 10px 10px;
	border-bottom: 1px solid #10558d;
	color: rgb(241, 237, 237);
	font-size: 16px;
	position: relative;
}
.wrapper .sidebar .profile ul li a .icon{
	color: #dee4ec;
	width: 30px;
	display: inline-block;
}

 

.wrapper .sidebar .profile ul li a:hover,
.wrapper .sidebar .profile ul li a.active{
	color: #0c7db1;

	background:white;
    border-right: 2px solid rgb(5, 68, 104);
}
.wrapper .sidebar .profile ul li a:hover .icon,
.wrapper .sidebar .profile ul li a.active .icon{
	color: #0c7db1;
}

.wrapper .sidebar .profile ul li a:hover:before,
.wrapper .sidebar .profile ul li a.active:before{
	display: block;
}


.wrapper .sidebar .profile h1{
	color: #ffffff;
	margin: 10px 0 5px;
}



.wrapper .sidebar ul li a{
	display: block;
	padding: 13px 30px;
	border-bottom: 1px solid #10558d;
	color: rgb(241, 237, 237);
	font-size: 16px;
	position: relative;
}

.wrapper .sidebar ul li a .icon{
	color: #dee4ec;
	width: 30px;
	display: inline-block;
}

 

.wrapper .sidebar ul li a:hover,
.wrapper .sidebar ul li a.active{
	color: #0c7db1;

	background:white;
    border-right: 2px solid rgb(5, 68, 104);
}

.wrapper .sidebar ul li a:hover .icon,
.wrapper .sidebar ul li a.active .icon{
	color: #0c7db1;
}

.wrapper .sidebar ul li a:hover:before,
.wrapper .sidebar ul li a.active:before{
	display: block;
}

.wrapper .section{
	width: calc(100% - 225px);
	margin-left: 225px;
	transition: all 0.5s ease;
}

.wrapper .section .top_navbar{
	background: rgb(7, 105, 185);
	height: 50px;
	display: flex;
	align-items: center;
	padding: 0 30px;
 
}

.wrapper .section .top_navbar .hamburger a{
	font-size: 28px;
	color: #f4fbff;
}

.wrapper .section .top_navbar .hamburger a:hover{
	color: #a2ecff;
}

 

body.active .wrapper .sidebar{
	left: -225px;
}

body.active .wrapper .section{
	margin-left: 0;
	width: 100%;
}
iframe {
    width: 100%; 
    height: 600px; 
    border: 1px solid #ccc; 
    margin: 10px 0; 
    padding: 10px; 
}

iframe body {
    font-family: Arial, sans-serif; 
    background-color: #f5f5f5; 
}
 .submenu-content {
        margin-left: 20px;
            display: none;
        
            }

         ul li:hover .submenu-content {
            display: block;
            
             
        }
      
        .submenu-content ul li {
            margin-left: 20px;
           
        }
      .text li a{
            
            text-decoration: none;
            display: block;
            color: black;
        }
        @media only screen and (max-width: 455px) {
    /* Hamburger Menu Icon */
    .hamburger {
        display: block; /* Displayed on phones */
        position: fixed;
        top: 15px;
        right: 15px;
        z-index: 9999; /* Ensure it appears above other content */
    }

    .hamburger a {
        font-size: 24px; /* Adjust size as needed */
        color: #fff; /* Hamburger icon color */
        text-decoration: none;
    }

    /* Sidebar */
    .wrapper .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        overflow-y: auto;
        width: 50%; /* Sidebar takes up half of the screen */
        height: 100%;
        background: rgb(5, 68, 104);
        padding: 20px 0;
       
        flex-direction: column;
        display: flex;
    }

    .wrapper .sidebar.active {
        transform: translateX(0); /* Displayed when active */
    }

    .wrapper .sidebar ul li a,
    .wrapper .sidebar .profile ul li a {
        padding: 10px 15px; /* Adjusted padding for mobile */
        color: rgb(241, 237, 237);
        text-decoration: none;
    }

    .wrapper .sidebar ul li a .icon,
    .wrapper .sidebar .profile ul li a .icon {
        width: 20px; /* Adjusted icon width for mobile */
    }

    /* Content Section */
    .wrapper .section {
        margin-left: 50%; /* Ensure content takes up remaining space */
        transition: margin-left 0.3s ease;
    }
}
       
     </style>
</head>
<body>
    <% String adminname = (String) session.getAttribute("adminname"); %>
    
    <div class="wrapper">
        <div class="section">
            <div class="top_navbar">
                <div class="hamburger">
                    <a href="#">
                        <i class="fas fa-bars"></i>
                    </a>
                </div>
            </div>
             
        </div>
        <div class="sidebar">
            <div class="profile">
            <ul>
              <li>
               <form id="logoutForm" action="Logout" method="post">
                <ul>
                    <li>
                        <a href="#" onclick="document.getElementById('logoutForm').submit();">
                            <span class="icon"><i class='fas fa-chevron-circle-left'></i></span>
                            <span class="item">Logout</span>
                        </a>  
                    </li> 
                </ul>
            </form>
              </li> 
            </ul>
                <h1>Hello Admin!</h1>
                
            </div>
            <ul>
           
                <li>
                    <a href="Admin/Dashboard.jsp" class="active"target="contentFrame">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                 <li>
                    <a href="Admin/listPatient.jsp" target="contentFrame">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Patient</span>
                        
                    </a>
                    <!--  <ul class="submenu-content text">
                        
                        <li>
                            <a href="Admin/listPatient.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>View/history Patient</a>
                        </li>
                    </ul>-->
                </li>
                <li>
                    <a href="Admin/ListDoctor.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Doctor</span>
                    </a>
                    <!--   <ul class="submenu-content text">
                        <li>
                            <a href="Admin/addDoctor.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>Add Doctor</a>
                        </li>
                        <li>
                            <a href="Admin/ListDoctor.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>View/Edit Doctor</a>
                        </li>
                    </ul>-->
                </li>
              <!-- <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Representator</span>
                    </a>
                     <ul class="submenu-content text">
                        <li>
                            <a href="Admin/addRecp.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>Add Representator</a>
                        </li>
                        <li>
                            <a href="Admin/ListRecp.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>View/Edit Representator</a>
                        </li>
                    </ul>
                </li>-->
                <li>
                    <a href="Admin/ViewTest.jsp" target="contentFrame">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Bill Items</span>
                    </a>
                     
               
               <!--   <li>
                    <a href="Bill/ViewBill.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Bill</span>
                    </a>
                </li>-->
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Reports</span>
                    </a>
                     <ul class="submenu-content text">
                     <li>
                            <a href="Bill/BillReport.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>Bill Report</a>
                        </li>
                        <li>
                            <a href="Slips/SlipReport.jsp" target="contentFrame"style='color:rgb(21, 153, 214)'>Slip Report</a>
                        </li>
                    </ul>
                </li>
                
        </div>
        <div class="section">
    <iframe id="contentFrame" name="contentFrame" src="Admin/Dashboard.jsp"></iframe>
</div>
    </div>
  <script>
       var hamburger = document.querySelector(".hamburger");
	hamburger.addEventListener("click", function(){
		document.querySelector("body").classList.toggle("active");
	});
	
  </script>
</body>
</html>