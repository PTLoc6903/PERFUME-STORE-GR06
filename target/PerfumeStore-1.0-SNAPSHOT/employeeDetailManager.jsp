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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/employeeDetail.css">
        <title>Perfume Store manager</title>

    </head>
    <%@include file="sidebarManager.jsp" %>
    <body>
        <div class="container-i">
            <main>
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

                    <div class="name-tittle"style="color: black; font-size: 25px; font-weight: 800">
                        Employee Details
                        <div class="order-id" style="font-size: 20px;">
                            Phone: ${phoneEmp}
                        </div>
                    </div>

                    <div class="user-info">
                        <p style="font-size: 16px;">Hey, <b><%= request.getSession().getAttribute("username")%></b></p>
                        <small class="text-muted" style="font-size: 13.33px; color: #888;font-weight: 800;">Admin</small>
                    </div>
                </div>
                <!-- Employee Details Information -->
                <ul class="employee-details-info">
                    <li class="infomation-emp">
                        <h2 style="font-size: 20px; margin-bottom: 10px;">Employee Information</h2>
                        <hr style="margin: 10px 0;">
                        <div><strong>Name:</strong> <span>${infoEmp.name}</span></div>
                        <div><strong>Phone:</strong> <span>${infoEmp.phone}</span></div>
                        <div><strong>Email:</strong> <span>${infoEmp.email}</span></div>
                        <div><strong>Address:</strong> <span>${infoEmp.address}</span></div>
                        <div><strong>Birthday:</strong> <span>${birthday}</span></div>
                        <div><strong>Orders Served:</strong> <span>${infoEmp.order_served}</span></div>
                        <div><strong>Account Status:</strong> <span>${infoEmp.emp_status}</span></div>
                        <div><strong>Account Creation Date:</strong> <span>${dateCreate}</span></div>
                    </li>

                    <li>
                        <h2 style="font-size: 20px; margin-bottom: 10px;">History Order Served</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Status</th>
                                    <th>Date Order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="h" items="${requestScope.historyOrderSer}">
                                    <tr>
                                        <td><a href="orderDetailsManager?bid=${h.getOrd_id()}">${h.getOrd_id()}</a></td>
                                            <c:choose>
                                                <c:when test="${h.getOrd_status() eq 'Cancelled' || h.getOrd_status() eq 'Rejected'}">
                                                <td style="color: #C21010;">${h.getOrd_status()}</td>
                                            </c:when>
                                            <c:when test="${h.getOrd_status() eq 'Waiting' || h.getOrd_status() eq 'Preparing'}">
                                                <td style="color: #0397d1;">${h.getOrd_status()}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="color: #1ec708;">${h.getOrd_status()}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${h.getOrd_date()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </li>
                </ul>
                <div class="btn-detail">
                    <div class="btn-create-acc">
                        <button type="submit" onclick="createAcc()">
                            Create Account
                        </button>
                    </div>
                    <div class="btn-delete-cus">
                        <c:choose>
                            <c:when test="${statusAcc ne 'Deleted'}">
                                <button type="submit" onclick="confirmDeleteEmp('${phoneEmp}')">
                                    Delete
                                </button>
                            </c:when>
                        </c:choose>

                    </div>
                    <div style="justify-content: center;display: flex; margin-bottom: 50px; margin-left: 10px;">
                        <button onclick="window.location.href = '/employeeManager'" style=" margin-bottom: 20px; border-radius: 20px; color: white; background: blue; width: 100px; height: 50px;font-weight: 600;">Back</button>
                    </div>
                </div>


            </main>
            <!-- End of Main Content -->



        </div>
    </body>
    <script>
        function createAcc() {
            window.location = "createAccountManager";
        }

        function confirmDeleteEmp(phone) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'Do you really want to delete this employee?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận xóa
                    window.location = "deleteEmployeeManager?bid=" + phone;
                }
            });
        }
    </script>
    <style>
        .infomation-emp{
            height: auto;
        }
        .btn-create-acc button {
            border-radius: 20px;
            font-weight: 600;
            font-size: 16px;
            width: 152px;
            height: 50px;
            display: flex;
            justify-content: center;
            background-color: #0dd10d;
            margin-right: 10px;
        }
        .btn-delete-cus button {
            border-radius: 20px;
            font-weight: 600;
            font-size: 16px;
            width: 152px;
            height: 50px;
            display: flex;
            justify-content: center;
            background-color: red;
            margin-right: 10px;
        }
        th, td {
            font-weight: 600;
            font-size: 16px;
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
    </style>
</html>