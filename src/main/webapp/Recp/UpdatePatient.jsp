<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="connect.Connect" %>
    <%@page import ="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
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
        <link rel="stylesheet" type="text/css" href="../css/adddataform.css">
        <link rel="stylesheet" type="text/css" href="../css/adddatafrm1.css">
        <link rel="stylesheet" type="text/css" href="../css/Appointment.css">
        <style>
            body {
                background-image: url("../img/Medical.jpg");
                background-color: #cccccc;
            }
             .button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px; 
}

.button-container button {
    padding: 10px 20px; 
    border: none;
    border-radius: 5px;
    cursor: pointer;
    
}


.nextBtn {
    background-color: blue; 
    color: #fff; 
}

.cancelBtn {
    background-color: #ff0000; 
    color: #fff; 
}


.cancelBtn:hover {
    background-color: #cc0000; 
}
 .error-message {
        color: red;
    }

    .input-field.error {
        border: 2px solid red;
    }
        </style>
    </head>
    <body>
<% 
PreparedStatement ps;                                                                                                                                                                                                            
Connect cn;
ResultSet rs;
String ID="";
cn= new Connect ();
cn.DataConnection();

String id = request.getParameter("id");
String s = "SELECT * FROM patienttable WHERE id =  '"+id+"'  ";
 ps = cn.c.prepareStatement(s);
 
 rs = ps.executeQuery();
if (rs.next()) {
			%>
			
 <div class="container">
 <header1>Patient Update Details</header1>
 
   <form action="../updatePatient" method="post">
    
         <div class="form first">
               <div class="details personal">
                  <span class="title">Personal Details</span>
                     <div class="fields">
                 <div class="input-field">
                  <label>PatientID</label>
                <input type="text" name="id"value="<%= rs.getString(2) %>"readonly>
                 </div>
                  
                
            
                   
              
                <div class="input-field">
                <label>Name</label>
                <input type="text" name="name"value="<%= rs.getString(3) %>"required>
            </div>
            <div class="input-field">
                <label>Age</label>
                <input type="text"name ="age"value="<%= rs.getString(16)%>"required>
            </div>
            <div class="input-field">  
 
            <label>Gender :</label> 
        <input type="text"name ="gender"value="<%= rs.getString(4)%>"required>
			
			</div> 
			 <div class="input-field">
                <label>Father Name</label>
                <input type="text" name="fathername"value="<%= rs.getString(5) %>"required>
            </div> 
              <div class="input-field">
                <label>Guardian Name</label>
                <input type="text" name="grandfathername"value="<%= rs.getString(6) %>">
            </div>
			
            <div class="input-field">
                <label>Mobile No</label>
                 
                <input type="number" name="mobileno" id="mobileno"value="<%= rs.getString(7) %>"required>
                <span id="mobile-error" class="error-message"></span>
            </div>
            <div class="input-field">
                <label>Email</label>
                
                <input type="email"id="email"value="<%= rs.getString(8) %>"name ="email">
                 <span id="email-error" class="error-message"></span>
            </div>
          </div>
        </div>
           <div class="details personal">
             <span class="title">Address Details</span>
             <div class="fields">
              <div class="input-field">
                <label>Houseno</label>
                <input type="text"placeholder="houseno"name ="houseno"value="<%= rs.getString(9) %>">
            </div>
             <div class="input-field">
                <label>Street</label>
                <input type="text"placeholder="street"name ="street"value="<%= rs.getString(10) %>">
            </div>
             <div class="input-field">
                <label>City</label>
                <input type="text"placeholder="city"name ="city"value="<%= rs.getString(11) %>"required>
            </div>
             <div class="input-field">
                <label>State</label>
                <input type="text"placeholder="state"name ="state"value="<%= rs.getString(12) %>"required>
            </div>
         </div>
       </div>
           

            <input type="hidden" id="date" name="date">
           
            
            <div class="details personal">
				<span class="title">Identity Details</span>
				<div class="fields">
					<div class="input-field1">
						<h5>ID Name :</h5><br>
						<label for="aadharRadio">AadharCard</label>
						<input type="radio" value="Aadhar"id="aadharRadio" name="idname"
							onclick="toggleOtherIdName(false)">
							 <label for="panRadio">Pan Card</label>
							<input type="radio" value="Pan" name="idname"id="panRadio"
							onclick="toggleOtherIdName(false)">
							 <label for="voterRadio">Voter Card</label>
							<input type="radio" value="Voter" name="idname"id="voterRadio"
							onclick="toggleOtherIdName(false)"> 
							 <label for="otherRadio">Other</label>
							<input type="radio" value="Other" name="idname" id="otherRadio"
							onclick="toggleOtherIdName(true)"> 
					</div> 
			
            <div class="input-field"id="otherIdNameBox"style="display: none;">
            <label> Other ID Name</label>
            
            <input type="text"placeholder="enter your any id name" name="idname_input">
            </div>
             <div class="input-field">
            <label>ID Number</label>
            <input type="text"placeholder="enter your id no"name="idno"value="<%= rs.getString(15) %>">
           <span id="idno-error" class="error-message"></span>
            </div>
           </div>
         </div>
          
          <div class="button-container">
          <button class="cancelBtn" type="button" onclick="cancelForm()">
                <span class="btnText">Cancel</span>
            </button>
         <button class="nextBtn">
         <span class="btnText">Update</span></button>
          
          
            </div>
            
        </form>
      </div>
      
 

 <script src="../js/Patient.js"></script>      

        
        
<% } else { %>
        <p>No patient data found for the provided ID.</p>
    <% } %>
    </body>
</html>
