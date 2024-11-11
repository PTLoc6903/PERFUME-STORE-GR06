<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="daoEmployees.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfume Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/EnewOrderList.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .btn-pagination button {
                font-size: 50px;
                width: 70px;
                border: none;
                color: black;
                background-color: white;
                cursor: pointer;
            }
            #pagination {
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <%@include file="/EmployeePage/headerEmployees.jsp" %>
    <body>
        <div class="container-fluid" style="min-height: 100vh; padding-top: 150px;">
            <div class="d-flex justify-content-center">
                <div class="d-flex justify-content-center px-2 py-1 title my-3" style="color: black; background-color: white;font-size: 50px">New Order List</div>
            </div>
            <%
                String startDate = "";
                String endDate = "";
                try {
                    startDate = request.getAttribute("startDate") + "";
                    endDate = request.getAttribute("endDate") + "";
                } catch (Exception e) {
                }
            %>
            <table class="table table-bordered" style="color: white; font-size: 16px;font-weight: normal">
                <thead>
                    <tr align="center">
                        <th scope="col" style="color: black; background-color: white">Order ID</th>
                        <th scope="col" style="color: black; background-color: white">Status</th>
                        <th scope="col" style="color: black; background-color: white">Order Date</th>
                        <th scope="col" style="color: black; background-color: white">Customer Name</th>
                        <th scope="col" style="color: black; background-color: white">Phone</th>
                        <th scope="col" style="color: black; background-color: white">Type</th>
                        <th scope="col" style="color: black; background-color: white">Payment</th>
                        <th scope="col" style="color: black; background-color: white">Total</th>
                        <th scope="col" style="color: black; background-color: white">Detail</th>
                    </tr>
                </thead>
                <tbody id="itemList">
                    <%
                        OrderDAO ordDAO = new OrderDAO();
                        ResultSet rs = ordDAO.getNewOrder();
                        while (rs.next()) {
                    %>
                    <tr align="center">
                        <td><%= rs.getString("ord_id")%></td>
                        <td>
                            <%
                                String status = rs.getString("ord_status");
                                if (status.equals("Preparing")) {
                            %>
                            <div class="btn btn-primary" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Completed")) {
                            %>
                            <div class="btn btn-success" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Waiting")) {
                            %>
                            <div class="btn btn-warning" style="font-weight: bold; font-size: 16px; border-radius: 20px; height: 40px; width: 100px;"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Rejected")) {
                            %>
                            <div class="btn btn-secondary" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Cancelled")) {
                            %>
                            <div class="btn btn-danger" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                                }
                            %>
                        </td>
                        <td><%= rs.getString("ord_date")%></td>
                        <td><%= rs.getString("cus_name")%></td>
                        <td><%= rs.getString("cus_phone")%></td>
                        <td><%= rs.getString("ord_type")%></td>
                        <td><%= rs.getString("ord_pay")%></td>
                        <td><%= rs.getString("ord_total")%></td>
                        <td>
                            <a class="btn btn-outline-primary btnView" href="/orderDetailEmployees/<%= rs.getString("ord_id")%>" style="font-weight: bold; font-size: 25px; display: none">View</a>
                            <c:choose>
                                <c:when test="${sessionScope.phone!=null}">
                                    <a class="btn btn-outline-success btnTakeOrder" href="/employee/takeOrderEmployees/<%= rs.getString("ord_id")%>" style="font-weight: bold; font-size: 16px;height: 40px;border-radius: 20px;color: white; background: green;">Take Order</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-outline-success btnTakeOrder" href="/employee/loginEmployees" style="font-weight: bold; font-size: 16px;height: 40px; border-radius: 20px;color: white; background: green;">Take Order</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>   
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="btn-pagination" id="pagination">
                <button id="prevButton">
                    <i class='bx bx-left-arrow-alt'></i>
                </button>
                <button id="nextButton">
                    <i class='bx bx-right-arrow-alt'></i>
                </button>
            </div>  

        </div>
    </body>
      <%@include file="/EmployeePage/footerEmployees.jsp" %>
    <script>
        // Pagination

        const itemList = document.getElementById('itemList');
        const prevButton = document.getElementById('prevButton');
        const nextButton = document.getElementById('nextButton');
        const rows = itemList.querySelectorAll('tr');

        const rowsPerPage = 5;
        let currentPage = 1;

        function showPage(pageNumber) {
            rows.forEach((row, index) => {
                if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        showPage(currentPage);

        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        });

        nextButton.addEventListener('click', () => {
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        });

        // Add event listener to change the button color when clicked
        document.querySelectorAll('.btnTakeOrder').forEach(button => {
            button.addEventListener('click', function () {
                this.style.backgroundColor = 'red';
            });
        });

        // AJAX search order by ID
        document.querySelector('.searchButton button').addEventListener('click', function () {
            const searchValue = document.querySelector('.searchText input').value;

            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Update itemList element
                    document.getElementById('itemList').innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "/employee/searchByOrderIdEmployees?orderId=" + searchValue, true);
            xhttp.send();
        });
    </script>
</html>
