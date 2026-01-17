package Bill;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

public class BillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String patientID = request.getParameter("patientID");
        String patientName = request.getParameter("patientName");
        String date = request.getParameter("date");
        String payAmountStr = request.getParameter("payAmount");
        String[] selectedTestNames = request.getParameterValues("selectedTest");
        String[] selectedTestPrices = request.getParameterValues("testPrice");

        // Check if selectedTestPrices array is null or empty
        if (selectedTestPrices == null || selectedTestPrices.length == 0) {
            out.println("No selected tests found.");
            return;
        }

        // Convert pay amount to double
        
        double payAmount = 0.0; // Default value if payAmountStr is empty
        if (payAmountStr != null && !payAmountStr.isEmpty()) {
            payAmount = Double.parseDouble(payAmountStr);
        }
        // Calculate total amount
        double totalAmount = 0;
        for (String price : selectedTestPrices) {
            totalAmount += Double.parseDouble(price);
        }

        // Calculate pending amount
        double pendingAmount = totalAmount - payAmount;

        // Construct selected tests string
        StringBuilder selectedTests = new StringBuilder();
        for (int i = 0; i < selectedTestNames.length; i++) {
            selectedTests.append(selectedTestNames[i]).append(" - Rs ").append(selectedTestPrices[i]);
            if (i < selectedTestNames.length - 1) {
                selectedTests.append(", ");
            }
        }

        // Database connection and insertion logic
      
        Connect cn = new Connect();
            cn.DataConnection();

            // Insert data into the billing_table
            try (PreparedStatement stmt = cn.c.prepareStatement("INSERT INTO billing_table (patient_id, patient_name, date, selected_tests, total_amount, pay_amount, pending_amount) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
                stmt.setString(1, patientID);
                stmt.setString(2, patientName);
                stmt.setString(3, date);
                stmt.setString(4, selectedTests.toString());
                stmt.setDouble(5, totalAmount);
                stmt.setDouble(6, payAmount);
                stmt.setDouble(7, pendingAmount);
                stmt.executeUpdate();

                out.println("Data inserted successfully!"); // Send response back to client
            } catch (SQLException se) {
                // Log the exception for debugging
                se.printStackTrace();
                out.println("An error occurred while processing the request.");
            }
        
    }
}
