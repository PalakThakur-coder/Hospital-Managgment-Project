<%@page import="java.sql.*"%>
<%@ page import="connect.Connect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Include necessary CSS -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        
        .main{
            display: flex;
            flex-direction: row;
            justify-content: center;
            flex-wrap: wrap;
            height: 100vh;
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            position: absolute;
            margin:auto;
        }

       .tr1 {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        .show1{
            text-align: center;
            margin: 5vh 2vw;
            width:70%;
            background: rgb(15, 15, 15);
            border-radius: 20px;
            color: white;
            padding: 2em;
        }
        .contain{
            margin: 5vh 2vw;
            width:80%;
            
            width: 350px;
         
            border-radius: 20px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            color: white;
            padding: 2em;
        }
        .head{
            font-size: 2em;
            margin-bottom: 0.5em;
        }
        .bo {
            margin: 0.2em 0;
        }
       .contain img{
       border-radius: 25px;
       }        
        
        .loginBtn{
            width: 102%;
            height: 40px;
            border: none;
            border-radius: 10px;
            margin: 0.5em 0;
            transform: translate(-1%);
            cursor: pointer;
            color: white;
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            transition: all .4s;
        }
        
        .loginBtn:hover{
            transform: translate(-1%, 5%);
            box-shadow: 0 0 10px #ff416d65;
        }
        .text{
            font-size: 0.8em;
            margin-top: 0.5em;
            text-align: center;
            color: rgba(255, 255, 255, 0.623);
        }
        .text a{
            color: rgba(255, 255, 255, 0.911);
        }
        </style>
</head>
<body>
<% 
Connect cn = new Connect();
cn.DataConnection();
HttpSession ses = request.getSession();
String email = (String) ses.getAttribute("uid");
String id = ""; 
String name = "";
String age = "";
String qualification = "";
String specialist = "";
String mobile = "";
String qr = "select * from doctortable where email=?";
PreparedStatement ps = cn.c.prepareStatement(qr);
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
if(rs.next()) {
    id = rs.getString("id");
    name = rs.getString("name");
    age = rs.getString("age");
    qualification = rs.getString("qualification");
    specialist = rs.getString("specialist");
    mobile = rs.getString("mobile");
}
%>



<table>
    <tr class="tr1">
        <th class="tr1">Patient Name</th>
        <!-- Add other table headers -->
    </tr>

    <% 
    String qr1 = "select * from offlineslip where doctor=?";
    PreparedStatement ps1 = cn.c.prepareStatement(qr1);
    ps1.setString(1, id);
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()) {
        do {
            String Name = rs1.getString("name");
            // Retrieve other column values similarly
    %>
            <tr class="tr1">
                <td class="tr1"><%=Name %></td>
                <!-- Display other column values similarly -->
            </tr>
    <% 
        } while(rs1.next());
    } else {
        out.println("No records found");
    }
    %>
</table>

</body>
</html>
