<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Slot</title>
</head>
<body>

    <jsp:include page="ahome.jsp"/>

    <%
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";
        String dbUsername = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;

        int slotId = Integer.parseInt(request.getParameter("slot_id"));
        String slotDate = request.getParameter("slotDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to update the slot
            String sqlUpdate = "UPDATE slots SET slot_date = ?, start_time = ?, end_time = ? WHERE slot_id = ?";
            stmt = conn.prepareStatement(sqlUpdate);
            stmt.setString(1, slotDate);
            stmt.setString(2, startTime);
            stmt.setString(3, endTime);
            stmt.setInt(4, slotId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
               
                response.sendRedirect("viewSlots.jsp");
                 out.println("<h2>Slot updated successfully!</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</body>
</html>
