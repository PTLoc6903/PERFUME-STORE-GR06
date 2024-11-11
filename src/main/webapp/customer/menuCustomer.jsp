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
        <link href="css/Cmenu.css" rel="stylesheet" type="text/css"/>
        <title>Perfume Store - Menu</title>
        <style>
            body {
                background-image: url('/img/bgblue (1).jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
                margin-bottom: 20px;
            }
            .best-seller {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 10px;
                height: 100%;
            }
            .best-seller img {
                max-width: 100%;
                max-height: 200px;
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
        <%@include file="headerCustomer.jsp"%>
        <div class="banner">
            <div class="banner-slide">
                <img src="../img/BannerBS.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/banner2.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/sale.png" alt=""/>
            </div>
        </div>
        <div class="container" style="margin-top:-70px">
            <!-- Main Content -->
            <main>
                <!-- Best Seller -->
                <div class="tittle">
                    <!--                    <img src="../img/Menu.png" alt=""/>-->
                </div>
                <div class="search-main" >
                    <div class="search-container" >
                        <input oninput="searchByName(this)" type="text" class="search-box" id="searchInput" placeholder="      Search Name..." style="border-radius: 20px;">
                    </div>
                    <div>
                        <div class="filter">
                            <label style="font-weight: 500; font-size: 20px; color: #C21010;">Category filter: </label>
                            <select class="select-box" oninput="searchByCategory(this)" id="select">
                                <option value="" selected>All</option>
                                <c:forEach var="c" items="${requestScope.categories}">
                                    <option value="${c.getId()}">${c.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="list-menu row mb-5" id="content" style="margin:24px 0px 0px; padding: 0 0 12px;">
                    <c:forEach var="perfume" items="${requestScope.perfumes}">
                        <div class="col-md-3 mb-5">
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
                                    <p style="color:black;font-weight: 600;">Units Sold: (15+)</p>
                                </div>
                                <div class="perfume-btn">
                                    <c:choose>
                                        <c:when test="${perfume.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="addToCart('${perfume.getId()}')" style="border-radius: 20px;">
                                                <ion-icon style="font-size: 22px;" name="cart"></ion-icon>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                    <button onclick="viewPerfume('${perfume.getId()}')" style="border-radius: 20px;">View</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End List Perfume -->
            </main>
        </div>
        <%@include file="footerCustomer.jsp"%>
        <!-- End of Main Content -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                            window.location = "/customer/perfumeDetailCustomer?id=" + id;
                                        }
                                        function addToCart(id) {
                                            Swal.fire({
                                                title: '',
                                                text: "Add successfully",
                                                icon: 'success',
                                            });
                                            $.ajax({
                                                url: "/customer/addToCartCustomer",
                                                type: "get",
                                                data: {
                                                    perfumeId: id
                                                },
                                                success: function (data) {
                                                },
                                                error: function (xhr) {
                                                    console.log(error);
                                                }
                                            });
                                        }
                                        function searchByName(param) {
                                            var txtSearch = param.value;
                                            document.getElementById('select').value = "";
                                            $.ajax({
                                                url: "/searchName",
                                                type: "get",
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    console.log(error);
                                                }
                                            });
                                        }
                                        function searchByCategory(param) {
                                            var txtSearch = param.value;
                                            document.getElementById('searchInput').value = "";
                                            $.ajax({
                                                url: "/searchCategory",
                                                type: "get",
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    console.log(error);
                                                }
                                            });
                                        }
        </script>
    </body>
</html>