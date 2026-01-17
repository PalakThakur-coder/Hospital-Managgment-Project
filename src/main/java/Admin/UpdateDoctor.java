package Admin;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;


public class UpdateDoctor extends HttpServlet {

   
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        String id= req.getParameter("id");
       
        String name = req.getParameter("name");
		String gender= req.getParameter("gender");
		String qualification = req.getParameter("qualification");
	   String specialisation = req.getParameter("specialist");
		String mobileno= req.getParameter("mobileno");
		String email= req.getParameter("email");
		String houseno= req.getParameter("houseno");
		String street= req.getParameter("street");
		String city= req.getParameter("city");
		String state= req.getParameter("state");
		String date= req.getParameter("date");
		String idname= req.getParameter("idname");
	
		String idno=req.getParameter("idno");
		String age= req.getParameter("age");

        try {
            Connect cn=new Connect();
            cn.DataConnection();
            PreparedStatement pst = cn.c.prepareStatement("UPDATE doctortable SET name = ?, age = ?, gender = ?, qualification = ?, specialisation = ?, mobileno = ?, email = ?, houseno = ?, street = ?, city = ?, state = ?, date = ?, idname = ?, idno = ? WHERE id = ?");

            pst.setString(1, name);
            pst.setString(2, age);
            pst.setString(3, gender);
            pst.setString(4, qualification);
            pst.setString(5, specialisation);
            pst.setString(6, mobileno);
            pst.setString(7, email);
            pst.setString(8, houseno);
            pst.setString(9, street);
            pst.setString(10, city);
            pst.setString(11, state);
            pst.setString(12, date);
            pst.setString(13, idname);
            pst.setString(14, idno);
            pst.setString(15, id);
         
            int i = pst.executeUpdate();
            if (i > 0) {
            	pw.println("<script type=\"text/javascript\">");
                pw.println("alert(' Data Update Sucessfully');");
                pw.println("window.location.href = \"Admin/ListDoctor.jsp\";");
                pw.println("</script>");
            	
           
		 } else {
             pw.println("<script type=\"text/javascript\">");
             pw.println("alert('Failed..! Try Again Later...');");
             pw.println("window.location.href = \"Admin/ListDoctor.jsp\";");
             pw.println("</script>");
         
            
        }
            } catch (Exception e) {
            		System.out.println(e);
        }

        }
    
}