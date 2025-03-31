<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>User Registration | BMS</title>
        <link rel="stylesheet" href="style.css">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    </head>
    <style>
        /* Google Fonts Import Link */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');



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

        /* Main Content Styling */
        .home-section {
            position: relative;
            background-color: #E4E9F7;
            height: 900px;
            left: 260px;
            width: calc(100% - 260px);
            transition: all 0.5s ease;
        }
        .sidebar.close ~ .home-section {
            left: 78px;
            width: calc(100% - 78px);
        }

        /* Registration Form Styling */
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
            font-size: 24px;
        }
        .input-group {
            margin-bottom: 20px;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        .input-group input, .input-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .input-group textarea {
            height: 60px;
        }

        /* Radio Button Group */
        .gender-group {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .gender-group input {
            width: auto;
        }
        .gender-group label {
            margin-right: 10px;
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
            transition: background-color 0.3s ease;
        }
        button.btn:hover {
            background-color: #333;
        }

        /* Sidebar Toggle Button Styling */
        .bx-menu {
            color: white;
            font-size: 30px;
            cursor: pointer;
        }
    </style>

    <body>
        <jsp:include page="index.html"/>



        <div class="login-form">
            <form action="userregistercheck.jsp" method="post" onsubmit="return validateForm()">

                <h2>User Registration</h2>

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

                <!-- Email Field -->
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required />
                </div>

                <!-- Contact Field -->
                <div class="input-group">
                    <label for="contact">Contact</label>
                    <input type="text" id="contact" name="contact" placeholder="Enter your contact number" required />
                </div>

                <!-- Address Field -->
                <div class="input-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" placeholder="Enter your address" required></textarea>
                </div>

                <!-- Gender Field -->
                <div class="input-group gender-group">
                    <label>Gender</label>
                    <label><input type="radio" id="male" name="gender" value="Male" required> Male</label>
                    <label><input type="radio" id="female" name="gender" value="Female"> Female</label>
                    <label><input type="radio" id="other" name="gender" value="Other"> Other</label>
                </div>
                
                <!-- Submit Button -->
                <button type="submit" class="btn">Register</button>
            </form>
        </div>
    </section>

    <script>
                let sidebar = document.querySelector(".sidebar");
                let sidebarBtn = document.querySelector(".bx-menu");
                sidebarBtn.addEventListener("click", () = > {
                sidebar.classList.toggle("close");
                });    </script>
    <script>
                function validateForm() {
                var username = document.getElementById('username').value;
                        var password = document.getElementById('password').value;
                        var email = document.getElementById('email').value;
                        var contact = document.getElementById('contact').value;
                        var address = document.getElementById('address').value;
                        var gender = document.querySelector('input[name="gender"]:checked');
                        if (!username || !password || !email || !contact || !address || !gender) {
                alert("Please fill out all fields.");
                        return false;
                }
                return true;
                }
    </script>

</body>
</html>
