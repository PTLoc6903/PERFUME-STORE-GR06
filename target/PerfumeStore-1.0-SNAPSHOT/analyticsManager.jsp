<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/analytics.css"> 
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
                        response.sendRedirect("/login");
                    }
                %>
                <div class="header" style="height: 200px; margin-top: 60px;justify-content: right;display: flex; font-weight: 800">

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>

                <!-- Insights -->
                <ul class="insights" style="margin-top: -60px; display: flex;justify-content: center;">
                    <li style="border: 1px solid; width: auto;">
                        <i class='bx bxs-user'></i>
                        <div class="info">
                            <div class="text">

                                <h3>${totalUser}</h3>

                                <p>Total Users</p>
                            </div>
                        </div>
                    </li>
                    <li style="border: 1px solid; width: auto;">
                        <i class='bx bx-shopping-bag'></i>
                        <span class="info">
                            <div class="text">

                                <h3>${totalOrder}</h3>

                                <p>Paid Order</p>
                            </div>
                        </span>
                    </li>
                    <li style="border: 1px solid; width: auto;"><i class='bx bxs-dollar-circle'></i>
                        <span class="info">
                            <div class="text">

                                <h3>$${totalRevenue}</h3>
                                <p>Total Revenue</p>

                            </div>
                        </span>
                    </li>
                </ul>
                <!-- End of Insights -->

                <!-- New Users Section -->
                <div class="new-users" style="border: 1px solid;height: auto; padding: 10px;border-radius: 20px; margin-top: 20px;width: 80%;margin-left: 10%">
                    <h2 style="font-size: 25px;font-weight: 600;">New Users</h2>
                    <div class="user-list" style='margin-left: 0px;justify-content: center;' >
                        <c:forEach var="u" items="${requestScope.listNewUser}">
                            <div class="user" style="border: 1px solid;padding:20px 70px 20px 70px;">
                                <p><a style="color: #000000;font-weight: 800;font-size: 16px;width: 100px;text-align: center;" href="customerDetailsManager?bid=${u.phone}">${u.name}</a></p>
                                <p>Customer</p>
                                <p>${u.time_ago}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <a class="show" href="customerManager">Show All</a>
                </div>

                <!-- End of New Users Section -->

                <!-- Recent Orders Table -->
                <div class="recent-orders" style="border: 1px solid; padding: 5; margin-bottom: 50px;margin-top :50px; border-radius: 20px;">
                    <h2 style='font-size:25px'>Recent Orders</h2>
                    <table>
                        <thead>
                            <tr>
                                <th style="font-size: 16px;">Order ID</th>
                                <th style="font-size: 16px;">Customer Phone</th>
                                <th style="font-size: 16px;">Time Order</th>
                                <th style="font-size: 16px;">Status</th>
                                <th style="font-size: 16px;">Detail</th>

                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="r" items="${requestScope.listRecentOrder}">
                                <tr>
                                    <td style="font-size: 16px;">${r.ord_id}</td>
                                    <td style="font-size: 16px;">${r.cus_phone}</td>
                                    <td style="font-size: 16px;">${r.ord_date}</td>
                                    <c:choose>
                                        <c:when test="${r.ord_status eq 'Cancelled' || r.ord_status eq 'Rejected'}">
                                            <td style="color: #C21010; font-size: 16px;">${r.ord_status}</td>
                                        </c:when>
                                        <c:when test="${r.ord_status eq 'Waiting' || r.ord_status eq 'Preparing'}">
                                            <td style="color: #0397d1; font-size: 16px;">${r.ord_status}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style="color: #1ec708;font-size: 16px;">${r.ord_status}</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td style="font-size: 16px;"><a class="view" href="orderDetailsManager?bid=${r.ord_id}">View</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <style>
                            .th , td{
                                padding: 10px;
                            }
                        </style>

                    </table>
                    <a class="show" href="orderManager" style="display: flex;justify-content: center;">Show All</a>

                </div>
                <!-- End of Recent Orders -->
            </main>
            <!-- End of Main Content -->
        </div>

    </body>

</html>