<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <style>
        table {
            width: 70%;
           position: absolute;
           top: 100px;
           left: 320px;
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
     <jsp:include page="ahome.jsp"/> 
    
   <!-- Include navigation or home page -->
    <table border="1">
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>Booking ID</th>
                <th>Venue Name</th>
                <th>Location</th>
                <th>Booking Date</th>
                <th>Payment Date</th>
                <th>Amount</th>
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
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Establish connection to the database
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // SQL query to fetch payment details with venue information
                    String sql = "SELECT p.payment_id, p.booking_id, v.venue_name, v.venue_location, b.booking_date, " +
                                 "p.payment_date, p.amount, p.status " +
                                 "FROM payments p " +
                                 "JOIN bookings b ON p.booking_id = b.booking_id " +
                                 "JOIN slots s ON b.slot_id = s.slot_id " +
                                 "JOIN venues v ON s.venue_id = v.venue_id";

                    // Prepare and execute the query
                    pst = conn.prepareStatement(sql);
                    rs = pst.executeQuery();

                    // Loop through the result set and display data
                    while (rs.next()) {
                        int paymentId = rs.getInt("payment_id");
                        int bookingId = rs.getInt("booking_id");
                        String venueName = rs.getString("venue_name");
                        String venueLocation = rs.getString("venue_location");
                        Timestamp bookingDate = rs.getTimestamp("booking_date");
                        Timestamp paymentDate = rs.getTimestamp("payment_date");
                        double amount = rs.getDouble("amount");
                        String status = rs.getString("status");

            %>
            <tr>
                <td><%= paymentId %></td>
                <td><%= bookingId %></td>
                <td><%= venueName %></td>
                <td><%= venueLocation %></td>
                <td><%= bookingDate %></td>
                <td><%= paymentDate %></td>
                <td><%= amount %></td>
                <td><%= status %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close database connections
                    try {
                        if (rs != null) rs.close();
                        if (pst != null) pst.close();
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
