<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Venue</title>
    <style>
        /* Add your CSS here */
        form {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        label {
            display: block;
            margin: 10px 0;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <jsp:include page="ahome.jsp"/>

    <h2 style="text-align:center;">Edit Venue Details</h2>

    <%
        // Get the venue ID from the query string
        String venueId = request.getParameter("id");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String venueName = "", venueType = "", venueLocation = "";

        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to retrieve the venue details by ID
            String sql = "SELECT * FROM venues WHERE venue_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, venueId);
            rs = stmt.executeQuery();

            // Retrieve the venue details
            if (rs.next()) {
                venueName = rs.getString("venue_name");
                venueType = rs.getString("venue_type");
                venueLocation = rs.getString("venue_location");
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

    <!-- Form to edit venue details -->
    <form action="updateVenue.jsp" method="post">
        <input type="hidden" name="venue_id" value="<%= venueId %>">
        
        <label for="venue_name">Venue Name:</label>
        <input type="text" id="venue_name" name="venue_name" value="<%= venueName %>" required><br><br>

        <label for="venue_type">Venue Type:</label>
        <input type="text" id="venue_type" name="venue_type" value="<%= venueType %>" required><br><br>

        <label for="venue_location">Venue Location:</label>
        <input type="text" id="venue_location" name="venue_location" value="<%= venueLocation %>" required><br><br>

        <input type="submit" value="Update Venue">
    </form>
</body>
</html>
