<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/orderDetail.css">
        <title>Perfume Store manager</title>

    </head>
    <%@include file="sidebarManager.jsp" %>
    <body>
        <div class="container-i">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/login");
                    }
                %>                
                <div class="header" style="padding-top: 0px;;">
                    <div class="logo-tittle">
                        <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>
                    <div class="name-tittle" style='font-size:25px;'>
                        Order Details
                        <div class="order-id" style="margin-top: 0px;font-size:25px;">
                            Order ID: ${orderId}
                        </div>
                        <c:choose>
                            <c:when test="${invoiceInfo.ord_status eq 'Cancelled' || invoiceInfo.ord_status eq 'Rejected'}">
                                <div style="color: #C21010;font-size: 25px;" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:when>
                            <c:when test="${invoiceInfo.ord_status eq 'Waiting' || invoiceInfo.ord_status eq 'Preparing'}">
                                <div style="color: #0397d1; font-size: 25px;" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div style="color: #1ec708; font-size: 25px;" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Orders Perfume Information Table -->
                <div class="orders-table">
                    <h2 class="order-list" style='margin:20px;'>Order Perfume Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2" style="background-color: green; font-size: 16px;">Perfume</th>
                                <th style="background-color: green;  font-size: 16px;">Unit Price</th>
                                <th style="background-color: green;  font-size: 16px;">Quantity</th>
                                <th style="background-color: green;  font-size: 16px;">Total Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${requestScope.listOrderDetail}">
                                <tr>
                                    <td class="perfume-info">
                                        <img src="${o.img}" alt="">
                                    </td>
                                    <td style=" font-size: 16px;"> <a style="color: #000" href="perfumeDetailsManager?bid=${o.perfume_id}">${o.name_perfume}</a></td>
                                    <td style=" font-size: 16px;">${o.unit_price}$</td>
                                    <td style=" font-size: 16px;">${o.quantity}</td>
                                    <td style=" font-size: 16px;">${o.total_price}$</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" var="abc" value="${totalOrder}"/>
                    <div class="total-order" style=" font-size: 20px;">Total Order: ${abc}$</div>
                </div>
                <!-- End of Perfume Order Information Orders -->
                <ul class="other-info">
                    <li>
                        <div class="header-info">
                            <h2 class="customer-info">Customer</h2>
                            <a href="customerDetailsManager?bid=${cusInfo.phone}">View Detail</a>
                        </div>
                        <hr>
                        <span>
                            <p><span class="bold-numbers">Name: </span>${cusInfo.name}</p>
                            <p><span class="bold-numbers">Phone: </span>${cusInfo.phone}</p>
                            <p><span class="bold-numbers">Address: </span>${cusInfo.address}</p>
                        </span>
                    </li>
                    <li>
                        <h2 class="customer-info">Employee</h2>
                        <hr>
                        <span>
                            <p><span class="bold-numbers">Order Taker: </span>${invoiceInfo.emp_name}  </p>
                            <p><span class="bold-numbers">Order Type: </span>${invoiceInfo.ord_type}  </p>
                            <p><span class="bold-numbers">Payment Methods: </span>${invoiceInfo.ord_pay}  </p>
                            <p><span class="bold-numbers">Date Order: </span>${invoiceInfo.ord_date}  </p> 
                            <p><span class="bold-numbers">Note: </span>${invoiceInfo.ord_note} </p>
                        </span>
                    </li>
                </ul>
                <div style="justify-content: end;display: flex;">
                    <button onclick="window.location.href = '/orderManager'" style="margin-top: 10px; margin-bottom: 20px; border-radius: 20px; color: white; background: blue; width: 100px; height: 50px;font-weight: 800;">Back</button>
                </div>

            </main>

            <style>
                .th,td{
                    padding: 0px;
                }
                .orders-table {
                    background-color: #fff;
                    padding: 5px;
                    border-radius: 5px;
                    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
                    margin-top: 20px;
                    border: 1px solid;
                    border-radius: 20px;
                }
                .other-info p {
                    font-size: 16px;
                }
            </style>
            <!-- End of Main Content -->



        </div>
    </body>


</html>