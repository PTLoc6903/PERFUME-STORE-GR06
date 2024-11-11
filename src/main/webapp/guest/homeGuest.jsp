
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/Ghome.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store - Home</title>

        <style>
            body {
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
                height: 100%;
            }
            .best-seller img {
                max-width: 100%;
                max-height: 280px;
                object-fit: cover;
            }
            .name-perfume {
                height: 50px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .perfume-info {
                margin-top: 10px;
            }
            .price-section {
                display: flex;
                justify-content: space-between;
            }
            .perfume-btn {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
            .perfume-btn button {
                flex: 1;
                margin: 0 5px;
            }
        </style>

    </head>
    <body>
        <%@include file="headerGuest.jsp"%>
        <div class="banner" style="margin-top:140px; height: 80%">
            <div class="banner-slide" style="height: 100%">
                <img src="../img/anh1.jpeg" alt=""/>
            </div>
            <div class="banner-slide" style="height: 100%">
                <img src="../img/anh4.jpeg" alt=""/>
            </div>
            <div class="banner-slide" style="height: 100%">
                <img src="../img/anh5.jpeg" alt=""/>
            </div>
        </div>
        <!-- Best Seller -->

        <div class="container" style=" margin-top:-180px;">
            <main>
                <div class="list-menu row mb-5">
                    <c:forEach items="${requestScope.topFourSeller}" var="perfume">
                        <div class="col-md-3">
                            <div class="best-seller" style="height: 95%;">
                                <div class="best-seller-image abc">
                                    <img src="${perfume.getImg()}" alt="">
                                </div>
                                <div class="best-seller-image">
                                    <img src="../img/BestSeller_OnFood.png" alt=""/>
                                </div>
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
                                <hr>
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
                                    <p style="color:black; font-weight: 600;">Units Sold: (15+)</p>
                                </div>
                                <div class="perfume-btn">
                                    <button onclick="viewPerfume('${perfume.getId()}')" style="border-radius: 20px;">View</button>
                                    <c:choose>
                                        <c:when test="${perfume.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="addToCart('${perfume.getId()}')" style="border-radius: 20px;"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                                </c:otherwise>
                                            </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="list-menu row mb-5" id="perfumeList">
                    <c:forEach items="${requestScope.topFourLatest}" var="perfume">
                        <div class="col-md-3" style="height: 95%;">
                            <div class="best-seller">
                                <div class="new-perfume-img">
                                    <img src="${perfume.getImg()}" alt="">
                                </div>
                                <div class="new-perfume">
                                    <c:choose>
                                        <c:when test="${fn:length(perfume.getName()) > 15}">
                                            ${fn:substring(perfume.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${perfume.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>
                                <hr>
                                <div class="perfume-info" >
                                    <div class="price-section" style="color:black;">
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
                                    <p style="color:black; font-weight: 600;">Units Sold: (15+)</p>
                                </div>
                                <div class="perfume-btn">
                                    <button onclick="viewPerfume('${perfume.getId()}')" style="border-radius: 20px;">View</button>
                                    <c:choose>
                                        <c:when test="${perfume.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="addToCart('${perfume.getId()}')" style="border-radius: 20px;"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                                </c:otherwise>
                                            </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End List Perfume -->
            </main>
        </div>
        <%@include file="footerGuest.jsp"%>
        <!-- End of Main Content -->
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
                                                $(document).ready(function () {
                                                    var currentIndex = 0;
                                                    var slides = $(".banner-slide");
                                                    function showSlide(index) {
                                                        slides.hide();
                                                        slides.eq(index).fadeIn();
                                                    }
                                                    function nextSlide() {
                                                        currentIndex = (currentIndex + 1) % slides.length;
                                                        showSlide(currentIndex);
                                                    }
                                                    showSlide(currentIndex);
                                                    setInterval(nextSlide, 5000);
                                                });

                                                function viewPerfume(id) {
                                                    window.location = "/guest/perfumeDetailGuest?id=" + id;
                                                }

                                                function addToCart(id) {
                                                    Swal.fire({
                                                        title: '',
                                                        text: "You have to login to add to cart",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#3085d6',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Log in now'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            window.location = "/guest/loginGuest";
                                                        }
                                                    })
                                                }
    </script>
</html>
