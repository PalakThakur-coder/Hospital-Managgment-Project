package Slips;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;

import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connect.Connect;

public class OnlineSlip extends HttpServlet {
PreparedStatement ps;
Connect cn;
ResultSet rs;
int sno=0;
String  sdt="";

public void sid(String date) {
    try {
        cn = new Connect();
        cn.DataConnection();
        ps = cn.c.prepareStatement("select MAX(s_id) from slips where date=?");
        ps.setString(1, date);

    } catch (SQLException e) {
        
    }

    try {
        rs = ps.executeQuery();
        while (rs.next()) {
            String s_id = rs.getString(1);
         
            if (s_id != null && s_id.length() >= 12) {
                sno = Integer.parseInt(s_id.substring(11, 13));
                 sdt = s_id.substring(0, 10);
          
            } else {
                sno = 0;
                sdt = "";
            }
        }
    } catch (NumberFormatException | SQLException e) {
        e.printStackTrace();
    }
}
public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
{
	
   PrintWriter pw= res.getWriter();
    String id = req.getParameter("id");
    String name = req.getParameter("name");
    String age = req.getParameter("age");
    String gender = req.getParameter("gender");
    String date = req.getParameter("date"); 
    String type= req.getParameter("appointmentType");
    String bookingtype=req.getParameter("bookingtype");
    String doctor= req.getParameter("doctor");
    sid(date);
    if (!sdt.equals(date)) {
        sdt =date;
        sno = 1;
        }
    else {
    	sno++;
    }
    String s_id;
    if(sno<=9)
    	s_id = date + "_" + "0"+sno;
    else
    	s_id = date + "_" + sno;
    
   
   

	
    try {
    	ps=cn.c.prepareStatement("insert into slips(s_id,id,name,age,gender,date,type,doctor,bookingtype) values(?,?,?,?,?,?,?,?,?)");

			ps.setString(1,s_id);
			ps.setString(2,id);
			ps.setString(3,name);
			ps.setString(4,age);
			ps.setString(5,gender);
			ps.setString(6,date);
			ps.setString(7,type);
			ps.setString(8,doctor);
			ps.setString(9, bookingtype);
		
			
		     int i = ps.executeUpdate();
			
				
				if(i>0)
				{
					
					pw.println("<html><head><title>Patient Slip</title>");
		             pw.println("<style>");
		             pw.println("   .slip-container {");
		             pw.println("       width: 40%;");
		             pw.println("       margin: 0 auto ;");
		             pw.println("       padding: 10px;");
		             pw.println("       border: 2px solid #000;");
		             pw.println("   }");
		             pw.println("   .slip-container p {");
		             pw.println("       margin: 3px 0 ;");
		             pw.println("       padding: 0;");
		             pw.println("   }");
		             pw.println("   .slip-header {");
		             pw.println("    margin-top: 3px;");
		             pw.println("       text-align: center;");
		             pw.println("   }");
		             pw.println("   .slip-left, .slip-right {");
		             pw.println("       width: 48%;");
		             pw.println("       display: inline-block;");
		             pw.println("       vertical-align: top;");
		             pw.println("   }");
		             pw.println("</style>");
		             pw.println("</head><body>");

		            
		             pw.println("<div class='slip-container'>");
		             
		             pw.println("<p style='text-align:right;'>Contect- +91-5667788956,3456783445</p>");
		             pw.println("<hr>");
		             pw.println("<div class='slip-header'>");
		             pw.println("<img src='img/logo2.png' alt='Hospital Logo' style='height: 50px; width: 50px;'>");
		             pw.println("<div style='display: inline-block; vertical-align: top; margin-left: 10px;'>");
		             pw.println("<h2>Hospital Name</h2>");
		             pw.println("</div>");
		             pw.println("<p>Hospital Address</p>");
		             pw.println("</div>");
		             pw.println("<hr>");
		            
		             pw.println("<div class='slip-left'>");
		             pw.println("<p>Slip ID: " +s_id+ "</p>"); 
		             pw.println("<p>Patient ID: " + id + "</p>");
		             pw.println("<p>Name: " + name + "<p>");
		             pw.println("<p>Age: " + age +" "+ "Gender:"+ gender+"</p>");
		             pw.println("</div>");

		             
		             pw.println("<div class='slip-right'>");
		           
		             pw.println("<p>Doctor Name: Dr."+doctor+ "</p>"); 
		             pw.println("<p>Date: " + date + "</p>");
		             Date currentTime = new Date();
		             SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
		             String formattedTime = sdf.format(currentTime);
		           
		             pw.println("<p>Time: " + formattedTime + "</p>");
		             pw.println("<p>Fees: RS:200</p>"); 
		             pw.println("</div>");
		             pw.println("<hr>");
		            pw.println("<div style='clear: both;'></div>"); 
		             pw.println("<p> Prescription</p>");
		             pw.println("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
		             pw.println("</div>");
		         
		             pw.println("<div style='text-align: center;color: blue'>");
		             pw.println("<a href = 'AddPatient.jsp'>Back</a>");
		             pw.println("<input type='button' value='Print' onclick='window.print();'>");
		             pw.println("</div>");
		             

		             pw.println("</body></html>");   
					
					
				}
	

    
     	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
     }
    
   
   
  }
}