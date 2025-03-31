<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approve Booking - Result</title>
</head>
<body>
    <h2>Booking Approval Status</h2>

    <%
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement pst = null;
        
        // Get form data from the request
        String bookingId = request.getParameter("booking_id");
        String status = request.getParameter("status");
        String message = "";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to update the booking status
            String updateQuery = "UPDATE bookings SET status = ? WHERE booking_id = ?";

            // Prepare the statement and set parameters
            pst = conn.prepareStatement(updateQuery);
            pst.setString(1, status);
            pst.setInt(2, Integer.parseInt(bookingId));

            // Execute the update query
            int rowsAffected = pst.executeUpdate();

            // Prepare the message for the alert
            if (rowsAffected > 0) {
                message = "Booking ID " + bookingId + " has been successfully updated to " + status + ".";
//                response.sendRedirect("Bookingapproval.jsp");
            } else {
                message = "Failed to update the booking status. Please check the booking ID.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "Error occurred: " + e.getMessage();
        } finally {
            // Close the database connection
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    
 <script type="text/javascript">
        alert("<%= message %>");
        window.location.href = "Bookingapproval.jsp"; // Optional: Redirect to another page after showing alert
    </script>
</body>
</html>
