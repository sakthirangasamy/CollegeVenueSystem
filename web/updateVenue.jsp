<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Venue</title>
</head>
<body>
    <jsp:include page="ahome.jsp"/>

    <%
        // Get the updated venue details from the form
        String venueId = request.getParameter("venue_id");
        String venueName = request.getParameter("venue_name");
        String venueType = request.getParameter("venue_type");
        String venueLocation = request.getParameter("venue_location");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to update venue details
            String sql = "UPDATE venues SET venue_name = ?, venue_type = ?, venue_location = ? WHERE venue_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, venueName);
            stmt.setString(2, venueType);
            stmt.setString(3, venueLocation);
            stmt.setString(4, venueId);

            // Execute the update query
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h3>Venue details updated successfully.</h3>");
             response.sendRedirect("viewVenues.jsp");
            } else {
                out.println("<h3>Error: Venue not updated!</h3>");
            }
        } catch (Exception e) {
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
