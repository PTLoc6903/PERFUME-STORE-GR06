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
    <link href="css/Chistory.css" rel="stylesheet" type="text/css" />
    <title>Perfume Store - Order History</title>
</head>

<body>
    <%@include file="headerCustomer.jsp"%>
    <div style="margin-top: 160px"></div>
    <div class="container">
        <!-- Main Content -->
        <main>
            <div class="header">
                <div class="name-tittle" style="font-size: 2rem;">Order History</div>
            </div>
            <!-- Perfume Management Table -->
            <div class="orders-table">
                <div id="tableContainer">
                    <table>
                        <thead>
                            <tr style="text-align: center">
                                <th data-filter="orderId" onclick="sortTable(0)" style="font-size: 16px;">Order ID</th>
                                <th data-filter="status" onclick="sortTable(1)" style="font-size: 16px;">Status</th>
                                <th data-filter="dateOrder" onclick="sortTable(2)" style="font-size: 16px;">Date Order</th>
                                <th data-filter="paymentMethods" onclick="sortTable(4)" style="font-size: 16px;">Payment Methods</th>
                                <th data-filter="total" onclick="sortTable(5)" style="font-size: 16px;">Total</th>
                                <th data-filter="details"></th>
                            </tr>
                        </thead>

                        <tbody id="itemList">
                            <c:forEach var="o" items="${requestScope.orders}">
                                <tr style="font-size: 16px;">
                                    <td style="font-size: 16px;">${o.getId()}</td>
                                    <td class="status" style="font-size: 16px;">
                                        <c:choose>
                                            <c:when test="${o.getStatus() eq 'Cancelled' || o.getStatus() eq 'Rejected'}">
                                                <div style="color: #C21010;" class="status">${o.status}</div>
                                            </c:when>
                                            <c:when test="${o.getStatus() eq 'Waiting' || o.getStatus() eq 'Preparing'}">
                                                <div style="color: #0397d1;" class="status">${o.getStatus()}</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="color: #1ec708;" class="status">${o.getStatus()}</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="font-size: 16px;">${o.getOrderDate()}</td>
                                    <td style="font-size: 16px;">${o.getPay()}</td>
                                    <td style="font-size: 16px;">${o.getTotal()}$</td>
                                    <td style="font-size: 16px;">
                                        <button onclick="viewOrder('${o.getId()}')">View</button>
                                        <c:choose>
                                            <c:when test="${o.getStatus() eq 'Waiting'}">
                                                <button onclick="cancelOrder('${o.getId()}')">Cancel</button>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- End of Perfume Management Orders -->
        </main>
        <!-- End of Main Content -->
    </div>
    <%@include file="footerCustomer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        // Function to show confirmation dialog before canceling the order
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

        // Function to view order details
        function viewOrder(id) {
            window.location = "/customer/historyDetailCustomer?id=" + id;
        }

        // Function to auto-update the order history page
        window.addEventListener('load', function () {
            checkForChanges();
        });

        function checkForChanges() {
            $.ajax({
                url: '/customer/updateHistoryCustomer',
                type: 'GET',
                success: function (data) {
                    document.getElementById("itemList").innerHTML = data;
                },
                complete: function () {
                    setTimeout(checkForChanges, 5000); // Check every 5 seconds
                }
            });
        }

        // Function to refresh the page when coming back from the order details page
        window.addEventListener("pageshow", function (event) {
            var historyTraversal = event.persisted ||
                (typeof window.performance != "undefined" &&
                    window.performance.navigation.type === 2);
            if (historyTraversal) {
                location.reload();
            }
        });
    </script>
</body>

</html>
