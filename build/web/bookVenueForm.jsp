<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Venue</title>
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

        select, input[type="date"], input[type="time"] {
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

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .form-row {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .error-message {
            color: red;
            font-size: 14px;
        }

    </style>
</head>
<body>
    <jsp:include page="uhome.jsp"/>
    <h2>Book a Slot</h2>
    <form action="bookVenue.jsp" method="post">
        <label for="slot_id">Select Slot:</label>
        <select id="slot_id" name="slot_id">
            <% 
                // Fetch available slots from the database, excluding already booked slots
                String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
                String dbUsername = "root";
                String dbPassword = "root";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // Query to fetch available slots, excluding already booked slots
                    String sql = "SELECT s.slot_id, CONCAT(s.slot_date, ' ', s.start_time, ' - ', s.end_time) AS slot_time " +
                                 "FROM slots s " +
                                 "LEFT JOIN bookings b ON s.slot_id = b.slot_id " +
                                 "WHERE b.slot_id IS NULL AND s.slot_date >= CURDATE()"; // Only show available slots from today onwards
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    
                    while (rs.next()) {
                        int slotId = rs.getInt("slot_id");
                        String slotTime = rs.getString("slot_time");
            %>
                        <option value="<%= slotId %>"><%= slotTime %></option>
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
        </select><br><br>
        <input type="submit" value="Book Slot">
    </form>
</body>
</html>
