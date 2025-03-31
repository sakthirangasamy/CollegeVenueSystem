<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Created</title>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
            window.location.href = 'viewEvents.jsp'; // Redirect to the event list after showing the alert
        }
    </script>
</head>
<body>
    <jsp:include page="uhome.jsp"/>

    <h2>Event Creation</h2>

    <%
        // Retrieve the form data
        String eventName = request.getParameter("event_name");
        String eventDescription = request.getParameter("event_description");
        String eventCategory = request.getParameter("event_category");
        String eventStartTime = request.getParameter("event_start_time");
        String eventEndTime = request.getParameter("event_end_time");
        String eventOrganizer = request.getParameter("event_organizer");
        String venueId = request.getParameter("venue_id");

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

            // SQL query to insert event details into the 'events' table
            String sql = "INSERT INTO events (event_name, event_description, event_category, event_start_time, event_end_time, venue_id, event_organizer) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";

            pst = conn.prepareStatement(sql);
            pst.setString(1, eventName);
            pst.setString(2, eventDescription);
            pst.setString(3, eventCategory);
            pst.setTime(4, Time.valueOf(eventStartTime + ":00"));
            pst.setTime(5, Time.valueOf(eventEndTime + ":00"));
            pst.setInt(6, Integer.parseInt(venueId));
            pst.setString(7, eventOrganizer);

            // Execute the insertion
            int rowsAffected = pst.executeUpdate();

            // Success or error alert
            if (rowsAffected > 0) {
                out.println("<script type='text/javascript'>showAlert('Event has been successfully created!');</script>");
            } else {
                out.println("<script type='text/javascript'>showAlert('There was an issue creating the event. Please try again.');</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>showAlert('Error: " + e.getMessage() + "');</script>");
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
