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
    <link rel="stylesheet" href="css/Cheader.css" scoped>
    <title>Menu</title>
</head>

<body>
    <div id="wrapper">
        <header style="height: 140px;">
            <div class="inner-header container">
                <img src="../img/logo1.jpg" style="width: 120px; border-radius: 50%;" alt="" />
                <a href="#" id="logo">
                    <div class="Campus">Perfume Store</div>
                </a>
                <div class="menu-toggle bx bx-menu"></div> <!-- Mobile menu toggle button -->
                <nav>
                    <ul id="main-menu">
                        <li><a href="/customer/homeCustomer" style="color: black; font-size: 25px; font-family: 'Bahnschrift', sans-serif;">Home</a></li>
                        <li><a href="/customer/menuCustomer" style="color: black; font-size: 25px; font-family: 'Bahnschrift', sans-serif;">Product</a></li>
                        <li><a href="/customer/cartCustomer" style="color: black; font-size: 25px; font-family: 'Bahnschrift', sans-serif;">Cart</a></li>
                        <li><a href="/customer/aboutUsCustomer" style="color: black; font-size: 25px; font-family: 'Bahnschrift', sans-serif;">About Us</a></li>
                        <li><a style="color: black; font-size: 25px; font-family: 'Bahnschrift', sans-serif;">Hi</a>
                            <ul class="sub-menu" style="background: black;">
                                <li style="margin-top: 10px;"><a href="/customer/profileCustomer" style="color: white;">My Profile</a></li>
                                <li style="margin-top: 10px;"><a href="/customer/historyCustomer" style="color: white;">Order History</a></li>
                                <li style="margin-top: 10px;"><a href="/customer/logoutCustomer" style="color: white;">Logout <ion-icon style="display: inline-block; vertical-align: middle; margin-left: 2px; font-size: 24px;" name="log-out-outline"></ion-icon></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('sticky');
                } else {
                    $('header').removeClass('sticky');
                }
            });

            $('.menu-toggle').on('click', function () {
                $(this).toggleClass('active');
                $('#main-menu').toggle();
            });
        });
    </script>
</body>
</html>
