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
  .serchbar1 {
            width: 20%;
            float: right;
            text-align: right;
            margin-top: 10px;
        }

        .serchbar1 h3 {
            margin: 0;
        }



</style>
</head>
<body>

<div class= "serchbar">
<h2>Edit Any Records</h2>
    
         <form action="TotalSlip.jsp">
          <div class="fields">
        <label for="searchType">Search by:</label>
        <select name="searchType"class="searchType" id="searchType">
        
            <option value="id">ID</option>
             <option value="s_id">Slip-ID</option>
            <option value="name">Name</option>
           
        </select>
        <br><br>
        <label for="searchTerm">Search Term:</label>
        <input type="text" name="searchTerm"class="searchTerm" id="searchTerm">
        
        <input type="submit" value="Search">
      
       
   
        </div>
       </form> 
        
  
  
</div>
  <h2>Search Results</h2>
    <table border='1'>
        <tr>
        <th> SlipID</th>
            <th>ID</th>
           
            <th>Name</th>
            <th>AGE</th>
            <th>Gender</th>
           <th>Patient Type</th>
            <th>Date</th>
            <th>Discharge</th>
            <th>Doctor</th>
           
            <th colspan=2>Action</th>
            
            
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
          query = "SELECT * FROM offlineslip WHERE id = ?";
          
      } else if ("name".equals(searchType)) {
          query = "SELECT * FROM offlineslip WHERE name LIKE ?";
   
      } else if ("s_id".equals(searchType)) {
              query = "SELECT * FROM offlineslip WHERE s_id= ?";
       
      }else{
    	  out.println("data not match");
      }
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
             
                String s_id=rs.getString("s_id");
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender= rs.getString("gender");
                String patienttype= rs.getString("patienttype");
              
                String date= rs.getString("date");
                String dischargedate =rs.getString("dischargedate");
                String doctor= rs.getString("doctor");
               
                
               
                
        %>
        <tr >
             <td><%= s_id %></td>
            <td> <%= id %></td>
          
            <td><%= name %></td>
             <td><%= age %></td>
             <td><%= gender %></td>
          <td><%= patienttype %></td>
              <td><%= date %></td>
              <td><%= dischargedate %></td>
                <td><%= doctor %></td>
           
              
         <!-- <td>  <a href="DeleteSlip.jsp?s_id=<%= s_id %>"onclick="return confirmDelete();">Delete</a>-->
            
         <td>  <a href="../Recp/UpdatePatient.jsp?id=<%= id %>">Edit</a>
            
        </td>
    </tr>      
         
        
        <% 
        }
    } catch (SQLException se) {
        
    }
    %>
    </table>
 <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this record?");
    }
</script>
</body>
</html>





