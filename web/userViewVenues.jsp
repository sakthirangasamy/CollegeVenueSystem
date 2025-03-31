<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Venues</title>
    <style>
        table {
            width: 70%;
            border-collapse: collapse;
            margin: 20px 0;
            position: absolute;
            left: 300px;
            top: 100px;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-btn {
            padding: 6px 12px;
            margin: 0 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
        }

        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }

        .view-btn {
            background-color: #2196F3;
            color: white;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .action-btn i {
            margin-right: 5px;
        }

        /* Set fixed width for the Actions column */
        th.actions, td.actions {
            width: 150px;
            text-align: center;
        }

        th:nth-child(n):last-child {
            background-color: #dcdcdc;
            width: 300px;
            text-align: center;
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="uhome.jsp"/>
    <h2 style="text-align:center;padding-left: 100px;padding-top:50px ">List of Venues</h2>

    <table>
        <thead>
            <tr>
                <th>Venue ID</th>
                <th>Venue Name</th>
                <th>Venue Type</th>
                <th>Venue Location</th>
            
            </tr>
        </thead>
        <tbody>
            <%
                String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
                String dbUsername = "root";
                String dbPassword = "root";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load MySQL driver
                    Class.forName("com.mysql.jdbc.Driver");

                    // Connect to the database
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // SQL query to select all venues
                    String sql = "SELECT * FROM venues";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Display the venues in the table
                    while (rs.next()) {
                        String venueId = rs.getString("venue_id");
                        String venueName = rs.getString("venue_name");
                        String venueType = rs.getString("venue_type");
                        String venueLocation = rs.getString("venue_location");

            %>
            <tr>
                <td><%= venueId %></td>
                <td><%= venueName %></td>
                <td><%= venueType %></td>
                <td><%= venueLocation %></td>
               
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
