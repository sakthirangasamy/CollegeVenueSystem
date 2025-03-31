<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
</head>
<body>
    <h2>Booking Confirmation</h2>
    <%
        // Get the selected slot ID from the form
        String slotId = request.getParameter("slot_id");
        System.out.println(slotId);
        // Get the user ID (assumed to be logged in and available in session)
  
        Integer userId = (Integer) session.getAttribute("user_id");  // Assuming user is logged in and their user_id is stored in session
        System.out.println(userId);
        if (userId == null || slotId == null) {
            out.println("<p>Error: Missing user or slot information.</p>");
        } else {
            // Database connection
            String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
            String dbUsername = "root";
            String dbPassword = "root";
            Connection conn = null;
            PreparedStatement pstmt = null;
            int bookingStatus = 0;  // 0 = failure, 1 = success
            
            try {
                // Establish connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                
                // Insert booking into the bookings table
                String sql = "INSERT INTO bookings (user_id, slot_id, status) VALUES (?, ?, 'waiting')";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, userId);
                pstmt.setInt(2, Integer.parseInt(slotId));
                
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    bookingStatus = 1; // Booking successful
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (bookingStatus == 1) {
                out.println("<p>Booking successful! Your slot has been reserved.</p>");
                response.sendRedirect("viewBookingSlot.jsp");
            } else {
                out.println("<p>Sorry, there was an error while processing your booking.</p>");
            }
        }
    %>
</body>
</html>
