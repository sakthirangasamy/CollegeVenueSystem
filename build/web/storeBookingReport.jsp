<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Booking Report</title>
</head>
<body>
    <jsp:include page="uhome.jsp"/>
    <h2 style="text-align:center;">Booking Report Stored</h2>

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
                         "JOIN users u ON b.user_id = u.id " +
                         "JOIN slots s ON b.slot_id = s.slot_id " +
                         "JOIN venues v ON s.venue_id = v.venue_id";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            // Insert the results into another table (e.g., booking_reports)
            String insertSql = "INSERT INTO booking_reports (booking_id, username, venue_name, location, slot_date, start_time, end_time, status) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = conn.prepareStatement(insertSql);

            // Process each row from the ResultSet and insert into the new table
            while (rs.next()) {
                pst.setInt(1, rs.getInt("booking_id"));
                pst.setString(2, rs.getString("username"));
                pst.setString(3, rs.getString("venue_name"));
                pst.setString(4, rs.getString("venue_location"));
                pst.setDate(5, rs.getDate("slot_date"));
                pst.setTime(6, rs.getTime("start_time"));
                pst.setTime(7, rs.getTime("end_time"));
                pst.setString(8, rs.getString("status"));
                pst.executeUpdate(); // Insert the record into booking_reports
            }

            out.println("<p>Booking report has been successfully stored in the database.</p>");

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
</body>
</html>
