<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approve Booking</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    
    h2 {
        text-align: center;
        padding-top: 30px;
        color: #333;
    }

    form {
        width: 40%;
        margin: 100 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    label {
        font-size: 16px;
        color: #333;
        margin-bottom: 5px;
        display: block;
    }

    select, input {
        width: 100%;
        padding: 8px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    input[type="submit"] {
        background-color: black;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: white;
        color: black;
    }
</style>
<body>
    <jsp:include page="ahome.jsp"/>
    <h2>Approve or Reject Booking</h2>

    <!-- The form to approve or reject a booking -->
    <form action="approveBooking.jsp" method="POST">
        <label for="booking_id">Booking ID:</label>
        <select name="booking_id" required>
            <%
                // Fetch only "booked" booking IDs from the database
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

                    // SQL query to fetch booking IDs with status "booked"
                    String sql = "SELECT booking_id FROM bookings WHERE status = 'waiting'";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    
                    // Loop through the result set and display booking IDs
                    while (rs.next()) {
                        int bookingId = rs.getInt("booking_id");
            %>
                        <option value="<%= bookingId %>"><%= bookingId %></option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </select><br>

        <label for="status">Status:</label>
        <select name="status" required>
            <option value="booked">Booked</option>
            <option value="cancelled">Cancelled</option>
        </select><br>

        <input type="submit" value="Update Booking" />
    </form>

</body>
</html>
