<%@page import="java.sql.ResultSet"%>
<%@page import="daoEmployees.CustomerDAO"%>
<%@page import="modelEmployees.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/EmployeePage/css/EcustomerInfo.css">
    </head>
    <%@include file="/EmployeePage/headerEmployees.jsp" %>
    <body>
        <%
            Customer customerInfo = (Customer) request.getAttribute("customerInfo");
        %>
        <div class="container-fluid" style="min-height: 155vh; padding-top: 120px;">
            <h2 class="title mx-auto my-5" style="color: black; background-color:white;font-weight: 800;font-size: 45px;width: auto;">Customer Information</h2>
            <div class="customer-info mx-auto p-5 d-flex flex-column justify-content-center" style="border: 1px solid; background: white;display: flex;justify-content: center;justify-items: center;height: auto;width: 50%;">
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px;">Name: </div>
                    <div class="info-value" style="background: white;border: none;font-size: 16px;padding-left: 0px;width: 440px;"><%= customerInfo.getName()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px; ">Phone: </div>
                    <div class="info-value" style="background: white;border: none;font-size: 16px;padding-left: 0px;width: 440px;"><%= customerInfo.getPhone()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px; ">Email: </div>
                    <div class="info-value" style="background: white;border: none;font-size: 16px; padding-left: 0px;width: 440px;"><%= customerInfo.getEmail()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px; ">Address: </div>
                    <div class="info-value" style="height: 4.5rem; justify-content: start;width: 440px;font-size: 16px;padding-left: 0px; background: white;border:none;">
                        <%= customerInfo.getAddress()%>
                    </div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px; ">Birthday: </div>
                    <div class="info-value" style="background: white;border: none;font-size: 16px;padding-left: 0px;width: 440px;"><%= customerInfo.getBirthday()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items" style="background:white;border: none;font-size: 16px; ">Rejected Count: </div>
                    <div class="info-value" style="background: white;border: none;font-size: 16px;padding-left: 0px;width: 440px;"><%= customerInfo.getCancel_count()%></div>
                </div>
            </div>

            <div class="title mx-auto my-5" style="color: black;background-color: white;font-weight: 800;  font-size: 45px;width: auto;">Orders</div>
            <div class="history-order w-75 mx-auto" border="1" >
                <table class="table table-bordered" style="border: 1px solid;border-radius: 10px;">
                    <thead class="table-header">

                        <tr align="center" >
                            <th scope="col" style="color: black;border: 1px solid;">Order ID</th>
                            <th scope="col" style="color: black;border: 1px solid;">Status</th>
                            <th scope="col" style="color: black;border: 1px solid;">Date</th>
                        </tr>
                    </thead>
                    <tbody class="table-body">
                        <%
                            ResultSet order = (ResultSet) request.getAttribute("order");
                            String orderDetailId = request.getAttribute("orderDetailId") + "";
                            while (order.next()) {
                        %>
                        <tr  align="center">
                            <td><%= order.getString("ord_id")%></td>
                            <td>
                                <%= order.getString("ord_status")%>
                            </td>
                            <td><%= order.getString("ord_date")%></td>
                        </tr>    
                        <%}%>
                    </tbody>
                </table>
            </div>

                    <div class=" mx-auto my-5" " style='display: flex; justify-content: center;'>
                <a href="/orderDetailEmployees/<%= orderDetailId%>">
                    <button style="color:white;background: red; width: 150px; height: 50px;border-radius: 20px;font-weight: 600">Back</button>
                </a>
            </div>
        </div>
    </body>
    <%@include file="/EmployeePage/footerEmployees.jsp" %>
</html>
