<%@page import="daoEmployees.OrderDetailDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/EorderDetail.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .title {
                color: #343a40;
                font-size: 2rem;
                font-weight: bold;
            }

            .box1 {
                background-color: #E7BA71;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                height: auto; /* Ensures the box takes the full height of its container */
                min-height: 50px; /* Ensures a minimum height */
                width: auto;
            }

            .dropdown select {
                color: black;
                width: 200px;
                padding: 10px;
                font-size: 16px;
                border: 1px solid;
                border-radius: 5px;
            }

            .btnUpdate button {
                height: 45px;
                width: 100px;
                background-color: #007bff;
                border: none;
                border-radius: 20px;
                padding: 10px 20px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
                font-weight: 600
            }

            .btnUpdate button:hover {
                background-color: #0056b3;
            }

            .customer-info div {
                margin-bottom: 10px;
            }

            .customer-info span {
                font-size: 20px;
                color: #343a40;
            }

            .order-detail table {
                background-color: #fff;
                border-radius: 10px;
                overflow: hidden;
                width: 100%; /* Ensure it takes the full width of the container */
            }

            .order-detail th, .order-detail td {
                vertical-align: middle;
                padding: 10px; /* Add padding to make the table more spacious */
            }

            .order-detail img {
                width: 100px;
                height: auto;
                margin-right: 10px;
            }

            .total th, .total td {
                font-size: 1.2rem;
            }

            .btnContainer {
                margin-top: 20px;
            }

            .result {
                color: white;
                background-color: #28a745;
                border-radius: 5px;
                text-align: center;
            }
            .order-detail {
                display: flex;
                justify-content: flex-start;
                width: 100%; /* Ensure it takes the full width of the container */
            }

            .custom-table {
                margin-right: 50px; /* Adjust the value as needed */
            }
            .btnContainer {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100%;
            }
            /* Thay đổi màu nền cho các options */
            #status option {
                background-color: white;
                color: black;
            }

            #status option:checked {
                background-color: yellow; /* Màu nền của option đã chọn */
                color: black;
            }

            /* Thiết lập màu nền cho select khi chọn */
            #status {
                height: 45px;
                background-color: #f1f1f1;
                color: black;
                padding: 10px;
                border-radius: 5px;
            }


        </style>
    </head>
    <body>
        <header>
            <%@include file="/EmployeePage/headerEmployees.jsp" %>
        </header>

        <div class="container-fluid my-4" style="min-height: 100vh;padding-top: 90px;">
            <div class="d-flex justify-content-center "style=" padding: 20px;">
                <div class="d-flex justify-content-center px-2 py-1 title my-3" style="color: black; background-color: white ;font-size: 50px">Order Detail</div>
            </div>
            <%
                try {
                    String result = (String) request.getAttribute("result");
                    if (!result.equals("")) {

            %>
            <div class="d-flex justify-content-center result p-2 mx-auto mt-4" style='margin-bottom:50px;border-radius: 20px;'><%=result%></div>
            <%
                    }
                } catch (Exception e) {
                }
            %>
            <%
                String orderId = request.getAttribute("orderId") + "";
                ResultSet customerInfo = (ResultSet) request.getAttribute("orderInfo");
                int status = 0;
                if (customerInfo.next()) {
                    if (customerInfo.getString("ord_status").equals("Waiting")) {
                        status = 1;
                    } else if (customerInfo.getString("ord_status").equals("Preparing")) {
                        status = 2;
                    } else if (customerInfo.getString("ord_status").equals("Completed")) {
                        status = 3;
                    } else if (customerInfo.getString("ord_status").equals("Rejected")) {
                        status = 4;
                    } else if (customerInfo.getString("ord_status").equals("Cancelled")) {
                        status = 5;
                    }
            %>
            <div class="row">
                <div class="col-lg-4">
                    <div class="box1" style="background: white;">
                        <form id="updateForm" method="post" action="/employee?orderId=<%= orderId%>">
                            <div class="order-status mt-3">
                                <div class="dropdown mb-3" style="height:50px;">
                                    <select name="status" id="status">
                                        <option value="Waiting" <%= status == 1 ? "selected" : ""%> style="background-color: orange;">Waiting</option>
                                        <option value="Preparing" <%= status == 2 ? "selected" : ""%> style="background-color:pink;">Preparing</option>
                                        <option value="Completed" <%= status == 3 ? "selected" : ""%> style="background-color: green;">Completed</option>
                                        <option value="Rejected" <%= status == 4 ? "selected" : ""%> style="background-color: red;">Rejected</option>
                                        <option value="Cancelled" <%= status == 5 ? "selected" : ""%> style="background-color: brown;">Cancelled</option>
                                    </select>
                                </div>

                            </div>
                            <div class="customer-info mt-4">
                                <div style="font-size:16px;">Customer: <p style="font-size:16px; font-weight:200"><%= customerInfo.getString("cus_name")%></span> <a id="more" href="/employee/customerInfoEmployees/<%=orderId%>/<%= customerInfo.getString("cus_phone")%>" style='margin-left:10px;'><i class="fa-solid fa-circle-info"></i></a></div>
                                <div style="font-size:16px;">Address: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("cus_address")%></span></div>
                                <div style="font-size:16px;">Phone: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("cus_phone")%></span></div>
                                <div style="font-size:16px;">Payment: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("ord_pay")%></span></div>
                                <div style="font-size:16px;">Type: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("ord_type")%></span></div>
                                <div style="font-size:16px;">Order date: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("ord_date")%></span></div>
                                <div style="font-size:16px;">Note: <span style="font-size:16px; font-weight:200"><%= customerInfo.getString("ord_note")%></span></div>
                                <div class="mt-3" style="display:flex; justify-content: center;justify-items: center;">
                                    <div class="btnUpdate text-center" >
                                        <button id="btnUpdateStatus" type="submit" name="btnUpdateStatus" value="Update">Update</button>
                                    </div>
                                    <div class="back">
                                        <input type="button" class="submit" value="Back" onclick="window.location.href = '/employee/orderListEmployees';"  style="width: 100px; font-size: 20px;height: 45px; background: red; color: white; font-weight:600; border-radius: 20px; font-size: 16px;">
                                    </div>
                                </div>

                                <%
                                    }
                                %>
                            </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="row order-detail" style="justify-content: flex-start; border: 1px solid;border-radius:  10px;">
                        <div style="width: 100%; margin: 0 10px 0 10px;">
                            <div style="height: auto; overflow-y: auto; overflow-x: hidden;">
                                <table class="table table-bordered custom-table" style="width: 100%;">
                                    <colgroup>
                                        <col style="width: 50%;">
                                        <col style="width: 50%;">
                                        <col style="width: 50%;">
                                        <col style="width: 50%;">
                                    </colgroup>
                                    <thead>
                                        <tr align="center">
                                            <th scope="col" style="color: black;">Perfume</th>
                                            <th scope="col" style="color: black;">Unit Price</th>
                                            <th scope="col" style="color: black;">Quantity</th>
                                            <th scope="col" style="color: black;">Sum</th>
                                        </tr>
                                    </thead>
                                    <tbody id="perfume-body">
                                        <%
                                            ResultSet detailList = (ResultSet) request.getAttribute("orderDetailList");
                                            double total = 0;
                                            while (detailList.next()) {
                                        %>
                                        <tr align="center" class="perfume-row">
                                            <td align="left">
                                                <img src="<%=detailList.getString("per_img")%>" alt="Perfume Image" />
                                                <%= detailList.getString("per_name")%>
                                            </td>
                                            <td class="py-auto"><%= detailList.getDouble("per_price")%></td>
                                            <td><%= detailList.getInt("quantity")%></td>
                                            <td><%= (double) Math.round(detailList.getDouble("per_price") * detailList.getInt("quantity") * 100) / 100%></td>
                                        </tr>
                                        <%
                                                total += detailList.getDouble("per_price") * detailList.getInt("quantity");
                                            }
                                        %>
                                    </tbody>
                                    <tfoot>
                                        <tr class="total" align="center">
                                            <th colspan="3" style="color: white;">Total</th>
                                            <th style="color: white;"><%=(double) Math.round(total * 100) / 100%></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/EmployeePage/footerEmployees.jsp" %>
    </body>
</html>
