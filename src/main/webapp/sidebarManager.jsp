<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <title>Perfume Store Manager</title>
        <style>
            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
            }

            aside {
                background-color: #333;
                color: #fff;
                text-align: center;
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
            }

            .sidebar {
                width: 100%;
                height: auto;
                background-color: #FFB6C1;
                padding: 5px 0;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .logo-container {
                display: flex;
                align-items: center;
                margin-left: 100px;
            }

            .logo-container img {
                width: 120px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .Campus {
                font-family: 'Poppins', sans-serif;
                color: #C21010;
                font-weight: bold;
                font-size: 3rem;
            }

            /* Menu styling */
            .side-menu {
                display: flex;
                align-items: center;
                list-style: none;
                padding: 0;
                margin: 0;
                width: 80%
            }

            .side-menu li {
                margin-right: 20px;
                position: relative;
            }

            .side-menu a {
                display: inline-block;
                padding: 10px 20px;
                transition: 0.3s;
                text-decoration: none;
                color: black;
                font-size: 25px;
                font-family: 'Bahnschrift', sans-serif;
                font-weight: bold;
            }

            .side-menu a:hover {
                background-color: #C21010;
                color: #ecf0f1;
                border-bottom: 4px solid #C21010;
            }

            .side-menu .sub-menu {
                color: white;
                display: none;
                position: absolute;
                background-color: black;
                list-style: none;
                padding: 0;
                margin: 0;
                top: 100%;
                left: 0;
                width: 200px;
                z-index: 1000;

            }

            .side-menu li:hover .sub-menu {
                display: block;
            }

            /* Hamburger menu icon */
            .hamburger {
                display: none;
                font-size: 30px;
                cursor: pointer;
                margin-right: 20px;
                color: black;
            }

            /* Mobile styles */
            @media (max-width: 768px) {
                .sidebar {
                    flex-direction: row;
                    align-items: center;
                    padding: 10px;
                }

                .side-menu {
                    display: none; /* Hide menu initially */
                    flex-direction: column;
                    width: 100%;
                    background-color: #FFB6C1;
                    position: absolute;
                    top: 135px;
                    left: 0;
                    z-index: 1000;
                }

                .side-menu.active {
                    display: flex; /* Show menu when active */
                }

                .side-menu li {
                    width: 100%;
                    margin-right: 0;
                }

                .side-menu a {
                    width: 100%;
                    text-align: left;
                    padding: 10px;
                    font-size: 16px;
                }

                .side-menu .sub-menu {
                    position: relative;
                    width: 100%;
                    padding: 0;
                }

                .hamburger {
                    display: block; /* Show hamburger icon on mobile */
                }
            }

            .content {
                padding-top: 145px;
            }
        </style>
    </head>
    <body>
        <aside>
            <div class="sidebar">
                <div class="logo-container">
                    <img src="../img/logo1.jpg" alt="logo Perfume Store">
                    <a href="/analyticsManager" id="logo" style="font-size: 30px; text-decoration: none;">
                        <div class="Campus">Perfume Store Manager</div>
                    </a>
                </div>
                <i class='bx bx-menu hamburger' onclick="toggleMenu()"></i>
                <ul class="side-menu">
                    <li id="analyticsManager"><a href="analyticsManager" style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bx-home-heart'></i> Analysis</a></li>
                    <li id="orderManager"><a href="orderManager" style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bx-store'></i> Order</a></li>
                    <li id="listMenuManager">
                        <a href="listMenuManager"style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bx-notepad'></i> Product</a>
                        <ul class="sub-menu" style="background:black">
                            <li><a href="listMenuManager" style="color:white;font-size: 16px;font-family: 'Bahnschrift', sans-serif;">List Product</a></li>
                            <li><a href="addPerfumeManager" style="color:white;font-size: 16px;font-family: 'Bahnschrift', sans-serif;">Add Perfume</a></li>
                        </ul>
                    </li>
                    <li id="employeeManager">
                        <a href="employeeManager" style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bx-group'></i> Employee</a>
                        <ul class="sub-menu" style="background:black">
                            <li><a href="employeeManager" style="background: black; color: white;font-size: 16px;font-family: 'Bahnschrift', sans-serif;">List Employee</a></li>
                            <li><a href="createAccountManager" style="background: black; color: white;font-size: 16px;font-family: 'Bahnschrift', sans-serif;">Create Account</a></li>
                        </ul>
                    </li>
                    <li id="customerManager"><a href="customerManager" style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bxs-user-badge'></i> Customer</a></li>
                    <li id="logoutManager"><a href="logoutManager" class="logout" style="color:black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;"><i class='bx bx-exit'></i> Logout</a></li>
                </ul>
            </div>
        </aside>
        <div class="content">
            <!-- Your page content goes here -->
        </div>
        <script>
            // JavaScript to add active class to current link in sidebar
            document.addEventListener("DOMContentLoaded", function () {
                var currentLocation = window.location.href;
                var menuItems = document.querySelectorAll('.side-menu a');
                menuItems.forEach(function (item) {
                    if (item.href === currentLocation) {
                        item.parentNode.classList.add('active');
                    }
                });
            });

            // Function to toggle menu visibility on smaller screens
            function toggleMenu() {
                var sideMenu = document.querySelector('.side-menu');
                sideMenu.classList.toggle('active');
            }
        </script>
    </body>
</html>
