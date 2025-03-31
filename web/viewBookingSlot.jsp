<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <style>
        table {
            width: 50%;
            margin: 50px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
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
    <h2 style="text-align:center;">View All Bookings</h2>

    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>User</th>
                <th>Venue Name</th>
                <th>Location</th>
                <th>Slot Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Status</th>
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

                    // SQL query to join bookings with venues, slots, and users
                    String sql = "SELECT b.booking_id, u.username, v.venue_name, v.venue_location, s.slot_date, s.start_time, s.end_time, b.status " +
                                 "FROM bookings b " +
                                 "JOIN users u ON b.user_id = u.id " +  // Corrected the join condition
                                 "JOIN slots s ON b.slot_id = s.slot_id " +
                                 "JOIN venues v ON s.venue_id = v.venue_id";

                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Display data in the table
                    while (rs.next()) {
                        int bookingId = rs.getInt("booking_id");
                        String username = rs.getString("username");
                        String venueName = rs.getString("venue_name");
                        String location = rs.getString("venue_location");
                        Date slotDate = rs.getDate("slot_date");
                        Time startTime = rs.getTime("start_time");
                        Time endTime = rs.getTime("end_time");
                        String status = rs.getString("status");
            %>
            <tr>
                <td><%= bookingId %></td>
                <td><%= username %></td>
                <td><%= venueName %></td>
                <td><%= location %></td>
                <td><%= slotDate %></td>
                <td><%= startTime %></td>
                <td><%= endTime %></td>
                <td><%= status %></td>
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
