<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Slot</title>
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
            height: 570px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-left: 400px;
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
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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

    <jsp:include page="ahome.jsp"/>

    <div class="container">
        <h2>Add New Slot</h2>
        <form action="addSlot.jsp" method="post">
            <div class="form-row">
                <label for="venue_id">Select Venue:</label>
                <select id="venue_id" name="venue_id" required>
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

                            // SQL query to fetch venue names
                            String sql = "SELECT venue_id, venue_name FROM venues";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            // Loop through the result set and create <option> elements
                            while (rs.next()) {
                                int venueId = rs.getInt("venue_id");
                                String venueName = rs.getString("venue_name");
                    %>
                        <option value="<%= venueId %>"><%= venueName %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
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
                </select>
            </div>
            <div class="form-row">
                <label for="slot_date">Slot Date:</label>
                <input type="date" id="slot_date" name="slot_date" required>
            </div>
            <div class="form-row">
                <label for="start_time">Start Time:</label>
                <input type="time" id="start_time" name="start_time" required>
            </div>
            <div class="form-row">
                <label for="end_time">End Time:</label>
                <input type="time" id="end_time" name="end_time" required>
            </div>
            <div class="form-row">
                <input type="submit" value="Add Slot">
            </div>
        </form>
    </div>
    
</body>
</html>
