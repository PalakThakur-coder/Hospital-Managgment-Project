
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
    

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


.wrapper .sidebar .profile h2{
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
       
    </style>
</head>
<body>
   <% String recpname = (String) session.getAttribute("recpname"); %>
    
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
               <form id="logoutForm" action="RecpLogout" method="post">
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
                <h2>Hello Executive</h2>
                
            </div>
            <ul>
           
                <li>
                    <a href="Admin/Dashboard.jsp" class="active"target="contentFrame">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                 <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Register Patient  </span>
                        </a>
                         <ul class="submenu-content text">
                    <li>
                    <a href="Recp/AddPatient.jsp" id="patient" class="submenu"target="contentFrame"style='color:rgb(21, 153, 214)'>OPD Patient</a>
                    </li>
                     <li>
                    <a href="Recp/AddIpdPatient.jsp"target="contentFrame"style='color:rgb(21, 153, 214)'>IPD Patient</a>
                    </li>
                    </ul>
                    </li>
                     <li>
                    <a href="Slips/CreateSlip.jsp" target="contentFrame">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Slip Generate</span>
                    </a>
                    
                </li>
                    
        
                   <li>
                    <a href="Slips/TotalSlip.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Edit</span>
                    </a>
                    </li> 
                     <li>
                    <a href="Recp/Record.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item"> Discharge</span>
                    </a> 
              </li>
                
                    
                <li>
                    <a href="Bill/CreateBill.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item"> Create Bill</span>
                    </a>
                    
               
                <li>
                    <a href="Bill/ViewBill.jsp"target="contentFrame">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Edit Bill</span>
                    </a>
                </li>
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