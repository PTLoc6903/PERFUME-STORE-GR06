<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/employeeManagement.css">
        <title>Perfume Store manager</title>

    </head>
    <%@include file="sidebarManager.jsp" %>
    <body>
        <div class="container-i">
            <main style="background: white;">
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/login");
                    }
                %>                
                <div class="header" style="color: black; font-size: 30px;height: 25px;margin-top: 20px;">
                    <div class="logo-tittle">
                        <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>

                    <div class="name-tittle" style="color: black;"> 
                        Employee Management
                    </div>

                    <div class="user-info">

                        <p style="font-size:16px;">Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted" style="font-size:13.333px ">Admin</small>
                    </div>
                </div>
                <!-- Customer Management Table -->
                <div class="btn-create-acc" onclick="createAcc()">

                    <button>
                        Create Account
                    </button>
                </div>
                <div class="customer-table" style="border:2px solid">
                    <div class="search-main">
                        <h2 class="customer-list">Employee List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="name" selected>Name</option>

                            <option value="phone">Phone</option>
                            <option value="orders">Orders Served</option>
                        </select>
                        <div class="search-container">
                            <input type="text" class="search-box" id="searchInput" placeholder="Search..." style="border:1px solid">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <div class="green">
                            <table>
                                <thead>
                                    <tr>

                                        <th data-filter="name" onclick="sortTable(0)" style="background-color: green; color: white;">Name</th>
                                        <th data-filter="phone" onclick="sortTable(1)" style="background-color: green; color: white;">Phone</th>
                                        <th data-filter="orders" onclick="sortTable(2)" style="background-color: green; color: white;">Orders Served</th>

                                        <th data-filter="details" style="background-color: green; color: white;">Details</th>
                                    </tr>
                                </thead>
                                <tbody id="itemList">

                                    <c:forEach var="m" items="${requestScope.listEmpM}">
                                        <tr>
                                            <td>${m.name}</td>
                                            <td>${m.phone}</td>
                                            <td>${m.order_served}</td>
                                            <td ><a class="view" href="employeeDetailManager?bid=${m.phone}" style="border: 1px solid; width: 50px;; height: 30px;border-radius: 10px;">View</a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="btn-pagination" id="pagination">
                            <button id="prevButton"><i class='bx bx-left-arrow-circle'></i></button>
                            <button id="nextButton"><i class='bx bx-right-arrow-circle'></i></button>
                        </div>
                    </div>
                </div>
                <!-- End of Perfume Management Orders -->
                <!-- Honor Employee -->
                <!--                <div class="honor-employee-table">
                                    <h2>Honor Employee</h2>
                                    <table>
                                        <thead>
                                            <tr>
                
                                                <th>Name</th>
                                                <th>Phone</th>
                
                                                <th>Orders Served</th>
                                                <th>Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                <c:forEach var="h" items="${requestScope.listEmpH}">
                    <tr>
                        <td>${h.name}</td>
                        <td>${h.phone}</td>
                        <td>${h.order_served}</td>
                        <td><a class="view" href="MemployeeDetail?bid=${h.phone}">View</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
     End of Honor Customer -->
            </main>
        </div>
    </body>
    <script src="javascript/employeeManagement.js" type="text/javascript"></script>

    <script>
                                            function createAcc() {
                                                window.location = "createAccountManager";
                                            }
    </script>

    <style>
        .name-tittle {
            color: white;
            font-size: 30px;
            font-weight: 800;
            line-height: normal;
        }
        .btn-create-acc button {
            height: 50px;
            padding: 0px;
            border-radius: 20px;
            width: 140px;
            font-size: 17px;
            border: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 1);
            color: white;
            background-color: blue;
        }
        .search-main {
            justify-content: center;
            display: flex;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        .customer-table {
            background-color: #fff;
            padding: 10px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
            padding-bottom: 10px;
        }
        .btn-create-acc {
            margin-top: 0px;
        }
    </style>
</html>