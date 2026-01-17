package Recptionist;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

public class RecpNewPass extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("pass");
        PrintWriter pw = response.getWriter();
        Connect cn;
        PreparedStatement ps = null;

        try {
            // Establish database connection
            cn = new Connect();
            cn.DataConnection();

            // Update the password for the fixed username "admin"
            String updateQuery = "UPDATE recp SET password = ? WHERE username = 'executive'";
            ps = cn.c.prepareStatement(updateQuery);
            ps.setString(1, password);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // Password updated successfully, show success message and redirect to login page
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Password updated successfully!');");
                pw.println("window.location.href = \"Recp/RecpLogin.jsp\";");
                pw.println("</script>");
            } else {
                // Failed to update the password, show error message and redirect to login page
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed to update the password. Please try again.');");
                pw.println("window.location.href = \"Recp/RecpLogin.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            e.printStackTrace();
        }
    }
}
