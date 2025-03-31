<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Slot</title>
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

        int slotId = Integer.parseInt(request.getParameter("id"));

        try {
            // Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to delete the slot
            String sqlDelete = "DELETE FROM slots WHERE slot_id = ?";
            stmt = conn.prepareStatement(sqlDelete);
            stmt.setInt(1, slotId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("viewSlots.jsp");
                out.println("<h2>Slot deleted successfully!</h2>");
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
