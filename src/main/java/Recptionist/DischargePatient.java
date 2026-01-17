package Recptionist;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

public class DischargePatient extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String patientId = request.getParameter("patientId");
        String dischargeDate = request.getParameter("dischargeDate");

        // Update discharge date in the database
        try {
            Connect cn = new Connect();
            cn.DataConnection();
            String query = "UPDATE offlineslip SET dischargedate = ? WHERE id = ? ";
            PreparedStatement ps = cn.c.prepareStatement(query);
            ps.setString(1, dischargeDate);
            ps.setString(2, patientId);
            
            int rowsUpdated = ps.executeUpdate();
            cn.c.close();

            // Redirect to a confirmation page or display a success message
            if (rowsUpdated > 0) {
            	PrintWriter pw = response.getWriter();
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Patient Discharge Successfully!');");
                pw.println("window.location.href = \"Admin/Dashboard.jsp\";");
                pw.println("</script>");
            } else {
            	PrintWriter pw = response.getWriter();
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Please Try Again');");
                pw.println("window.location.href = \"Admin/Dashboard.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException se) {
            // Handle database errors
            se.printStackTrace();
            response.sendRedirect("Error.jsp");
        }
    }
}
