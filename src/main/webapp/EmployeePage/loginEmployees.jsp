<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/EmployeePage/css/Elogin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Perfume Store - Employee Login</title>
        <link rel="stylesheet" href="styles.css"> <!-- External stylesheet -->
    </head>

    <body>
        <div class="box">
            <div class="container">
                <div class="top-header">
                    <header>LOGIN</header>
                </div>
                <!-- Login Form -->
                <form action="/employee" method="post" onsubmit="return validateForm()">
                    <div class="input-field">
                        <i class="bx bx-user" aria-label="User Icon"></i>
                        <input type="text" id="username" name="phone" class="input" placeholder="Enter your phone..." required>
                    </div>
                    <div class="input-field">
                        <i class="bx bx-lock-alt" aria-label="Password Icon"></i>
                        <input autocomplete="off" id="logpass" placeholder="Enter your password..." class="input" name="password" type="password" required>
                    </div>

                    <div class="bottom">
                        <div>
                            <input name="checkRememberMe" type="checkbox" id="rememberMe">
                            <label for="rememberMe" style="color: white;">Remember</label>
                        </div>
                        <div>
                            <a href="/employee/forgotPassEmployees" class="btn-link">Forgot password?</a>
                        </div>
                    </div>

                    <!-- Display login error if any -->
                    <%
                        String invalid = (String) request.getAttribute("loginError");
                        if (invalid != null && !invalid.equals("")) {
                    %>
                    <div class="error-message">
                        The phone or password is incorrect!
                    </div>
                    <%
                        }
                    %>

                    <div class="btnLogin">
                        <button type="submit" name="btnLogin" value="login" class="submit" style="color: black; height: 45px; width: 113%;">Login</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function validateForm() {
                const phone = document.getElementById('username').value;
                const password = document.getElementById('logpass').value;
                if (phone === "" || password === "") {
                    alert("Please fill out all fields.");
                    return false;
                }
                return true;
            }
        </script>

        <style>
            body {
                background-image: url('/img/login.jpg');
                background-size: cover;
                background-position: center;
                margin: 0;
                font-family: 'Poppins', sans-serif;
                color: white;
            }
            .box {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .container {
                padding: 30px;
                width: 350px;
                /* background: rgba(0, 0, 0, 0.7); */
                border-radius: 15px;
                /* box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3); */
            }
            .top-header header {
                font-size: 30px;
                text-align: center;
                margin-bottom: 20px;
            }
            .input-field {
                position: relative;
                margin-bottom: 20px;
                width: 100%;
            }
            .input {
                width: 100%;
                height: 45px;
                border: none;
                outline: none;
                border-radius: 30px;
                color: #333;
                padding-left: 50px; /* Adjusted for better padding with icons */
                background: #f0f0f0;
                font-family: 'Poppins', sans-serif;
                transition: border-color 0.3s; /* Added transition */
            }
            .input:focus {
                border-color: #ff7c7c; /* Highlight on focus */
                box-shadow: 0 0 5px rgba(255, 124, 124, 0.5); /* Subtle shadow on focus */
            }
            .input-field i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #333;
            }
            .submit {
                color: black;
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 30px;
                background: white;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s;
            }
            .submit:hover {
                background: white; /* Darker on hover */
            }
            .bottom {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 10px;
                color: black;
            }
            .bottom a {
                color: white;
                font-family: 'Poppins', sans-serif;
                text-decoration: none;
                transition: color 0.3s;
            }
            .bottom a:hover {
                color: white; /* Change color on hover */
            }
            .btnLogin {
                text-align: center;
                margin-top: 20px;
            }
            .error-message {
                color: red;
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </body>
</html>
