<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            text-align: center;
            padding-top: 30px;
            color: #333;
        }

        form {
            width: 37%;
            margin: 10px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="date"], input[type="time"], select, textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0 0px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            margin-left: 200px;
        }

        input[type="submit"]:hover {
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
    <jsp:include page="uhome.jsp"/>
    <h2>Create Event</h2>
       <form action="addEvent.jsp" method="post">
        <!-- Event Name -->
        <label for="event_name">Event Name:</label>
        <input type="text" id="event_name" name="event_name" required><br><br>

        <!-- Event Description -->
        <label for="event_description">Event Description:</label>
        <textarea id="event_description" name="event_description" required></textarea><br><br>

        <!-- Event Category -->
        <label for="event_category">Event Category:</label>
        <select id="event_category" name="event_category" required>
            <option value="Conference">Conference</option>
            <option value="Workshop">Workshop</option>
            <option value="Seminar">Seminar</option>
            <option value="Networking">Networking</option>
            <!-- Add more categories as needed -->
        </select><br><br>

        <!-- Event Start Date -->
        <label for="event_start_date">Event Start Time:</label>
        <input type="time" id="event_start_date" name="event_start_time" required><br><br>

     

        <label for="event_end_time">Event End Time:</label>
        <input type="time" id="event_end_time" name="event_end_time" required><br><br>

        <!-- Event Speaker/Organizer -->
        <label for="event_organizer">Event Organizer/Speaker:</label>
        <input type="text" id="event_organizer" name="event_organizer" required><br><br>

        <!-- Venue Selection -->
        <label for="venue_id">Select Venue:</label>
        <select id="venue_id" name="venue_id" required>
            <option value="3">Classroom 101</option>
            <option value="4">Auditorium</option>
            <!-- Add more venues dynamically if necessary -->
        </select><br><br>

        <input type="submit" value="Create Event">
    </form>
</body>
</html>