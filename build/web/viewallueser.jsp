<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Status</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            position: absolute;
            left: 500px;
            top: 100px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
               background-color: #1d1b31;
               color: whitesmoke;
        }
    </style>
</head>
<body>
    <jsp:include page="ahome.jsp"/>
    <%
      

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root"; // Change to your MySQL username
        String dbPassword = "root"; // Change to your MySQL password

        // Connection object
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);



            // SQL query to retrieve all users from the 'users' table
            String sqlSelect = "SELECT * FROM users";
            pst = conn.prepareStatement(sqlSelect);
            rs = pst.executeQuery();

            // Display user data in a table
 
            out.println("<table>");
            out.println("<tr><th>Username</th><th>Email</th><th>Contact</th><th>Address</th><th>Gender</th></tr>");
            while (rs.next()) {
                String username = rs.getString("username");
                String dbEmail = rs.getString("email");
                String dbContact = rs.getString("contact");
                String dbAddress = rs.getString("address");
                String dbGender = rs.getString("gender");
                
                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + dbEmail + "</td>");
                out.println("<td>" + dbContact + "</td>");
                out.println("<td>" + dbAddress + "</td>");
                out.println("<td>" + dbGender + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
        } finally {
            // Close the database connections
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
