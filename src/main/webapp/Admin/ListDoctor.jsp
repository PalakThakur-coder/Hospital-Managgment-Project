<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="connect.Connect" %>
    <%@ page import="java.sql.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 body {
                background-color: white;
               
            }
            .serchbar
            {
                width: 60%;
                height: 5%;
                margin-top:2%; 
                margin-left: 0px;
                margin-bottom: 0%;
                
            }
            .serchbar form .fields{
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
}
            .searchType
            {
                width: 10%;
                height: 40px; 
                border-radius: 10px;
            }
            .searchTerm
            {
                width: 20%;
                height: 40px; 
                border-radius: 10px;
            }
  label {
    font-weight: bold;
    display: flex;
    margin-bottom: 5px;
    font-size: 20px;
}
   input[type="submit"] {
   text-align: center;
    border-radius:6px;
    background-color: #6a64f1;
    color: white;
    height: 40px;
    cursor: pointer;
    width: 100px;
    font-size: 20px;
    
    
}
input[type="submit"]:hover {
    background-color: #0056b3;
}         
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 2px solid black;
    padding: 8px;
    text-align: left;
    text-color: black;
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
td a:hover {
    background-color: #0056b3;
}
h2{
 text-align: center;
 text-color: white;
    color: blue;
   
    font-size: 30px;
}

.show-all-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #6a64f1;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 20px;
    cursor: pointer;
}

.show-all-button:hover {
    background-color: #0056b3;
}





</style>
</head>
<body>

<div class= "serchbar">
<h2>Doctor Search</h2>
    
         <form action="ListDoctor.jsp">
          <div class="fields">
        <label for="searchType">Search by:</label>
        <select name="searchType"class="searchType" id="searchType">
        
            <option value="id">ID</option>
            <option value="name">Name</option>
            <option value="email">Email</option>
            <option value="mobileno">Mobile No</option>
        </select>
        <br><br>
        <label for="searchTerm">Search Term:</label>
        <input type="text" name="searchTerm"class="searchTerm" id="searchTerm">
        
        <input type="submit" value="Search">
      
        <a href="ListDoctor.jsp" class="show-all-button">Reset</a>
        <a href="addDoctor.jsp" class="show-all-button">Add Doctor</a>
        
      
   
        </div>
       </form> 
        
  </div>
  <h2>Search Results</h2>
    <table border='1'>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>AGE</th>
            <th>Gender</th>
            <th>Qualification</th>
            <th>Specialisation</th>
            <th>MobileNo</th>
            <th>Email</th>
            <th>HouseNo</th>
            <th>Street</th> 
            <th>city</th>
            <th>State</th>
            <th>Date</th>
            <th>Idname</th>
            <th>Idno</th> 
            <th>Description</th>      
            <th>Action</th>
            
        </tr>
  <% 
  try{
  Connect cn = new Connect();
  cn.DataConnection();
  String query = "";
  String query1 = "";
  String searchType = request.getParameter("searchType");
  String searchTerm = request.getParameter("searchTerm");
  
  
 
  if (searchType != null && searchTerm != null) {
	  
     
      
       if ("id".equals(searchType)) {
          query = "SELECT * FROM doctortable WHERE id = ?";
          
      } else if ("name".equals(searchType)) {
          query = "SELECT * FROM doctortable WHERE name LIKE ?";
      } else if ("email".equals(searchType)) {
          query = "SELECT * FROM doctortable WHERE email = ?";
      } else if ("mobileno".equals(searchType)) {
          query = "SELECT * FROM doctortable WHERE mobileno = ?";
      }else{
    	  out.println("data not match");
      }
  }
  else {
    	 query1= "Select * from doctortable";
          
      }
		  
  PreparedStatement ps;
  if (!query.isEmpty()) {
      ps = cn.c.prepareStatement(query);
      ps.setString(1, searchTerm);
  } else {
      ps = cn.c.prepareStatement(query1);
  }

  ResultSet rs = ps.executeQuery();

     
      while (rs.next()) {
            
                String id = rs.getString("id");             
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender= rs.getString("gender");
                String qualification= rs.getString("qualification");
                String specialisation= rs.getString("specialisation");
                String mobileno = rs.getString("mobileno");
                String email= rs.getString("email");
                String houseno= rs.getString("houseno");
                String street= rs.getString("street");
                String city= rs.getString("city");
                String state= rs.getString("state");
                String date= rs.getString("date");
                String idname= rs.getString("idname");
                String idno= rs.getString("idno");
                String description= rs.getString("description"); 
                
        %>
        <tr >
            <td> <%= id %></td>
            
            <td><%= name %></td>
             <td><%= age %></td>
             <td><%= gender %></td>
            <td><%= qualification%></td>
            <td><%= specialisation %></td>
             <td><%= mobileno %></td>
             <td><%= email %></td>
             <td><%= houseno %></td>  
             <td><%= street %></td>
             <td><%= city %></td>             
              <td><%= state %></td>
              <td><%= date %></td>
              <td><%= idname %></td>
             <td><%= idno %></td>
              <td><%= description %></td>
              
         <td>  <a href="UpdateDoctor.jsp?id=<%= id %>">Update</a>
        
            
            
        
    </tr>      
         
        
        <%}
            
  }catch(SQLException se)
  {
	 out.println(se); 
  }
        %>
    </table>
 
</body>
</html>





