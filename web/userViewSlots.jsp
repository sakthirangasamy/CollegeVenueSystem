<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Slots</title>
    <style>
        table {
            width: 60%;
            margin-left: 400px;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        .action-btn {
            padding: 6px 12px;
            margin: 5px;
            cursor: pointer;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
        }

        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .action-btn i {
            margin-right: 5px;
        }

        h2 {
            text-align: center;
            padding-top: 50px;
            color: #333;
        }
    </style>
</head>
<body>

    <jsp:include page="uhome.jsp"/>
    
    <h2>View All Slots</h2>

    <table>
        <thead>
            <tr>
                <th>Slot ID</th>
                <th>Venue Name</th>
                <th>Slot Date</th>
                <th>Start Time</th>
                <th>End Time</th>
               
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
                    // Load the MySQL driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Connect to the database
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // SQL query to select all slots
                    String sqlQuery = "SELECT slots.slot_id, slots.slot_date, slots.start_time, slots.end_time, venues.venue_name FROM slots JOIN venues ON slots.venue_id = venues.venue_id";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sqlQuery);

                    // Display slots in the table
                    while (rs.next()) {
                        int slotId = rs.getInt("slot_id");
                        String venueName = rs.getString("venue_name");
                        String slotDate = rs.getString("slot_date");
                        String startTime = rs.getString("start_time");
                        String endTime = rs.getString("end_time");

            %>
            <tr>
                <td><%= slotId %></td>
                <td><%= venueName %></td>
                <td><%= slotDate %></td>
                <td><%= startTime %></td>
                <td><%= endTime %></td>
               
            </tr>
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
        </tbody>
    </table>

</body>
</html>
