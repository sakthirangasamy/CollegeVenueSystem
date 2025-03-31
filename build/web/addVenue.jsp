<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Venue</title>
</head>
<body>
    <% 
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem"; // Database URL
        String dbUsername = "root"; // Database username
        String dbPassword = "root"; // Database password

        Connection conn = null;
        PreparedStatement pst = null;

        // Get form data
        String venueName = request.getParameter("venue_name");
        String venueType = request.getParameter("venue_type");
        String venueLocation = request.getParameter("venue_location");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to insert new venue into the database
            String sqlInsert = "INSERT INTO venues (venue_name, venue_type, venue_location) VALUES (?, ?, ?)";
            
            // Prepare the statement
            pst = conn.prepareStatement(sqlInsert);
            
            // Set the parameters
            pst.setString(1, venueName);
            pst.setString(2, venueType);
            pst.setString(3, venueLocation);

            // Execute the update
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h3>Venue added successfully!</h3>");
                response.sendRedirect("viewVenues.jsp");
            } else {
                out.println("<h3>Error adding venue.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
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
