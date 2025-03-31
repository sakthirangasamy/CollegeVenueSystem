<%@page import="java.math.BigDecimal"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation</title>
</head>
<body>
    <h2>Payment Confirmation</h2>

    <%
        // Get the form parameters
        String bookingId = request.getParameter("booking_id");
        String amount = request.getParameter("amount");
        String paymentStatus = request.getParameter("payment_status");

        // Convert amount to double
        double amountValue = Double.parseDouble(amount);

        // Check if the amount exceeds 1 lakh (100,000)
        if (amountValue > 100000) {
            out.println("<script type='text/javascript'>alert('Error: Amount cannot exceed 1 lakh (100,000).');</script>");
            return; // Exit without processing payment
        }

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to insert payment details into the 'payments' table
            String sql = "INSERT INTO payments (booking_id, amount, status) VALUES (?, ?, ?)";

            pst = conn.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(bookingId));
            pst.setBigDecimal(2, new BigDecimal(amount));
            pst.setString(3, paymentStatus);

            // Execute the insertion
            int rowsAffected = pst.executeUpdate();

            // Success or error message
            if (rowsAffected > 0) {
                out.println("<script type='text/javascript'>alert('Payment has been processed successfully!');</script>");
            response.sendRedirect("eventPayement.jsp");
            } else {
                out.println("<script type='text/javascript'>alert('There was an issue processing the payment. Please try again.');</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>alert('Error: " + e.getMessage() + "');</script>");
        } finally {
            // Close database connections
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
