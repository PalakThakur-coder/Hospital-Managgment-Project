package Admin;

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

public class UpdateTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            // Retrieve form data
            String testName = request.getParameter("testName");
            double newTestFee = Double.parseDouble(request.getParameter("testFee"));

            // Update test fee in the database
            Connect cn = new Connect();
            cn.DataConnection();
            String updateQuery = "UPDATE tests SET test_fee = ? WHERE test_name = ?";
            PreparedStatement pstmt = cn.c.prepareStatement(updateQuery);
            pstmt.setDouble(1, newTestFee);
            pstmt.setString(2, testName);
            int rowsUpdated = pstmt.executeUpdate();

            // Check if the update was successful
            if (rowsUpdated > 0) {
                // Display a success message using JavaScript alert
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Test information updated successfully.');");
                out.println("window.location.href = \"Admin/ViewTest.jsp\";"); // Redirect to view test page
                out.println("</script>");
            } else {
                // Display an error message if the update failed
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Failed to update test information. Please try again.');");
                out.println("window.location.href = \"Admin/ViewTest.jsp\";"); // Redirect to view test page
                out.println("</script>");
            }
        } catch (NumberFormatException | SQLException e) {
            // Handle exceptions
            out.println("<script type=\"text/javascript\">");
            out.println("alert('An error occurred. Please try again.');");
            out.println("window.location.href = \"Admin/ViewTest.jsp\";"); // Redirect to view test page
            out.println("</script>");
            e.printStackTrace(); // Print stack trace for debugging
        }
    }
}
