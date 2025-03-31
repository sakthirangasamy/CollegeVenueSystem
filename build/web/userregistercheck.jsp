<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Status</title>
</head>
<body>
    <%
        // Get form data from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root"; // Change to your MySQL username
        String dbPassword = "root"; // Change to your MySQL password

        // Connection object
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to insert user data into the 'users' table
            String sql = "INSERT INTO users (username, password, email, contact, address, gender) VALUES (?, ?, ?, ?, ?, ?)";

            // Prepare the statement and set parameters
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, email);
            pst.setString(4, contact);
            pst.setString(5, address);
            pst.setString(6, gender);

            // Execute the query
            int result = pst.executeUpdate();

            if (result > 0) {
            
                 response.sendRedirect("userlogin.jsp");
                      out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"Registration successful! You can now Login'\")");
                        out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"Registration failed! Please try again.'\")");
                        out.println("</script>");
                response.sendRedirect("userregister.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
        } finally {
            // Close the database connections
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
