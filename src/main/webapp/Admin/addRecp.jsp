

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connect.Connect" %>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html>
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
          <script src="../js/Patient.js"></script>
        <style>
            body {
                background-image: url("../img/Medical.jpg");
                background-color: #cccccc;
            }
 .container{
    
	position: relative;
	max-width: 1200px;
	width: 100%;
	border-radius: 6px;
	padding: 30px;
	height: 700px;
	background-color: #fff;
	box-shadow: 0 5px 10px rgba(0,0,0,0.1);          
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

.nextBtn{
background-color: #0000ff; 
    color: #fff; 
}

.cancelBtn {
    background-color: #ff0000; 
    color: #fff; 
}


.cancelBtn:hover {
    background-color: #cc0000; 
}

   .textarea {
        width: 500px;
        height: 50px;
        padding: 10px;
        font-size: 16px;
        border: 2px solid #ccc;
        border-radius: 5px;
        resize: horizontally; /* This allows vertical resizing of the textarea */
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
String id="";
cn= new Connect ();
cn.DataConnection();


			ps= cn.c.prepareStatement("select MAX(id)from recptable");
			rs=ps.executeQuery();
			while(rs.next())
			{
			if(rs.getString("MAX(id)")== null)
			{
				id= "r"+1001;
			}
			else
			{
				id = rs.getString(1);
			
				int n= Integer.parseInt(id.substring(1,5));
				n++;
				id ="r"+String .valueOf(n);
				
			}
			}
			%>
			
 <div class="container">
 
 
   <form action="../AddRecp" method="post">
    
         <div class="form first">
               <div class="details personal">
                  <span class="title">Representative Details</span>
                     <div class="fields">
                     
               <div class="input-field">
                <label class="required-field">RepresentatorID</label>
                <input type="text"value="<%= id%>" name="id"required>
            </div> 
                
            
                <div class="input-field">
                <label class="required-field">Name</label>
                <input type="text"placeholder="Name" name="name"required>
            </div>
            <div class="input-field">
                <label class="required-field">Age</label>
                <input type="text" placeholder="enter age"name ="age"required>
            </div>
            <div class="input-field1">
							<label class="required-field">Gender :</label> <br>
							 <label for="male">Male</label>
								<input type="radio" value="Male" id="male"name="gender" required>
								 <label for="female">Female</label>
								<input type="radio" value="Female"id="female" name="gender" required>
								<label for="other">Other</label>
							 <input type="radio" value="Other"id="other" name="gender" required>
							
						</div> 
			 <div class="input-field">
                <label class="required-field">Qualification</label>
                <input type="text" name="qualification"placeholder="Enter your qualification"required>
            </div> 
               
                <div class="input-field">
                <label class="required-field">Responsibility</label>
                <input type="text"placeholder="Responsibility" name="responsibility"required>
            </div>
			
           <div class="input-field">
    <label class="required-field">Mobile No</label>
    <input type="number" name="mobileno" id="mobileno" placeholder="Enter your Mobile No" required>
    <span id="mobile-error" class="error-message"></span>
</div>
           <div class="input-field">
    <label class="required-field">Email</label>
    <input type="email" name="email" id="email" placeholder="Email">
    <span id="email-error" class="error-message"></span>
</div>
          </div>
        </div>
           <div class="details personal">
             <span class="title">Address Details</span>
             <div class="fields">
              <div class="input-field">
                <label>Houseno</label>
                <input type="text"placeholder="houseno"name ="houseno">
            </div>
             <div class="input-field">
                <label>Street</label>
                <input type="text"placeholder="street"name ="street">
            </div>
             <div class="input-field">
                <label class="required-field">City</label>
                <input type="text"placeholder="city"name ="city"required>
            </div>
             <div class="input-field">
                <label class="required-field">State</label>
                <input type="text"placeholder="state"name ="state"required>
            </div>
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

					<div class="input-field" id="otherIdNameBox" style="display: none;">
						<label> Other ID Name</label> <input type="text"
							placeholder="enter your any id name" name="idname_input"id="otherRadio">
					</div>
					<div class="input-field">
						<label>ID Number</label> <input type="text"
							placeholder="enter your id no" name="idno"id="idno"><span
								id="idno-error" class="error-message"></span>
					</div>
           </div>
         </div>
         <div class="button-container">
			<button class="cancelBtn" type="button" onclick="cancelform()">
					<span class="btnText">Cancel</span>
				</button>
				<button class="nextBtn">
					<span class="btnText">Submit</span>
				</button>
</div>
        </form>
         
      </div>
      <script>
      function cancelform() {
    	    window.location.href = 'Dashboard.jsp';
    	}
      document.addEventListener("DOMContentLoaded", function() {
          var currentDate = new Date();
          var day = currentDate.getDate();
          var month = currentDate.getMonth() + 1; // Months are zero-based
          var year = currentDate.getFullYear();

          // Format the date as YYYY-MM-DD
          var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;

          // Set the value of the date input field
          document.getElementById("date").value = formattedDate;
      });
      </script>
      <script src="../js/Patient.js"></script>
 

    </body>
</html>
       