<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="css/createAccEmployee.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store manager</title>

    </head>

    <body>

        <div class="container-i">
            <!-- Sidebar -->

            <%@include file="sidebarManager.jsp" %>

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main style="background: white;">
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/loginManager");
                    }
                %>
                <div class="header">
                    <div class="logo-tittle">
                        <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>

                    <div class="name-tittle">
                        Create Account
                    </div>

                    <div class="user-info">

                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Add Perfume Table -->
                <h2 style="font-size:30px; display: flex;justify-content: center;">Enter Account Information</h2>
                <form id="createAccountForm" action="createAccount" method="POST" style="justify-items: center;margin-left: -100px;">
                    <div class="acc-info" style="display:block; width: 100%; justify-items: center;">
                        <div class="right-info">
                            <ul>
                                <li style="border: 1px solid"><label>Name: *</label><input id="name" type="text" name="name" value  style=""></li>
                                <li style="border: 1px solid"><label>Phone: *</label><input id="phone" type="number" name="phone" value  style=""></li>
                                <li style="border: 1px solid"><label>Password: *</label><input id="password" type="text" name="password" style=""></li>
                            </ul>
                        </div>
                        <div class="right-info">
                            <ul style="width:380px;">
                                <li style="border: 1px solid"><label>Email: *</label><input id="email" type="text" name="email" value  style=""></li>
                                <li style="border: 1px solid"><label>Birthday: </label><input id="birthday" type="date" name="birthday" value placeholder="dd/MM/yyyy"></li>
                                <li style="border: 1px solid"><label>Address: </label>
                                    <textarea style="resize: none;" id="address" cols="30" rows="3" name="address"></textarea>
                                </li>
                            </ul>
                            <div class="btn-product" style="margin-left:0%;">
                                <div class="btn-add-product">
                                    <button class="register-button" type="button">
                                        Add Account
                                    </button>
                                </div>
                                <div class="btn-cancel-product">
                                    <button type="button" onclick="backMenu()">
                                        Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </main>
            <!-- End of Main Content -->
        </div>
    </body>
    <style>
        .acc-info li {
            height: auto;
            list-style-type: none;
            width: 100%;
            background-color: #fff;
            padding: 5px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        .acc-info label {
            color: #C21010;
            font-weight: 600;
            font-size: 16px;
        }
        .right-info {
            margin-left: 10%;
        }
        .right-info li textarea {
            margin: 10px;
            vertical-align: middle;
            margin-left: 15px;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
        }
        .btn-add-product button {
            border-radius: 20px;
            font-weight: 600;
            font-size: 16px;
            width: 134px;
            margin-right: 10px;
            background-color: #5ace56;
            color: white;
        }
        .btn-product {
            justify-content: center;
            display: flex;
            margin-top: 20px;
            margin-left: 17%;
        }
        .btn-cancel-product button {
            font-weight: 600;
            font-size: 16px;
            border-radius: 20px;
            width: 120px;
            margin-left: 10px;
            background-color: #C21010;
            color: white;
        }


    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.date.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>


                                        document.querySelector('.register-button').addEventListener('click', function (event) {
                                            event.preventDefault();
                                            const name = document.getElementById('name').value;
                                            const phone = document.getElementById('phone').value;
                                            const password = document.getElementById('password').value;
                                            const email = document.getElementById('email').value;
                                            const address = document.getElementById('address').value;
                                            const birthday = document.getElementById('birthday').value;
                                            if (!phone || !password || !name || !email) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Invalid information',
                                                    text: 'Please fill in the required information!'
                                                });
                                            } else if (!isValidName(name)) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Invalid name',
                                                    text: 'It must be between 2 and 50 characters.'
                                                });
                                            } else if (!isValidPhone(phone)) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Invalid phone number',
                                                    text: 'It should have 10 digits and the first number should be 0.'
                                                });
                                            } else if (!isValidPassword(password)) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Invalid password',
                                                    text: 'The password must be between 1 and 20 characters.'
                                                });
                                            } else if (!isValidEmail(email)) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Invalid email',
                                                    text: 'It should follow the email format.(abc@domain.com)'
                                                });
                                            } else {
                                                register();
                                            }
                                        });
                                        function register() {
                                            const name = document.getElementById('name').value;
                                            const phone = document.getElementById('phone').value;
                                            const password = document.getElementById('password').value;
                                            const email = document.getElementById('email').value;
                                            const address = document.getElementById('address').value;
                                            const birthday = document.getElementById('birthday').value;
                                            $.ajax({
                                                url: "/createAccountManager",
                                                type: "post",
                                                data: {
                                                    name: name,
                                                    phone: phone,
                                                    password: password,
                                                    email: email,
                                                    address: address,
                                                    birthday: birthday
                                                },
                                                success: function (data) {
                                                    Swal.fire({
                                                        icon: 'success',
                                                        title: 'Create Account Successfully',
                                                        text: 'Click OK to redirect to Employee Management',
                                                        showCancelButton: true, // Hiển thị nút Cancel
                                                        confirmButtonColor: '#3085d6',
                                                        confirmButtonText: 'OK',
                                                        cancelButtonColor: '#d33',
                                                        cancelButtonText: 'Cancel'
                                                    }).then((result) => {
                                                        if (result.value) {
                                                            window.location.href = "/employeeManager";
                                                        }
                                                    });
                                                },
                                                error: function (xhr) {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Phone is existed',
                                                        text: 'Please enter the other phone.'
                                                    });
                                                }
                                            });
                                        }


                                        function isValidPhone(phone) {
                                            return /^[0-9]{10}$/.test(phone) && phone[0] === '0';
                                        }
                                        function isValidEmail(email) {
                                            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                                            return emailRegex.test(email);
                                        }

                                        function isValidName(name) {
                                            return name.length >= 2 && name.length <= 50;
                                        }

                                        function isValidAddress(address) {
                                            return address.length >= 0 && address.length <= 50;
                                        }

                                        function isValidPassword(password) {
                                            return password.length > 0 && password.length <= 20;
                                        }

                                        function backMenu() {
                                            window.location = "/employeeManager";
                                        }

                                        function generateRandomPassword() {
                                            const min = 10000; // Minimum 5-digit number
                                            const max = 99999; // Maximum 5-digit number
                                            const randomPassword = Math.floor(Math.random() * (max - min + 1)) + min;
                                            document.getElementById('password').value = randomPassword;
                                        }

                                        window.onload = generateRandomPassword;

    </script>
</html>