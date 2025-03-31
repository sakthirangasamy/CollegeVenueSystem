<%@ page language="java" %>
<%
    // Retrieve form data from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Define the hardcoded admin credentials
    String adminUsername = "admin";
    String adminPassword = "admin";

    // Check if the entered credentials match the admin credentials
    if (username.equals(adminUsername) && password.equals(adminPassword)) {
        // Set session attribute for admin
        session.setAttribute("admin", username);
       out.println("<script>");
        out.println("alert('Welcome ADMIN.');");
        
        out.println("</script>");
        // Redirect to admin home page
        response.sendRedirect("adminhome.jsp");
    } else {
        // Invalid credentials, display an alert and redirect to sign-in page
        out.println("<script>");
        out.println("alert('Invalid username or password! Please try again.');");
        out.println("window.location.href = 'adminlogin.jsp';"); // Redirect back to sign-in
        out.println("</script>");
    }
%>
