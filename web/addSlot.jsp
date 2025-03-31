<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Slot</title>
</head>
<body>
    <jsp:include page="ahome.jsp"/>
    <h2 style="text-align:center;">Add New Slot</h2>

    <%
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem"; // Change with your DB info
        String dbUsername = "root"; // Database username
        String dbPassword = "root"; // Database password
        Connection conn = null;
        PreparedStatement pst = null;
        String venue_id = request.getParameter("venue_id");
        String slot_date = request.getParameter("slot_date");
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");

        if (venue_id != null && slot_date != null && start_time != null && end_time != null) {
            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish connection to the database
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                // SQL query to insert a new slot
                String sql = "INSERT INTO slots (venue_id, slot_date, start_time, end_time) VALUES (?, ?, ?, ?)";
                pst = conn.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(venue_id)); // Set venue_id
                pst.setDate(2, Date.valueOf(slot_date));   // Convert string date to Date object
                pst.setTime(3, Time.valueOf(start_time + ":00")); // Convert string time to Time object
                pst.setTime(4, Time.valueOf(end_time + ":00"));   // Convert string time to Time object

                // Execute the insert query
                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<h3>Slot added successfully!</h3>");
                    response.sendRedirect("viewSlots.jsp");
                } else {
                    out.println("<h3>Error: Slot could not be added.</h3>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            } finally {
                // Close the database resources
                try {
                    if (pst != null) pst.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

</body>
</html>
