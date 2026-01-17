<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="connect.Connect" %>
<%
    PreparedStatement ps;
    Connect cn;
    ResultSet rs;
    cn = new Connect();
    cn.DataConnection();

    String id = request.getParameter("id");
    String newPayAmount = request.getParameter("newPayAmount");
    String newItemName = request.getParameter("newItemName");
    String newItemPrice = request.getParameter("newItemPrice");
    String[] selectedTestsData = request.getParameter("selectedTestsInput").split(";");
    try {
        ps = cn.c.prepareStatement("SELECT total_amount, pay_amount, selected_tests FROM billing_table WHERE id = ?");
        ps.setString(1, id);
        rs = ps.executeQuery();
        
        double totalAmount = 0.0;
        double currentPayAmount = 0.0;
        String selectedTests = "";
        
        if (rs.next()) {
            totalAmount = rs.getDouble("total_amount");
            currentPayAmount = rs.getDouble("pay_amount");
            selectedTests = rs.getString("selected_tests");
        }
       
        // Add the price of the new item to the total amount
        newItemPrice = request.getParameter("newItemPrice");
        // Check if newItemPrice is not empty or null before parsing it
    double newItemPriceDouble = 0.0; // Default value if newItemPrice is empty or null
      if (newItemPrice != null && !newItemPrice.trim().isEmpty()) {
          try {
              newItemPriceDouble = Double.parseDouble(newItemPrice.trim());
          } catch (NumberFormatException e) {
              // Handle the case where the string cannot be parsed to a double
              // You can log the error or perform any other necessary actions
              e.printStackTrace();
              // You may want to set an error message or handle it differently
          }
      }


      totalAmount += newItemPriceDouble;

        // Calculate the new pending amount after updating the pay amount
        double newPendingAmount = currentPayAmount + Double.parseDouble(newPayAmount);
        // Calculate the pending amount
        double pendingAmount = totalAmount - newPendingAmount;

        // Append the new item and its price to the selected tests
        selectedTests += ","+newItemName + ":" + newItemPrice ;

        // Update the billing table
        ps = cn.c.prepareStatement("UPDATE billing_table SET pay_amount = ?, pending_amount = ?, selected_tests = ?, total_amount = ? WHERE id = ?");
        ps.setDouble(1, newPendingAmount);
        ps.setDouble(2, pendingAmount);
        ps.setString(3, selectedTests);
        ps.setDouble(4, totalAmount);
        ps.setString(5, id);

        int updatedRows = ps.executeUpdate();

        if (updatedRows > 0) {
            // Redirect to a success page or display a success message
        	response.sendRedirect("BillSlip.jsp?id=" + id);
        } else {
            out.println("<script>alert('An error occurred while updating the bill. Please try again later.'); window.location.href = 'ViewBill.jsp';</script>");
        }
    } catch (SQLException e) {
        // Handle database errors
        e.printStackTrace();
        // Redirect to an error page or display an error message
        response.sendRedirect("Error.jsp");
    }
%>
