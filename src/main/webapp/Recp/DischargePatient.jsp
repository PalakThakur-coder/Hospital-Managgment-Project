<!DOCTYPE html>
 <%@page import="connect.Connect" %>
    <%@page import ="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Discharge Patient Form</title>
<style>
/* Style for the form container */
.serchbar1 {
    width: 20%;
    
    margin: 0 auto;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
}

/* Style for the form title */
.serchbar1 h3 {
    margin: 0;
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
}

/* Style for form labels */
.serchbar1 label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

/* Style for form input fields */
.serchbar1 input[type="text"],
.serchbar1 input[type="date"] {
    width: 80%;
    
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* Style for submit button */
.serchbar1 input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
}

/* Style for submit button on hover */
.serchbar1 input[type="submit"]:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
<%
    PreparedStatement ps;
    Connect cn;
    ResultSet rs;
    String ID = "";
    cn = new Connect();
    cn.DataConnection();

    String id = request.getParameter("id");
    String s = "SELECT * FROM offlineslip WHERE id =  '" + id + "'  ";
    ps = cn.c.prepareStatement(s);

    rs = ps.executeQuery();
    if (rs.next()) {
%>
<div class="serchbar1">
    <h3>Discharge Patient</h3>
    <form action="../DischargePatient" method="post"> <!-- Action points to the JSP file where you handle the discharge process -->
        <label for="patientId">Patient ID </label>
        <input type="text" name="patientId" id="patientId"value="<%= rs.getString(2) %>" readonly>
         <label for="patientName">Patient name </label>
        <input type="text" name="patientName" id="patientName"value="<%= rs.getString(3) %>" readonly>
        <br><br>
        <label for="dischargeDate">Discharge Date:</label>
        <input type="date" name="dischargeDate" id="dischargeDate" required>
        <br><br>
        <input type="submit" value="Discharge">
    </form>
</div>
<% } else { %>
        <p>No patient data found for the provided ID.</p>
    <% } %>
</body>
</html>
