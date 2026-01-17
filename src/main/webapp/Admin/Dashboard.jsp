<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="connect.Connect" %>
    <%@page import ="java.sql.*" %>
    <%@page import="java.util.Date" %>
<html>
<head>
    <title></title>
  
  <style>
   body {
            font-family: Arial, sans-serif;
             background-image: url('../img/lbg.jpg');
               background-size: cover;
                 
             
        }   
        </style>
      <link rel="Stylesheet" href="../css/Front.css">
</head>
<body>
    <div id="content">
        
        <h1>Welcome!</h1>
        
       
        <div class="dashboard">
            <h2>Dashboard</h2>
            <!-- Total Patients -->
             <%
            try {
                Connect cn= new Connect();
                cn.DataConnection();
                Statement st = (Statement) cn.c.createStatement();
                String query = "select count(*) from patienttable";
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    int patient = rs.getInt(1);
        %>
            <div class="dashboard-widget">
                <p>Total Patients</p>
                <p><%= patient %></p>
            </div>
             <%
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
              
               
            <!-- Total Doctors -->
            <% 
             try {
                Connect cn= new Connect();
                cn.DataConnection();
                Statement st = (Statement) cn.c.createStatement();
                String query = "select count(*) from doctortable";
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    int doctor = rs.getInt(1);
        %>
            <div class="dashboard-widget">
                <p>Total Doctors</p>
                <p><%=doctor  %></p>
            </div>
             <%
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
          
            <!-- Total Slips -->
            <% 
             try {
                Connect cn= new Connect();
                cn.DataConnection();
                Statement st = (Statement) cn.c.createStatement();
                String query = "select count(*) from offlineslip";
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    int patient = rs.getInt(1);
        %>
            <div class="dashboard-widget">
                <p>Total Slips</p>
                <p><%= patient %></p>
            </div>
             <%
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <!-- Total Bills -->
            <% 
             try {
                Connect cn= new Connect();
                cn.DataConnection();
                Statement st = (Statement) cn.c.createStatement();
                String query = "select count(*) from billing_table";
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    int bill = rs.getInt(1);
        %>
            <div class="dashboard-widget">
                <p>Total Bills</p>
                <p><%= bill %></p>
            </div> <%
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
             <!-- Current Date -->
            <div class="dashboard-widget1">
               <h2>Current Date</h2>
                <h3><%= new java.util.Date() %></h3>
            </div>
            <!-- Total In-Patients -->
            <%
            try {
                Connect cn = new Connect();
                cn.DataConnection();
                Statement st = cn.c.createStatement();
                String opdQuery = "SELECT COUNT(*) FROM offlineslip WHERE patienttype = 'OPD' AND date = CURRENT_DATE";
                ResultSet opdRs = st.executeQuery(opdQuery);
                if (opdRs.next()) {
                    int opdPatients = opdRs.getInt(1);
                %>
                <div class="dashboard-widget">
                    <p>OPD Slips</p>
                    <p><%= opdPatients %></p>
                </div>
                <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
            <!-- Total Out-Patients (OPD) -->
            <%
            try {
                Connect cn = new Connect();
                cn.DataConnection();
                Statement st = cn.c.createStatement();
                String ipdQuery = "SELECT COUNT(*) FROM offlineslip WHERE patienttype = 'IPD' AND date = CURRENT_DATE";
                ResultSet ipdRs = st.executeQuery(ipdQuery);
                if (ipdRs.next()) {
                    int ipdPatients = ipdRs.getInt(1);
                %>
                <div class="dashboard-widget">
                    <p>IPD Slips</p>
                    <p><%= ipdPatients %></p>
                </div>
                <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
    </div>
    </div>
</body>
</html>