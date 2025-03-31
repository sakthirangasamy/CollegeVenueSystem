<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>User Login | BMS</title>
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  </head>
  <style>
    /* Google Fonts Import Link */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    /* Sidebar Styling */
    .sidebar {
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      width: 260px;
      background: #11101d;
      z-index: 100;
      transition: all 0.5s ease;
    }
    .sidebar.close {
      width: 78px;
    }
    .sidebar .logo-details {
      height: 60px;
      width: 100%;
      display: flex;
      align-items: center;
    }
    .sidebar .logo-details i {
      font-size: 30px;
      color: #fff;
      height: 50px;
      min-width: 78px;
      text-align: center;
      line-height: 50px;
    }
    .sidebar .logo-details .logo_name {
      font-size: 22px;
      color: #fff;
      font-weight: 600;
      transition: 0.3s ease;
      transition-delay: 0.1s;
    }
    .sidebar.close .logo-details .logo_name {
      transition-delay: 0s;
      opacity: 0;
      pointer-events: none;
    }

    /* Nav Links Styling */
    .sidebar .nav-links {
      height: 100%;
      padding: 30px 0 150px 0;
      overflow: auto;
    }
    .sidebar .nav-links li {
      position: relative;
      list-style: none;
      transition: all 0.4s ease;
    }
    .sidebar .nav-links li a {
      display: flex;
      align-items: center;
      text-decoration: none;
    }
    .sidebar .nav-links li a .link_name {
      font-size: 18px;
      font-weight: 400;
      color: #fff;
      transition: all 0.4s ease;
    }

    /* Login Form Styling */
    .home-section {
      position: relative;
      background: #E4E9F7;
      height: 100vh;
      left: 260px;
      width: calc(100% - 260px);
      transition: all 0.5s ease;
    }
    .sidebar.close ~ .home-section {
      left: 78px;
      width: calc(100% - 78px);
    }

    .login-form {
      width: 400px;
      padding: 30px;
      background-color: white;
      border-radius: 10px;
      margin: 100px auto;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .login-form h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .input-group {
      margin-bottom: 20px;
    }
    .input-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .input-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
    }
    button.btn {
      width: 100%;
      padding: 10px;
      background-color: #11101d;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }
    button.btn:hover {
      background-color: #333;
    }

    /* Register Link Styling */
    .register-link {
      display: block;
      text-align: center;
      margin-top: 10px;
      font-size: 14px;
    }
    .register-link a {
      color: #11101d;
      font-weight: 500;
      text-decoration: none;
    }
    .register-link a:hover {
      text-decoration: underline;
    }
  </style>

  <body>
      <jsp:include page="index.html"/>
      <!-- Admin Login Form -->
     <div class="login-form">
        <form action="userlogincheck.jsp" method="post">
            <h2>User Login</h2>
            
            <!-- Username Field -->
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
            </div>

            <!-- Password Field -->
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn">Login</button>
            
            <!-- Register Link -->
            <div class="register-link">
                <span>Don't have an account? <a href="userregister.jsp">Register Here</a></span>
            </div>
        </form>
    </div>
    </section>

    <script>
      let sidebar = document.querySelector(".sidebar");
      let sidebarBtn = document.querySelector(".bx-menu");

      sidebarBtn.addEventListener("click", () => {
        sidebar.classList.toggle("close");
      });
    </script>
  </body>
</html>
