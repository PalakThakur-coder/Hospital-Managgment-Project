<!DOCTYPE html>
<%@page import="connect.Connect" %>
<%@page import ="java.sql.*" %>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Hospital Management System</title>
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="../css/register.css" type="text/css" />
    </head>
    <style type="text/css">
        body {
            background-image: url("../img/Medical.jpg");
            background-color: #cccccc;
        }

        .img-rounded {
            height: 100%;
            width: 100%;
        }

        h1 {
            color: white;
            text-align: center;
        }
        
         
            select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                text-indent: 1px;
                text-overflow: '';
                border: none;
                outline: none;
                background: transparent;
                width: 100%; 
                padding: 10px; 
             
            }
       .container {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  padding: 0 15px;
  background: #fff;
  box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  border-radius: 20px;
  /* Set a fixed height */
  height: 500px; /* Adjust this value as needed */
  /* Ensure no extra content overflows */
  overflow: hidden;
}
    </style>
    <body>
        <nav class="navbar navbar-expand-md navbar-light bg-light">
            <a href="#" class="navbar-brand"> <img src="../img/lifelogo.jpeg"
                                                   height="30" width="70" alt="HospitalManagementSystem">
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ml-auto" style="margin-right: 30px;">
                    <a class="dropdown-item" href="../Index.jsp">Home</a>
                 
                </div>
            </div>
        </nav>
        <div>
            <h1>
                <b>Life Line Hospital</b>
            </h1>
        </div>
        <!-- Sing in  Form -->
        <form action="../DoctorLogin" method="post">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="../img/signin-image.jpg" alt="sing up image"></figure>
                           
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in</h2>
                          
                               <div class="form-group">
                <label for="doctorName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                <select name="doctorName" id="doctorName">
                    <option value="" disabled selected>Select Doctor Name</option>
                    <% 
                    Connect cn = new Connect();
                    cn.DataConnection();
                    Statement st1 = cn.c.createStatement();
                    ResultSet doctorResultSet = st1.executeQuery("SELECT name, specialisation FROM doctortable");
                    while (doctorResultSet.next()) {
                        String doctorName = doctorResultSet.getString("name");
                        String specialisation = doctorResultSet.getString("specialisation");
                    %>
                    <option value="<%= doctorName %>"><%= doctorName %> (<%= specialisation %>)</option>
                    <%
                    }
                    doctorResultSet.close();
                    st1.close();
                    %>
                </select>
            </div>
            <div class="form-group">
                     <label for="your_email"><i class="zmdi zmdi-email"></i></label>
                      <input type="email" name="username" id="your_email" placeholder="Email"/>
                                </div>
            
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="your_pass" placeholder="Password"/>
                                </div>
                                <div>
                               <a href="DoctorNewPass.jsp" class="signup-image-link">Forgot password ?</a>
                               </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                           
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </body>
</html>