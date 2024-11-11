

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <link href="css/Cpurchase.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store - Purchase</title>
    </head>

    <body>
        <%@include file="headerCustomer.jsp" %>
        <div style="margin-top: 100px" ></div>
        <div class="container">


            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main style="margin-top: 160px; margin-bottom: 50px;">

                <!-- Add Perfume Table -->
                <div>
                    <h1 style="text-align: center; margin-bottom: 20px; font-size: 50px; font-weight: 800; color:  #C21010">Your Order</h1>
                </div>
                <div class="acc-info">
                    <div class="left-info" style="margin-left: 0%;">
                        <ul style="margin-left: 0%; border: 1px solid; border-radius: 10px;">
                            <h2 style="font-weight: 600; margin-bottom: 30px; text-align: center; font-size:25px;">Customer Information</h2>
                            <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0);font-size: 16px;"><label style="font-size: 16px;">Your Name: *</label><input type="text" name="name"  readonly value="${customer.getName()}" style="border: 1px solid;font-size: 16px;background: #e9ecef;"></li>
                            <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0);font-size: 16px;" ><label style="font-size: 16px;">Your Phone: *</label><input type="text" name="number"  readonly value="${customer.getPhone()}" style="border: 1px solid;font-size: 16px;background: #e9ecef;"></li>
                                <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0); font-size: 16px;"><label style="font-size: 16px;">Address: *</label>
                                    <textarea style=" border-radius: 10px;font-size: 16px;background: #e9ecef;resize:none" cols="30" rows="3" readonly > ${customer.getAddress()}</textarea>
                                </li>
                                <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0);font-size: 16px;">
                                    <label style="font-size: 16px;">Shipping Method:</label>
                                    <input style=" margin-left: 0px;" name="a" type="radio" id="delivery"  checked
                                           value="Delivery">
                                    <label style="font-weight: 400; color: black; font-size: 16px;" for="delivery">Delivery</label><br>
                                    <input style=" margin-left: 135px;" name="a" type="radio" id="delivery"
                                           value="At Store">
                                    <label style="font-weight: 400; color: black; font-size: 16px;" for="pickup">Pickup At Store</label><br>
                                </li>
                                <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0);font-size: 16px;"><label style="font-size: 16px;">Purchase Method:</label>
                                    <select  id="pay" style="font-size: 16px;">
                                        <option value="COD" >Cash On Delivery</option>
                                        <option value="Banking">Online Banking</option>
                                    </select>
                                </li>
                                <li style="box-shadow: 0 0 0px rgba(0, 0, 0, 0);"><label style="font-size: 16px;">Note:</label>
                                    <textarea  style="border-radius: 10px;resize:none" cols="30" rows="3" id="note" value=""></textarea>
                                </li>

                        </ul>
                    </div>
                    <div class="right-info">
                        <div class="orders-table" style="margin-left: 0%; border: 1px solid; border-radius: 10px;">
                            <h2 style="text-align: center; font-weight: 600; margin-bottom: 20px;font-size: 25px;">Order Details</h2>
                            <table style="background: white;">
                                    <thead style="font-size: 16px; background:white;color: black;border: 1px solid;" >
                                        <tr style="text-align: center" >    
                                            <th colspan="2" style="border: 1px solid; padding: 5px;">Perfume</th>
                                            <th style="border: 1px solid; padding: 5px;">Unit Price</th>
                                            <th style="border: 1px solid; padding: 5px;">Quantity</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="f" items="${requestScope.carts}">
                                            <tr>
                                                <td class="perfume-info" style="border-top: 1px solid; border-bottom: 1px solid;; border-left: 1px solid;; border-right: none">
                                                    <img src="${f.getPerfume().getImg()}" alt="">
                                                </td>
                                                <td style="border-top: 1px solid;; border-bottom: 1px solid;; border-left: none; border-right: 1px solid;"><a href="#">${f.getPerfume().getName()}</a></td>
                                                <td style="border: 1px solid;">${f.getPerfume().getRealPrice()}$</td>
                                                <td style="border: 1px solid;">${f.getQuantity()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <p style="margin-left: 20px; margin-top: 20px; font-size: 18px;">Provisional costs: ${total}$</p>
                                <hr>
                                <h4 style="font-weight: 600; margin-top: 20px; color: #C21010; ">Total Order: ${total}$</h4>
                        </div>
                        <div class="btn-product" style="margin-left: 25%;">
                            <div class="btn-add-product">
                                <button onclick="order()">
                                    Order Now
                                </button>
                            </div>
                            <!-- Chuyển đến trang gio hàng -->
                            <div class="btn-cancel-product">
                                <button onclick="cart()" style="background: blue;">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </main>

            <!-- End of Main Content -->
        </div>
    </body>

    <script>
        function cart() {
            window.location = "/customer/cartCustomer";
        }
        function order() {
            var note = document.getElementById("note").value;
            var delivery = document.getElementById("delivery").value;
            var pay = document.getElementById("pay").value;
            var total = ${total};
            window.location = "/customer/finishOrderCustomer?note=" + note + "&delivery=" + delivery + "&pay=" + pay + "&total=" + total;
        }
    </script>
</html>

