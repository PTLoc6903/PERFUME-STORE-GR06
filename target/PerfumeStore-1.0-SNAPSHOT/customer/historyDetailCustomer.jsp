

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link href="css/ChistoryDetail.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store - Order Detail</title>
    </head>

    <body>
        <%@include file="headerCustomer.jsp"%>
        <div style="margin-top: 160px" ></div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->

            <div class="header">
                <div class="name-tittle" style="font-size: 2rem; margin-bottom: 20px;">
                    Order Detail History
                </div>
            </div>
            <!-- Orders Perfume Information Table -->

            <!-- End of Perfume Order Information Orders -->
            <div class="history-order row">
                <div class="col-md-12">
                    <div class="orders-table" style="background: white;">
                        <h2 style="font-weight: 600; text-align: center; font-size: 25px;" class="order-list">Order Details</h2>
                        <table>
                            <thead  style="text-align: center">
                                <tr >
                                    <th style="font-size: 16px;">Order ID</th>
                                    <th style="font-size: 16px;">Perfume</th>
                                    <th style="font-size: 16px;">Unit Price</th>
                                    <th style="font-size: 16px;">Quantity</th>
                                    <th>Order Status</th>
                                    <th>Payment Methods</th>
                                    <th>Order Date</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="o" items="${requestScope.orders}">
                                    <tr>
                                        <td style="font-size: 16px;">${o.getId()}</td>
                                        <td style="font-size: 16px;">${o.getPerfumeName()}</td>
                                        <td style="font-size: 16px;">${o.getPrice()}$</td>
                                        <td style="font-size: 16px;">${o.getQuantity()}</td>
                                        <td style="font-size: 16px;">${order.getStatus()}</td>
                                        <td style="font-size: 16px;">${order.getPay()}</td>
                                        <td style="font-size: 16px;">${order.getOrderDate()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="total-order" style="font-size: 20px;">Total Order: ${order.getTotal()}$</div>
                    </div>
                </div>

            </div> 
            <c:choose>
                <c:when test="${order.getStatus() eq 'Waiting'&&order.getPay() eq 'Banking'}">
                    <div style="display: flex;">
                        <div style="width: 450px; padding: 20px; background-color: #c2c2c2; margin-top: 20px; border-radius: 5px;">
                            <p style="margin-top: 5px; font-size: 20px; font-weight: 500;">Please pay to proceed with the order
                            </p><p style="font-size: 20px; font-weight: 500;" >(If you have already paid, please skip)</p>
                            <p style="font-size: 20px; font-weight: 500;">Scan the QR code below:</p>
                            <img style="width: 200px; margin-top: 20px;" src="../img/qrcode.jpg" alt="">
                        </div>

                        <div class="cancel-order" style="margin-top: 20px;margin-bottom: 20px;">
                            <button onclick="cancelOrder('${order.getId()}')">Cancel Order</button>
                        </div>

                    </div>
                </c:when>

                <c:when test="${order.getStatus() eq 'Waiting'}">
                    <div style="display: flex;">
                        <div  class="cancel-order">
                            <button style="margin:0" onclick="cancelOrder('${order.getId()}')">Cancel Order</button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>              
            <div class="back-order" style="justify-content: right;display: flex;">
                <button onclick="window.location.href = '/customer/historyCustomer'" style="margin-top: 20px;margin-bottom: 20px;border-radius: 5px;color: white;background: blue;width: 100px;height: 50px;font-weight: 600">Back</button>
            </div>

            <!-- End of Main Content -->



        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
                    function cancelOrder(id) {
                        Swal.fire({
                            title: 'Are you sure?',
                            text: "Do you really want to cancel this order?",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#C21010',
                            cancelButtonColor: '#aaa',
                            confirmButtonText: 'Yes,Cancel it!',
                            cancelButtonText: 'No,Keep it'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Proceed to cancel the order if the user confirms
                                $.ajax({
                                    url: "/customer/cancelOrderCustomer",
                                    type: "get",
                                    data: {
                                        id: id
                                    },
                                    success: function (data) {
                                        Swal.fire({
                                            icon: 'success',
                                            text: 'Order cancelled successfully'
                                        }).then(() => {
                                            location.reload();
                                        });
                                    },
                                    error: function (xhr) {
                                        Swal.fire({
                                            icon: 'error',
                                            text: 'The order is processing and cannot be cancelled.'
                                        });
                                    }
                                });
                            }
                        });
                    }


                    window.addEventListener('load', function () {
                        // Gọi hàm updateHistory() sau khi trang đã tải hoàn toàn.
                        checkForChanges();
                    });
                    function checkForChanges() {
                        $.ajax({
                            url: '/customer/updateHistoryDetailCustomer',
                            type: 'GET',
                            data: {
                                id: '${order.getId()}'
                            },
                            success: function (data) {
                                // Xử lý dữ liệu trả về từ API endpoint

                                // Cập nhật trang "history.jsp" nếu có thay đổi
                                document.getElementById("main").innerHTML = data;
                            },
                            complete: function () {
                                // Thiết lập một khoảng thời gian cho việc kiểm tra lại (đặt thời gian tùy ý)
                                setTimeout(checkForChanges, 5000); // Ví dụ: kiểm tra lại sau mỗi 5 giây
                            }
                        });
                    }

    </script>
</html>