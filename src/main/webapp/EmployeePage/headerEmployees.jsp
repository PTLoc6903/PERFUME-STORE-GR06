<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="/EmployeePage/css/Eheader.css">
        <title>Perfume Store</title>
        <style>
            body {
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }

            /* Thiết lập mặc định cho các liên kết */
            #main-menu a {
                color: black;
                font-size: 20px;
                background-color: transparent;
                padding: 10px;
                text-decoration: none;
                display: inline-block;
            }

            .highlight-red {
                background-color: red !important;
                color: white !important;
            }

            .search-bar {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 5px;
            }

            .search-bar .input-group {
                display: flex;
                border: 1px solid #ccc;
                border-radius: 25px;
                overflow: hidden;
                background-color: #f8f9fa;
            }

            .search-bar .input-group .input-group-text {
                background-color: #fff;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .search-bar .input-group input {
                border: none;
                outline: none;
                padding: 10px;
                flex-grow: 1;
            }

            .search-bar .input-group button {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .search-bar .input-group button:hover {
                background-color: #0056b3;
            }

            header .inner-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            nav {
                margin-left: auto;
            }

            /* Responsive design adjustments */
            @media (max-width: 768px) {
                .inner-header {
                    flex-direction: column;
                    text-align: center;
                }

                img {
                    margin: 0 auto;
                    width: 100px;
                }

                .Campus {
                    font-size: 1.5rem;
                    margin-top: 10px;
                }

                #main-menu {
                    display: flex;
                    flex-direction: column;
                    padding: 0;
                }

                #main-menu a {
                    font-size: 18px;
                    padding: 8px;
                }

                nav {
                    margin-top: 20px;
                }
            }

            @media (max-width: 576px) {
                .Campus {
                    font-size: 1.2rem;
                }

                #main-menu a {
                    font-size: 16px;
                }
            }

        </style>
    </head>

    <body>
        <div id="wrapper">
            <header style="height:140px;">
                <div class="inner-header container-fluid" style="max-width: 1700px">
                    <img style="width: 120px; border-radius: 50%; margin-left: 100px;" src="/img/logo1.jpg" alt="Logo Perfume Store">
                    <div class="Campus" style="margin-right: 10px; color: #C21010;font-family: 'Poppins', sans-serif;font-weight: bold;font-size: 3rem;letter-spacing: 2px; width: 480px; margin-left: 0px;; display: flex;justify-content: center">
                        Perfume Store
                    </div>
                    <%
                        boolean OrderList = Boolean.parseBoolean(request.getParameter("isOrderList"));
                        pageContext.setAttribute("OrderList", OrderList);
                    %>
                    <c:choose>
                        <c:when test="${OrderList}">

                        </c:when>
                        <c:otherwise>
                            <div style=""></div>
                        </c:otherwise>
                    </c:choose>
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto" id="main-menu">
                                <li class="nav-item">
                                    <c:choose>
                                        <c:when test="${sessionScope.phone != null}">
                                            <a href="/employee/orderListEmployees" class="menu-link nav-link" style="font-size:25px;font-family: 'Bahnschrift', sans-serif;">Order List</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/employee/loginEmployees" class="menu-link nav-link" style="font-size:25px;font-family: 'Bahnschrift', sans-serif;">Order List</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="nav-item">
                                    <a href="/employee/newOrderListEmployees" class="menu-link nav-link" style="font-size:25px;font-family: 'Bahnschrift', sans-serif;">New Order</a>
                                </li>
                                <%
                                    String name = request.getSession().getAttribute("phone") + "";
                                    if (name.equals("") || name.equals("null")) {
                                %>
                                <li class="nav-item">
                                    <a href="" class="menu-link nav-link">My Account</a>
                                    <ul class="sub-menu">
                                        <li><a style="color: black" href="/employee/loginEmployees">Login</a></li>
                                    </ul>
                                </li>
                                <% } else { %>
                                <li class="nav-item" style="display:flex;justify-content: right;">
                                    <a href="" class="menu-link nav-link" style="font-size:25px;font-family: 'Bahnschrift', sans-serif;">Hello, ${sessionScope.fullname}</a>
                                    <ul class="sub-menu" style='margin-top: 50px; width: auto; background: black'>
                                        <li><a style="color: white" href="/employee/updateProfileEmployees">Profile</a></li>
                                        <li><a style="color: white" href="/employee/changePasswordEmployees">Change Password</a></li>
                                        <li><a style="color: white" href="/employee/logoutEmployees">Logout <ion-icon style="display: inline-block; vertical-align: middle; margin-left: 2px; font-size: 24px;" name="log-out-outline"></ion-icon></a></li>
                                    </ul>
                                </li>
                                <% }%>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
        </div>

        <!-- End of Main Content -->
    </body>
    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('sticky');
                } else {
                    $('header').removeClass('sticky');
                }
            });

            // Highlight the menu link when clicked
            $('#main-menu a').click(function () {
                $('#main-menu a').removeClass('highlight-red'); // Remove class from all links
                $(this).addClass('highlight-red'); // Add class to the clicked link
            });
        });
    </script>

</html>
