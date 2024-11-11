<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="css/CperfumeDetail.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store - Perfume Detail</title>
    </head>

    <body>
        <%@include file="headerCustomer.jsp"%>
        <div style="margin-top:160px"></div>
        <div class="container">
            <!-- Main Content -->
            <main>
                <div class="header">
                    <div class="name-tittle">
                        Perfume Details
                    </div>
                </div>
                <!-- Perfume Detail -->
                <div class="main-perfume-details">
                    <div class="perfume-detail">
                        <div class="perfume-img">
                            <img src="${perfume.getImg()}" alt="">
                        </div>
                        <div class="perfume-edit">
                            <p style="margin-right: 5px; font-size: 2rem; font-weight: 800; color: black;">${perfume.getName()}</p>
                            <div class="price-section">
                                <p style="font-size: 20px; font-weight: 500;">Price:</p>
                                <c:choose>
                                    <c:when test="${perfume.getSale() == 0}">
                                        <p style="font-size: 20px; font-weight: 500;">${perfume.getRealPrice()}$</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p c style="font-size: 20px;" class="original-price">${perfume.getPrice()}$</p>
                                        <p style="font-size: 20px; font-weight: 500; color: red;">${perfume.getRealPrice()}$</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="edit-quantity">
                                <div style="display: flex; align-items: center; margin: 20px;justify-content: center" class="quantity mt-2">
                                    <button style="font-weight: 800; color: black;width: 50px;" class="btn btn-sub">-</button>
                                    <input type="number" id="quantity" class="mx-2" value="1" min="1" style="margin-top: 30px; padding: 10px; width: 60px; text-align: center;" />
                                    <button style="font-weight: 800; color: black; width: 50px;" class="btn btn-plus">+</button>
                                </div>
                                <button onclick="addToCartWithQuantity('${perfume.getId()}')" style="margin-bottom: 80px; width: 100px; padding: 10px; margin-top: 0px; background-color: #C21010;border-radius: 20px;" >
                                    <ion-icon style="font-size: 22px;" name="cart"></ion-icon>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="perfume-info-detail">
                        <h2>Perfume Information</h2>
                        <p><span class="bold-numbers">Category Name:</span> ${perfume.getCategory().getName()}</p>
                        <p><span class="bold-numbers">Description:</span> ${perfume.getDescription()}</p>
                        <p><span class="bold-numbers">Price :</span> ${perfume.getRealPrice()}$</p>
                    </div>
                </div>
                <h2 style="margin: 20px; color: #C21010;">We think you'll like them too</h2>
                <!-- End Perfume Detail -->
                <!-- List Menu -->
                <div class="list-menu row mb-5" >
                    <c:forEach var="perfume" items="${requestScope.topFour}">
                        <div class="col-md-3">
                            <div class="best-seller">
                                <img src="${perfume.getImg()}" alt="">
                                <div class="name-perfume">
                                    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
                                    <c:choose>
                                        <c:when test="${fn:length(perfume.getName()) > 15}">
                                            ${fn:substring(perfume.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${perfume.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>

                                <div class="perfume-info">
                                    <div class="price-section">
                                        <p>Price:</p>
                                        <c:choose>
                                            <c:when test="${perfume.getSale() == 0}">
                                                <p class="discounted-price">${perfume.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${perfume.getPrice()}$</p>
                                                <p class="discounted-price">${perfume.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>  
                                    <p>Units Sold: (+15)</p> 
                                </div>
                                <div class="perfume-btn">
                                    <button onclick="viewPerfume('${perfume.getId()}')" style="border-radius: 20px;">View</button>
                                    <button onclick="addToCart('${perfume.getId()}')" style="border-radius: 20px;">
                                        <ion-icon style="font-size: 22px;" name="cart" ></ion-icon>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="not-found" style="display: none;">
                        <p>Name perfume not found !</p>
                    </div>
                </div>

                <style>
                    body {
                        background-image: url('/img/bgblue (1).jpg');
                        background-size: cover;
                        background-repeat: no-repeat;
                        background-position: center;
                        background-attachment: fixed;
                    }
                    .best-seller {
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                        border: 1px solid #ddd;
                        padding: 10px;
                        border-radius: 8px;
                        height: 95%;
                        background-color: white; /* Giữ màu sắc hiện tại */
                    }
                    .best-seller img {
                        max-width: 100%;
                        height: auto;
                        object-fit: cover;
                        border-radius: 8px;
                    }
                    .name-perfume {
                        font-weight: 600;
                        color: #C21010;
                        margin-top: 10px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                        height: 50px;
                        text-align: center;
                    }
                    .perfume-info {
                        margin-top: 10px;
                    }
                    .price-section {
                        margin-bottom: 5px;
                        margin-top: 10px;
                    }
                 
                    .perfume-btn {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 10px;
                    }
                    .perfume-btn button {
                        flex: 1;
                        margin: 0 5px;
                        background-color: #C21010;
                        color: white;
                        border: none;
                        padding: 8px;
                        border-radius: 4px;
                    }
                </style>
                <!-- End List Menu -->
            </main>
            <!-- End of Main Content -->
        </div>
        <%@include file="footerCustomer.jsp"%>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
                                        const quantityInput = document.getElementById("quantity");
                                        const minusButton = document.querySelector(".btn-sub");
                                        const plusButton = document.querySelector(".btn-plus");

                                        minusButton.addEventListener("click", () => {
                                            let quantity = parseInt(quantityInput.value);
                                            if (quantity > 1) {
                                                quantityInput.value = quantity - 1;
                                            }
                                        });

                                        plusButton.addEventListener("click", () => {
                                            let quantity = parseInt(quantityInput.value);
                                            quantityInput.value = quantity + 1;
                                        });

                                        function addToCartWithQuantity(id) {
                                            let quantity = quantityInput.value;
                                            Swal.fire({
                                                title: '',
                                                text: "Add successfully",
                                                icon: 'success',
                                            });
                                            $.ajax({
                                                url: "/customer/addToCartCustomer",
                                                type: "get",
                                                data: {
                                                    perfumeId: id,
                                                    quantity: quantity
                                                },
                                                success: function (data) {
                                                    // Success handling
                                                },
                                                error: function (xhr) {
                                                    console.log("Error", xhr);
                                                }
                                            });
                                        }
    </script>
</html>
