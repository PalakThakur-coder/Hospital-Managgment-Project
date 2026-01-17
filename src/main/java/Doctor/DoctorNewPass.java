package Doctor;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

public class DoctorNewPass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("email");
        String password = request.getParameter("pass");
        PrintWriter pw = response.getWriter();
     Connect cn;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establish database connection

             cn= new Connect ();
    		cn.DataConnection();

            // Query to check if the username exists
            String checkQuery = "SELECT * FROM doctortable WHERE username = ?";
            ps = cn.c.prepareStatement(checkQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Username exists, update the password
                String updateQuery = "UPDATE doctortable SET password = ? WHERE username = ?";
                ps = cn.c.prepareStatement(updateQuery);
                ps.setString(1, password);
                ps.setString(2, username);
                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {

                    RequestDispatcher rd = request.getRequestDispatcher("Doctor/DoctorLogin.jsp");
                   rd.forward(request, response);
                } else {
                	 pw.println("<script type=\"text/javascript\">");
                     pw.println("alert('Failed to update the password.Please try again..!');");
                     pw.println("window.location.href = \"Doctor/DoctorLogin.jsp\";");
                     pw.println("</script>");
                }
            } else {
                // Username not found
            	 pw.println("<script type=\"text/javascript\">");
                 pw.println("alert('Username not found .Please enter a valid username.');");
                 pw.println("window.location.href = \"Doctor/DoctorNewPass.jsp\";");
                 pw.println("</script>");
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            
            e.printStackTrace();
        } 
        }
    }

