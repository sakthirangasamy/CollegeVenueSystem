<%-- 
    Document   : profile
    Created on : 11 Nov, 2024, 3:43:25 PM
    Author     : admin
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                color: black;
                width: 30%;
                letter-spacing: 0.3px;
                margin-top: 150px;
                margin-left: 500px;
                border-collapse: collapse;
                position: absolute;
                left: 150px;
                top: 30px;

            }

            table, th, td {
                border: 1px solid black;
                text-align: left;
                padding: 10px;
            }

            th {
              
                color: white;
                font-weight: bold;
            }

            td {
                color: black;
                font-weight: normal;
                background-color: white;
            }


            hr {
                border: 0; /* Remove default border */
                height: 1px;
                background-color: lightgray; /* Line color */
                margin: 10px 0; /* Space around line */
            }

        </style>
    </head>

    <body>
        <jsp:include page="uhome.jsp"/>



        <%
            String uname = (String) session.getAttribute("user");

        %>
        <table>
            <tr>
                <td style="text-align: center;" colspan="2">MY Profile</td>
            </tr>

            <%        Connection con = null;
                PreparedStatement p = null;
                ResultSet r = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegevenuesystem", "root", "root");
                    p = con.prepareStatement("SELECT * FROM users WHERE username = ?");
                    p.setString(1, uname);

                    r = p.executeQuery();

                    while (r.next()) {
                        String tid = r.getString("id");
                        String symbol = r.getString("username");
                        String name = r.getString("password");
                        String email = r.getString("email");
                        String contact = r.getString("contact");
                        String address = r.getString("address");
                        String gender = r.getString("gender");

            %>
            <tr>
                <td>S.NO</td>
                <td><%= tid%></td>
            </tr>
            <tr>
                <td>User Name</td>
                <td><%= symbol%></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><%= name%></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= email%></td>
            </tr>
             <tr>
                <td>Contact</td>
                <td><%= contact%></td>
            </tr>
             <tr>
                <td>Address</td>
                <td><%=address%></td>
            </tr>
             <tr>
                <td>Gender</td>
                <td><%= gender%></td>
            </tr>


            <%
                    }
                } catch (ClassNotFoundException e) {
                    out.println("JDBC Driver not found: " + e.getMessage());
                } catch (SQLException e) {
                    out.println("Database error: " + e.getMessage());
                } finally {
                    // Close resources
                    try {
                        if (r != null) {
                            r.close();
                        }
                        if (p != null) {
                            p.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        out.println("Error closing resources: " + e.getMessage());
                    }
                }
            %>
        </table>
    </body>
</html>


