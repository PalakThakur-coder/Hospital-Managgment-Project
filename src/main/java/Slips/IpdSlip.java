package Slips;
import java.io.*;

import java.sql.*;
import java.text.SimpleDateFormat;

import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connect.Connect;

public class IpdSlip extends HttpServlet {
PreparedStatement ps;
Connect cn;
ResultSet rs;
int sno=0;
String  sdt="";

public void sid(String currentdate) {
    try {
        cn = new Connect();
        cn.DataConnection();
        ps = cn.c.prepareStatement("select MAX(s_id) from offlineslip where date=?");
        ps.setString(1, currentdate);

    } catch (SQLException e) {
        
    }

    try {
        rs = ps.executeQuery();
        while (rs.next()) {
            String s_id = rs.getString(1);
         
            if (s_id != null && s_id.length() >= 13) {
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
	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     String currentdate = dateFormat.format(new Date());
   PrintWriter pw= res.getWriter();
    String id = req.getParameter("id");
    String name = req.getParameter("name");
    String age = req.getParameter("age");
    String gender = req.getParameter("gender");
    String date = req.getParameter("date"); 
    String doctor= req.getParameter("doctor");
    String mobileno= req.getParameter("mobileno");
    String bedno=req.getParameter("bedno");
    String disease=req.getParameter("disease");
    String fathername= req.getParameter("fathername");
    String street= req.getParameter("street");
    String city= req.getParameter("city");
    String state= req.getParameter("state");
    
    String patienttype= req.getParameter("patienttype");
    sid(currentdate);
    if (!sdt.equals(currentdate)) {
        sdt =currentdate;
        sno = 1;
        }
    else {
    	sno++;
    }
    String s_id;
    if(sno<=9)
    	s_id = currentdate + "_" + "0"+sno;
    else
    	s_id = currentdate + "_" + sno;
    
   
   

	
    try {
        ps = cn.c.prepareStatement("INSERT INTO offlineslip (s_id, id, name, age, gender, date, doctor,fathername,mobileno,street,city,state,disease,bedno,patienttype) VALUES (?,?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?)");

        ps.setString(1, s_id);
        ps.setString(2, id);
        ps.setString(3, name);
        ps.setString(4, age);
        ps.setString(5, gender);
        ps.setString(6, currentdate);
        ps.setString(7, doctor);
        ps.setString(8, fathername);
        ps.setString(9, mobileno);
        ps.setString(10, street);
        ps.setString(11, city);
        ps.setString(12, state);
        ps.setString(13, disease);
        ps.setString(14, bedno);
        ps.setString(15, patienttype);
   
        int i = ps.executeUpdate();

				
				if(i>0)
				{
					
					 res.sendRedirect("Slips/IpdSlip.jsp?s_id=" + s_id);
					
				}
	

    
     	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
     }
    
   
   
  }
}