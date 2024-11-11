<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <title>Perfume Store - Manager Login</title>
    <style>
        /* Body and Background Overlay */
        body {
            background-image: url('/img/login.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            color: white;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.1); /* Dark overlay */
            z-index: -1;
        }

        /* Form Styling */
        form {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
            text-align: center;
            backdrop-filter: blur(30px);
        }

        h2 {
            color: #ffcc00;
            font-size: 24px;
            margin-bottom: 1.5em;
        }

        /* Input Box Styling */
        .inputBox {
            position: relative;
            margin-bottom: 1.5em;
        }

        .inputBox input {
            width: 100%;
            padding: 12px 40px 12px 10px;
            font-size: 16px;
            color: #fff;
            background: transparent;
            border: none;
            border-bottom: 2px solid #ffcc00;
            outline: none;
            transition: border-color 0.3s;
        }

        .inputBox input:focus {
            border-color: #ffdd33;
        }

        .inputBox span {
            position: absolute;
            left: 10px;
            top: 0;
            padding: 12px 0;
            pointer-events: none;
            font-size: 14px;
            color: #aaa;
            transition: 0.3s;
        }

        .inputBox input:focus + span,
        .inputBox input:valid + span {
            top: -20px;
            font-size: 12px;
            color: #ffcc00;
        }

        /* Eye Icon */
        .inputBox ion-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #aaa;
            cursor: pointer;
        }

        /* Button Styling */
        input[type="submit"] {
            background: #ffcc00;
            color: #333;
            font-size: 16px;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background: #e6b800;
            transform: translateY(-2px);
        }

        .text-danger {
            color: #ff6666;
            font-size: 14px;
            margin-top: 0.5em;
        }
    </style>
</head>
<body>
    <form action="loginManager" method="post">
        <h2>SIGN IN</h2>
        <div class="inputBox">
            <input type="text" name="username" required="required">
            <span>Username</span>
        </div>
        <div class="inputBox">
            <input type="password" name="password" id="password" required="required">
            <span>Password</span>
            <ion-icon name="eye-off-outline" class="eye-icon" id="togglePassword"></ion-icon>
        </div>
        <p class="text-danger">${mess}</p>
        <input type="submit" value="Login">
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const togglePassword = document.getElementById('togglePassword');
            const password = document.getElementById('password');

            togglePassword.addEventListener('click', function () {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.setAttribute('name', type === 'password' ? 'eye-off-outline' : 'eye-outline');
            });
        });
    </script>
</body>
</html>
