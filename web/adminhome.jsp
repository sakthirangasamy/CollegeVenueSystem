<%-- 
    Document   : adminhome
    Created on : 25 Dec, 2024, 9:36:44 PM
    Author     : admin
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .card {

            margin-top: 20px;
            padding: 35px;
            background-color: #1d1b31;
            color: white;
            font-size: 22px;  /* Increase font size */
            font-weight: 600;
            border-radius: 10px;  /* Slightly rounded corners */
            text-align: center;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2); /* Attractive box shadow */
            transition: all 0.3s ease; /* Smooth transition for hover effects */
        }

        .card:hover {
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.3); /* Slightly larger shadow on hover */
            transform: translateY(-5px);  /* Card slightly lifted on hover */
        }

        .card .icon {
            font-size: 40px; /* Increase the size of the icon */
            margin-bottom: 10px; /* Space between the icon and the text */
        }
       
        
    </style>
    <body>
        <jsp:include page="ahome.jsp"/>
        <div class="dashboard">


            <%
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/collegevenuesystem";  // Change this to your database URL
                String dbUsername = "root";  // Change to your MySQL username
                String dbPassword = "root";  // Change to your MySQL password

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load the MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");  // For MySQL 8 and above

                    // Establish connection to the database
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                    // Query to count the total number of users
                    String countQuery = "SELECT COUNT(*) FROM users";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(countQuery);

                    int userCount = 0;
                    if (rs.next()) {
                        userCount = rs.getInt(1); // Get the user count from the query result
                    }

            %>
            <!-- Display the user count -->
            <div class="card" style="position: absolute; left: 400px; top: 40px;">
                <i class='bx bxs-group icon' style="font-size: 50px"></i>
                <h2> Users Count: <%= userCount%></h2>
            </div>
           
      
        </div>
         <canvas id="userCountChart" style="max-width: 250px; max-height: 250px; position: absolute;left: 890px;top: 310px;"></canvas>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Get the canvas context
    var ctx = document.getElementById('userCountChart').getContext('2d');
    
    // Create the pie chart
    var userCountChart = new Chart(ctx, {
        type: 'pie',  // Pie chart type
        data: {
            labels: ['Users', 'Others'],  // Example categories
            datasets: [{
                label: 'User Count',
                data: [<%= userCount %>, 10 - <%= userCount %>],  // User data
                backgroundColor: ['rose', 'blue'],  // Colors for segments
                borderColor: ['#ffffff', '#ffffff'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,  // Ensure responsiveness
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            size: 20  // Decrease the legend font size for small chart
                        }
                    }
                },
                tooltip: {
                    enabled: true,
                    bodyFont: {
                        size: 8  // Decrease the tooltip font size for small chart
                    }
                }
            }
        }
    });
</script>


        <%
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
            } finally {
                // Close the database connections
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

  

</body>
</html>
