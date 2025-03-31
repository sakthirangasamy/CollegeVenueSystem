<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Admin Login | BMS</title>
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  </head><style>
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

  </style>
  <body>
      <jsp:include page="index.html"/>

   

      <!-- Admin Login Form -->
      <div class="login-form">
          <form action="adminlogincheck.jsp" method="post">
         
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
         
        </form>
      </div>
    

    
  </body>
</html>
