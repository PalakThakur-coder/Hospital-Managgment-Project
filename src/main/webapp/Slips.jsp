<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="connect.Connect" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel ="stylesheet"href="Appointment.css">
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
    text-color: white;
}
th, td a{
text-color:blue;
}

tr:hover {
    background-color: #f5f5f5;
}
h2{
 text-align: center;
 text-color: white;
}
</style>
</head>

<body>
<h2>Search Results</h2>
    <table border='1'>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>AGE</th>
            <th>Gender</th>
            <th>FatherName</th>
            <th>GrandFatherName</th>
            <th>MobileNo</th>
            <th>Email</th>
            <th>HouseNo</th>
            <th>Street</th> 
            <th>city</th>
            <th>State</th>
            <th>Date</th>
            <th>Idname</th>
            <th>Idno</th>       
            
            
        </tr>
        <%
        ResultSet rs = (ResultSet) request.getAttribute("searchResults");
                           while (rs.next()) {
                                String id = rs.getString("id");
                                String name = rs.getString("name");
                                String age = rs.getString("age");
                                String gender= rs.getString("gender");
                                String fathername= rs.getString("fathername");
                                String grandfathername= rs.getString("grandfathername");
                                String mobileno = rs.getString("mobileno");
                                String email= rs.getString("email");
                                String houseno= rs.getString("houseno");
                                String street= rs.getString("street");
                                String city= rs.getString("city");
                                String state= rs.getString("state");
                                String date= rs.getString("date");
                                String idname= rs.getString("idname");
                                String idno= rs.getString("idno");
        %>
        <tr onclick="fillForm('<%=id%>','<%=name%>', '<%=age%>','<%=gender%>','<%=fathername%>','<%=grandfathername%>',
        '<%=mobileno%>','<%=email%>','<%=houseno%>','<%=street%>','<%=city%>','<%=state%>','<%=date%>','<%=idname%>','<%=idno%>')">
           
            <td><a href="#"> <%=id%> </a></td>
            <td><%=name%></td>
             <td><%=age%></td>
             <td><%=gender%></td>
            <td><%=fathername%></td>
            <td><%=grandfathername%></td>
             <td><%=mobileno%></td>
             <td><%=email%></td>
             <td><%=houseno%></td>  
             <td><%=street%></td>
             <td><%=city%></td>             
              <td><%=state%></td>
              <td><%=date%></td>
              <td><%=idname%></td>
             <td><%=idno%></td>
                     
           
        </tr>
        <%
        }
                            rs.close();
        %>
    </table>
    
    <h2 >Selected Patient Form</h2>
    <form action="TestServlet4" method="post">
     
       <h3>Case:</h3>
      <input type="radio" value="emergency" name="case"  > Emergency 
	  <input type="radio" value="normal" name="case"checked> Normal <br>
	    <div class="inputBox">
        
            <h3>Patient ID:</h3>
            <input type="text" id="id" name="id" readonly>
       </div>
        <div class="inputBox">
        
            <h3>Name:</h3>
            <input type="text" id="name" name="name" readonly>
       </div>
       <div class="inputBox">
          <h3>AGE:</h3>
         <input type="text" id="age" name="age" readonly>
        </div>
        <div class="inputbox">
 
           <h3> Gender: </h3>
           <input type="text" id ="gender" name="gender" readonly>
        </div>
        <div class="inputBox">
          <h3>FatherName </h3>
          <input type="text" id ="fathername" name="fathername" readonly>
        </div>
        <div class="inputBox">  
         <h3> GrandFatherName</h3>
         <input type="text" id ="grandfathername" name="grandfathername" readonly>
         </div>
        <div class="inputbox">
         <h3>MobileNo</h3> 
       <input type="text" id ="mobileno" name="mobileno" readonly><br>
       </div>
        <div class="inputBox">
        <h3>Email </h3>
        <input type="text" id ="email" name="email" readonly><br>
        </div>
         <div class="inputBox">
         <h2>Current Address</h2>
       <h3>HouseNo </h3>
       <input type="text" id ="houseno" name="houseno" readonly><br>
       <h3>Street</h3>
        <input type="text" id ="street" name="street" readonly><br>
       <h3>City </h3>
       <input type="text" id ="city" name="city" readonly><br>
       <h3>State</h3>
        <input type="text" id ="state" name="state" readonly><br>
        </div>
         <div class="inputbox">
       <h3>Date </h3>
       <input type="text" id ="date" name="date" readonly><br> 
       </div>
        <div class="inputBox">        
      <h3> IDname</h3> 
       <input type="text" id ="idname" name="idname" readonly><br>
       </div> 
        <div class="inputBox">
      <h3> IDno</h3>
       <input type="text" id ="idno" name="idno" readonly><br> 
       </div>
       <h2>Others Details</h2>
        <div class="inputBox">
       <h3>Diseases</h3>
        <input type="text" id="diseases" name="diseases"><br>
        </div>
         <div class="inputbox">
       <h3>Doctor</h3>
        <select name ="doctor">
       <option value=""selected>Select Doctor</option>
       <%
       try{
                     Connect cn=new Connect();
                     cn.DataConnection();
                     Statement st = cn.c.createStatement();
                     rs = st.executeQuery("select name,specialist from doctor ");
                     while(rs.next()){
                     String name=rs.getString("name");
                     String specialist=rs.getString("specialist");
       %>
       <option value =><%=name %>(<%=specialist %>)</option>
       <% }
       rs.close();
       st.close();
       }catch(SQLException se){
       out.println(se);
       }
       %>
       
         </select>
         </div>
       
        <input type="submit"class="btn" value="Submit">
       
    </form>

    <script>
        function fillForm(id,name, dob,gender,fathername,grandfathername,mobileno,email,houseno,street,city,state,date,idname,idno) {
            document.getElementById('id').value = id;
            document.getElementById('name').value = name;
            document.getElementById('age').value = dob;
            document.getElementById('gender').value = gender;
            document.getElementById('fathername').value = fathername;
            document.getElementById('grandfathername').value = grandfathername;
            document.getElementById('mobileno').value = mobileno;
            document.getElementById('email').value = email;
            document.getElementById('houseno').value = houseno;
            document.getElementById('street').value = street;
            document.getElementById('city').value = city;
            document.getElementById('state').value = state;
            document.getElementById('date').value = date;
            document.getElementById('idname').value = idname;
            document.getElementById('idno').value = idno;
            
        }
    </script>
</body>
</html>