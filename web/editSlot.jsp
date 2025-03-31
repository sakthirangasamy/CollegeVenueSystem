<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Slot</title>
    <style>
        form {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }

        input[type="text"], input[type="date"], input[type="time"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        h2 {
            text-align: center;
            padding-top: 50px;
            color: #333;
        }
    </style>
</head>
<body>

    <jsp:include page="ahome.jsp"/>

    <h2>Edit Slot</h2>

    <%
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        int slotId = Integer.parseInt(request.getParameter("id"));
        String venueName = "";
        String slotDate = "";
        String startTime = "";
        String endTime = "";
        
        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to fetch slot details
            String sqlQuery = "SELECT slots.slot_date, slots.start_time, slots.end_time, venues.venue_name "
                    + "FROM slots JOIN venues ON slots.venue_id = venues.venue_id WHERE slots.slot_id = ?";
            stmt = conn.prepareStatement(sqlQuery);
            stmt.setInt(1, slotId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                venueName = rs.getString("venue_name");
                slotDate = rs.getString("slot_date");
                startTime = rs.getString("start_time");
                endTime = rs.getString("end_time");
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

    <!-- Form to Edit Slot -->
    <form method="post" action="updateSlot.jsp">
        <input type="hidden" name="slot_id" value="<%= slotId %>" />
        <label for="venueName">Venue Name</label>
        <input type="text" name="venueName" value="<%= venueName %>" disabled />

        <label for="slotDate">Slot Date</label>
        <input type="date" name="slotDate" value="<%= slotDate %>" required />

        <label for="startTime">Start Time</label>
        <input type="time" name="startTime" value="<%= startTime %>" required />

        <label for="endTime">End Time</label>
        <input type="time" name="endTime" value="<%= endTime %>" required />

        <input type="submit" value="Update Slot" />
    </form>

</body>
</html>
