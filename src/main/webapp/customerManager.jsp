<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

        <link rel="stylesheet" href="css/customerManagement.css">
        <title>Perfume Store manager</title>

    </head>
    <%@include file="sidebarManager.jsp" %>
    <body>
        <div class="container-i">
            <!-- Sidebar -->



            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main style="background: white;">
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/login");
                    }
                %>
                <div class="header">
                    <div class="logo-tittle">
                        <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>

                    <div class="name-tittle" style="color: black;height: 25px; font-size: 30px;">
                        Customer Management
                    </div>

                    <div class="user-info">

                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Customer Management Table -->
                <div class="customer-table" style="border: 2px solid;">
                    <div class="search-main">
                        <h2 class="customer-list" style="font-size: 25px; font-weight: bold">Customer List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="name" selected>Name</option>

                            <option value="phone">Phone</option>
                            <option value="orders">Number Of Orders</option>

                        </select>
                        <div class="search-container" >
                            <input type="text" class="search-box" id="searchInput" placeholder="Search..." style="border: 1px solid;">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr>

                                    <th data-filter="name" onclick="sortTable(0)" style="background-color: green; color: white;">Name</th>
                                    <th data-filter="phone" onclick="sortTable(1)" style="background-color: green; color: white;">Phone</th>
                                    <th data-filter="orders" onclick="sortTable(2)" style="background-color: green; color: white;">Number Of Orders</th>
                                    <th data-filter="totalSpent" style="background-color: green; color: white;">Total Spending</th>

                                    <th data-filter="details" style="background-color: green; color: white;">Details</th>
                                </tr>
                            </thead>
                            <tbody id="itemList">

                                <c:forEach var="m" items="${requestScope.listCusM}">
                                    <tr>
                                        <td>${m.name}</td>
                                        <td>${m.phone}</td>
                                        <td>${m.numberOrder}</td>
                                        <td>${m.totalSpending}$</td>
                                        <td><a class="view" href="customerDetailsManager?bid=${m.phone}"style=" border:1px solid; width: 80px; height: 30px;border-radius: 10px;">View</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="btn-pagination" id="pagination">
                            <button id="prevButton"><i class='bx bx-left-arrow-circle'></i></button>
                            <button id="nextButton"><i class='bx bx-right-arrow-circle'></i></button>

                        </div>
                    </div>
                </div>
                <!--                 End of Perfume Management Orders 
                                 Honor Customer 
                                <div class="other-info">
                                    <div class="honor-customer-table">
                                        <h2>Honor Customer</h2>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Orders</th>
                                                    <th>Total Spending</th>
                                                    <th>Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                
                <c:forEach var="h" items="${requestScope.listCusH}">
                    <tr>
                        <td>${h.name}</td>
                        <td>${h.numberOrder}</td>
                        <td>${h.totalSpending}$</td>
                        <td><a class="view" href="McustomerDetails?bid=${h.phone}">View</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="black-list-table">
        <h2>Black List</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Orders</th>
                    <th>Reject Orders</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="b" items="${requestScope.listCusB}">
                    <c:choose>
                        <c:when test="${b.cus_status eq 'Blocked'}">
                            <tr>
                                <td>${b.name} <ion-icon name="lock-closed-outline"></ion-icon></td>
                        <td>${b.numberOrder}</td>
                        <td>${b.cancel_count}</td>
                        <td><a class="view" href="McustomerDetails?bid=${b.phone}">View</a></td>
                        </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>${b.name}</td>
                                <td>${b.numberOrder}</td>
                                <td>${b.cancel_count}</td>
                                <td><a class="view" href="McustomerDetails?bid=${b.phone}">View</a></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
     End of Honor Customer -->
            </main>
            <!-- End of Main Content -->
        </div>
    </body>

    <script src="javascript/customerManagement.js"></script>
    <style>
        .header{
            height: 100px;
        }
        .search-main {
            display: flex;
        }
        .th, td {
            padding: 10px;
        }

        .customer-table {
            background-color: white;
            padding: 10px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin-top: 0px;
            padding-bottom:0px;
        }
    </style>
</html>