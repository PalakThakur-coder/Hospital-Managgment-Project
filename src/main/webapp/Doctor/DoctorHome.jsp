<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="connect.Connect" %>

<%
String loggedInDoctor = (String) session.getAttribute("loggedInDoctor");
    String errorMessage = null;
    ResultSet patientResultSet = null;
    
    if (loggedInDoctor != null) {
        Connect cn = new Connect();
        try {
            cn.DataConnection();
            
           
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentDate = dateFormat.format(new Date());
            
           
            PreparedStatement patientPS = cn.c.prepareStatement("SELECT * FROM offlineslip WHERE doctor = ? AND date = ?");
            patientPS.setString(1, loggedInDoctor);
            patientPS.setString(2, currentDate);
            patientResultSet = patientPS.executeQuery();
            
        } catch (Exception e) {
            errorMessage = "Error: " + e.getMessage();
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor's Navbar</title>
    <style>
      
.navbar {
    overflow: hidden;
    background-color: rgb(5, 68, 104);
    display: flex;
    justify-content: center;
    align-items: flex-start; 
    flex-direction: column; 
    padding: 10px;
    color: white;
}


.navbar-content {
    display: flex;
    align-items: center;
    width: 100%;
}

.back-button {
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 5px;
    background-color: #007bff;
    transition: background-color 0.3s ease;
    margin-bottom: 10px; 
}

.back-button:hover {
    background-color: red; 
}

.back-doctor {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 10px; 
}

.navbar-right {
    margin-left: auto;
}


        .patient-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .patient-info th,
        .patient-info td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
         td a {
    display: inline-block;
    padding: 2px 5px;
    margin-right: 2px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 15px;
    transition: background-color 0.3s ease;
}
 td a.clicked {
            background-color: red;
        }

        td a.clicked:hover {
            background-color: red;
        }

    </style>
   <script>
       
        function changeColor(linkId) {
            var link = document.getElementById(linkId);
            link.classList.add('clicked'); 
        }
    </script>
</head>
<body>
   <div class="navbar">
    <% if (loggedInDoctor != null) { %>
        <div class="navbar-content">
            <div class="back-doctor">
            <form id="logoutForm" action="../DoctorLogout" method="post">
                
                        <a href="#" onclick="document.getElementById('logoutForm').submit();">
                          
                            <span class="back-button">Logout</span>
                        </a>  
                   
            </form>
                <h2>Welcome, Dr. <%= loggedInDoctor %></h2>
            </div>
            <div class="navbar-right">
                <%
                    Date currentDate = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                %>
                <p>Date: <%= dateFormat.format(currentDate) %></p>
                <p>Time: <%= timeFormat.format(currentDate) %></p>
            </div>
        </div>
    <% } else { %>
        
    <% } %>
</div>
    <% 
    if (patientResultSet != null) { %>
        <div class="patient-info">
            <h3>Patient Information</h3>
            <table>
                <thead>
                    <tr>
                    <th>Slip ID</th>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th> Gender</th>
                        <th>Date</th>
                        <th>Status</th>
                         <th>Action</th>
                       
                    </tr>
                </thead>
                <tbody>
                 <% 
                    while (patientResultSet.next()) {
                        String id = patientResultSet.getString("id"); // Get patient ID
                    %>
                   
                    <tr>
                         <td><%= patientResultSet.getString("s_id") %></td>
                         <td><a href="PatientDetailRecord.jsp?id=<%= id %>"><%= id %></a></td>
                        <td><%= patientResultSet.getString("name") %></td>
                        <td><%= patientResultSet.getString("age") %></td>
                        <td><%= patientResultSet.getString("gender") %></td>
                        <td><%= patientResultSet.getString("date") %></td>
                        <td><%= patientResultSet.getString("checkup_status") %></td>
                        <td>  
                            <a id="link_<%= id %>" href="PatientDetail.jsp?id=<%= id %>" onclick="changeColor('link_<%= id %>')">CheckUp</a>
                        </td>
                        </tr>
                    <% 
                    }
                    patientResultSet.close();
                    %>
                </tbody>
            </table>
        </div>
    <% } %>
   
</body>
</html>
