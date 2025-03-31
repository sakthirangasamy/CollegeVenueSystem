
<!DOCTYPE html>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Events</title>
    <style>
        table {
            width: 70%;
            margin: 50px 0px 0px 360px;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <jsp:include page="uhome.jsp"/>
    
    <h2 style="text-align: center;margin-left: 300px;">List of Events</h2>

    <table>
        <thead>
            <tr>
                <th>Event ID</th>
                <th>Event Name</th>
                <th>Description</th>
                <th>Category</th>
              
                <th>Start Time</th>
                <th>End Time</th>
                <th>Venue</th>
                <th>Organizer</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
                String dbUsername = "root";
                String dbPassword = "root";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish connection to the database
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // SQL query to fetch events and related venue information
                    String sql = "SELECT e.event_id, e.event_name, e.event_description, e.event_category,e.event_start_time, e.event_end_time, v.venue_name, e.event_organizer " +
                                 "FROM events e " +
                                 "JOIN venues v ON e.venue_id = v.venue_id";

                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Display event data in table rows
                    while (rs.next()) {
                        int eventId = rs.getInt("event_id");
                        String eventName = rs.getString("event_name");
                        String eventDescription = rs.getString("event_description");
                        String eventCategory = rs.getString("event_category");
                      
                        Time eventStartTime = rs.getTime("event_start_time");
                        Time eventEndTime = rs.getTime("event_end_time");
                        String venueName = rs.getString("venue_name");
                        String eventOrganizer = rs.getString("event_organizer");
            %>
            <tr>
                <td><%= eventId %></td>
                <td><%= eventName %></td>
                <td><%= eventDescription %></td>
                <td><%= eventCategory %></td>
            
                <td><%= eventStartTime %></td>
                <td><%= eventEndTime %></td>
                <td><%= venueName %></td>
                <td><%= eventOrganizer %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<h2>Error: " + e.getMessage() + "</h2>");
                } finally {
                    // Close database connections
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
