package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;

public class AdminRegister extends HttpServlet {

    int i = 0;
    PreparedStatement ps;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connect cn = new Connect();
        cn.DataConnection();
        PrintWriter pw = response.getWriter();
        try {
            // Check if username (email) already exists in the database
            String checkQuery = "SELECT * FROM admin WHERE username = ?";
            PreparedStatement Ps = cn.c.prepareStatement(checkQuery);
            Ps.setString(1, request.getParameter("email"));
            ResultSet rs = Ps.executeQuery();

            if (rs.next()) {
        
                // Username already exists, show an error message
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Username already exists!');");
                pw.println("window.location.href = \"Admin/AdminRegister.jsp\";");
                pw.println("</script>");
            } else {
                // Username does not exist, proceed with registration
                ps = cn.c.prepareStatement("INSERT INTO admin VALUES(?, ?,?)");
                String name = request.getParameter("name");
                String username = request.getParameter("email");
                String password = request.getParameter("pass");

                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3,name);
                i = ps.executeUpdate();

                if (i > 0) {
                	 
                     response.sendRedirect("Admin/AdminLogin.jsp");
                   
                } else {
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Registration Failed!');");
                    pw.println("window.location.href = \"Admin/AdminRegister.jsp\";");
                    pw.println("</script>");
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

}
