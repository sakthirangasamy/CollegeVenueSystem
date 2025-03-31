<%-- 
    Document   : venuemanagement
    Created on : 20 Jan, 2025, 4:21:13 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
  
        .container {
            width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: absolute;
            left: 500px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 8px 0;
            font-weight: bold;
        }

        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="text"] {
            width: 100%;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
    </head>
    <body>
        <jsp:include page="ahome.jsp"/>
 <div class="container">
        <h1>Add New Venue</h1>
        <form action="addVenue.jsp" method="post">
            <div class="form-group">
                <label for="venue_name">Venue Name:</label>
                <input type="text" id="venue_name" name="venue_name" required>
            </div>
            
            <div class="form-group">
                <label for="venue_type">Venue Type:</label>
                <input type="text" id="venue_type" name="venue_type" required>
            </div>
            
            <div class="form-group">
                <label for="venue_location">Venue Location:</label>
                <input type="text" id="venue_location" name="venue_location" required>
            </div>

            <input type="submit" value="Add Venue">
        </form>
    </div>
    </body>
</html>
