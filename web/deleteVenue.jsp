<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Venue</title>
</head>
<body>
    <jsp:include page="ahome.jsp"/>

    <%
        // Get the venue ID from the query string
        String venueId = request.getParameter("id");
  System.out.println(venueId);
        // Debugging: Check if venueId is being passed correctly
        if (venueId == null || venueId.isEmpty()) {
            out.println("<h3>Error: Venue ID is missing!</h3>");
            return;
        }

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver"); // Updated driver for MySQL 8
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to delete venue
            String sql = "DELETE FROM venues WHERE venue_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, venueId);

            // Execute the delete query
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h3>Venue deleted successfully.</h3>");
             response.sendRedirect("viewVenues.jsp");
            } else {
                out.println("<h3>Error: Venue not deleted! It may not exist.</h3>");
            }
        } catch (SQLException e) {
            out.println("<h3>Error executing SQL: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<h3>Unexpected error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
