College Venue System
The College Venue System is a web-based application for managing venue bookings and events in a college. The system allows admins to manage venues, slots, and events while users can book available slots for events.

This application is built using JSP, HTML, CSS, JavaScript, and the backend is powered by MySQL for data storage. The application is developed in NetBeans IDE and uses JDK as the programming language.

Features
Admin Module
Add, update, and delete venues.

Manage slot availability for each venue.

Add, update, and delete events for specific venues.

View all bookings and manage their status.

View and manage user profiles.

User Module
Register and login to the system.

View available slots for different venues.

Book a venue for an event.

View, cancel, or modify their bookings.

Tech Stack
Frontend: JSP, HTML, CSS, JavaScript

Backend: Java (JDK)

Database: MySQL

IDE: NetBeans

Project Setup
Prerequisites
To run this project locally, make sure you have the following installed:

JDK (Java Development Kit)

NetBeans IDE (or any IDE you prefer for Java development)

MySQL (for database management)

Tomcat (or any servlet container) for running the JSP application

Step 1: Clone the Repository
Clone this repository to your local machine:

bash
Copy
git clone https://github.com/your-username/college-venue-system.git
Step 2: Set Up MySQL Database
Open your MySQL server and create the collegevenuesystem database:

sql
Copy
CREATE DATABASE collegevenuesystem;
Use the created database:

sql
Copy
USE collegevenuesystem;
Run the following SQL commands to create the necessary tables in your database:

sql
Copy
CREATE TABLE venues (
  venue_id INT(11) NOT NULL AUTO_INCREMENT,
  venue_name VARCHAR(100) DEFAULT NULL,
  venue_type VARCHAR(50) DEFAULT NULL,
  venue_location VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (venue_id)
);

CREATE TABLE slots (
  slot_id INT(11) NOT NULL AUTO_INCREMENT,
  venue_id INT(11) DEFAULT NULL,
  slot_date DATE DEFAULT NULL,
  start_time TIME DEFAULT NULL,
  end_time TIME DEFAULT NULL,
  is_available TINYINT(1) DEFAULT '1',
  PRIMARY KEY (slot_id),
  KEY venue_id (venue_id),
  CONSTRAINT slots_ibfk_1 FOREIGN KEY (venue_id) REFERENCES venues (venue_id)
);

CREATE TABLE events (
  event_id INT(11) NOT NULL AUTO_INCREMENT,
  event_name VARCHAR(100) DEFAULT NULL,
  event_description TEXT,
  event_date DATE DEFAULT NULL,
  venue_id INT(11) DEFAULT NULL,
  PRIMARY KEY (event_id),
  KEY venue_id (venue_id),
  CONSTRAINT events_ibfk_1 FOREIGN KEY (venue_id) REFERENCES venues (venue_id)
);

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) DEFAULT NULL,
  contact VARCHAR(20) DEFAULT NULL,
  address TEXT,
  gender VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE bookings (
  booking_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) DEFAULT NULL,
  slot_id INT(11) DEFAULT NULL,
  booking_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status ENUM('booked', 'cancelled') DEFAULT 'booked',
  PRIMARY KEY (booking_id)
);
Step 3: Configure the Database Connection
In the project, locate the database connection configuration file (e.g., dbConnection.jsp or similar). Modify the following variables to match your MySQL setup:

java
Copy
String url = "jdbc:mysql://localhost:3306/collegevenuesystem";
String user = "your_mysql_username";
String password = "your_mysql_password";
Step 4: Run the Project
Open the project in NetBeans (or any IDE you are using).

Build the project to ensure there are no errors.

Run the project on your server (Tomcat or any other server configured in your IDE).

Open your browser and navigate to the following URL:

bash
Copy
http://localhost:8080/your-project-name
You should be able to view the homepage of your College Venue System.

Database Schema
The database schema consists of the following tables:

venues: Stores details about different venues available for booking.

slots: Stores available slots for each venue on specific dates.

events: Stores events scheduled for each venue.

users: Stores user details such as username, password, email, and contact information.

bookings: Stores bookings made by users, associated with a venue and slot.

Table Relationships
venues → slots: One venue can have multiple available slots.

venues → events: One venue can host multiple events.

users → bookings: A user can make multiple bookings.

slots → bookings: A slot can be booked by one or more users.

Usage
Admin Login
Use the admin login page to manage venues, slots, events, and bookings.

User Login
Users can register, login, view available venues, and book slots for their events.

Contributing
Feel free to fork this repository, create a branch, and submit a pull request. Contributions are welcome!

License
This project is licensed under the MIT License - see the LICENSE file for details.

