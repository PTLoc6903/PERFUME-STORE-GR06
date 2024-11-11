<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel="stylesheet">
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
                <img src="../img/logo1.jpg" style="width: 120px; border-radius: 50%;" alt="logo Perfume Store">
                <a href="#" id="logo" style="text-decoration: none;">
                    <div class="Campus" >Perfume Store</div>
                </a>
                <div class="menu-toggle bx bx-menu"></div> <!-- Mobile menu toggle button -->
                <nav>
                    <ul id="main-menu">
                        <li><a href="/guest/homeGuest" style="text-decoration: none;color: black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;">Home</a></li>
                        <li><a href="/guest/menuGuest" style="text-decoration: none;color: black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;">Product</a></li>
                        <li><a href="/guest/aboutUsGuest" style="text-decoration: none;color: black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;">About Us</a></li>
                        <li><a href="/guest/loginGuest" style="text-decoration: none;color: black;font-size: 25px;font-family: 'Bahnschrift', sans-serif;">Login</a>
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

<style>
    /* Reset styles */
    body, h1, h2, h3, p, ul, li, table {
        margin: 0;
        padding: 0;
    }

    ul {
        list-style: none;
    }

    /* Header Styling */
    header {
        background: #FFB6C1;
        z-index: 999;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        padding: 20px 0;
        transition: all 0.5s ease-in-out;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    header.sticky {
        opacity: 0.9;
        padding: 15px 0;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.5);
    }

    .inner-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }

    #logo {
        font-family: 'Poppins', sans-serif;
        font-weight: bold;
        font-size: 2rem;
        color: #000;
    }

    .Campus {
        font-family: 'Poppins', sans-serif;
        font-weight: bold;
        font-size: 3rem;
        color: #C21010;
        margin-left: 10px;
    }

    #main-menu {
        display: flex;
        gap: 30px;
        align-items: center;
        margin-left: auto;
    }

    #main-menu a {
        text-transform: uppercase;
        padding: 10px 20px;
        color: #333;
        font-weight: bold;
    }

    #main-menu li {
        position: relative;
    }

    #main-menu ul.sub-menu {
        position: absolute;
        padding: 15px 0;
        list-style: none;
        width: 200px;
        display: none;
    }

    #main-menu li:hover ul.sub-menu {
        display: block;
    }

    header.sticky #main-menu a {
        color: #ffffff;
    }

    header.sticky .sub-menu {
        background-color: #000000;
    }

    #main-menu ul.sub-menu a {
        padding: 8px 15px;
        border-bottom: 1px solid #7a7979;
    }

    #main-menu ul.sub-menu li:hover a {
        border-bottom: 1px solid #C21010;
    }

    #main-menu > li > a {
        position: relative;
    }

    #main-menu > li > a::before {
        content: "";
        height: 3px;
        width: 0px;
        background: #C21010;
        position: absolute;
        bottom: 0px;
        left: 0px;
        opacity: 0;
        transition: width 0.25s, opacity 0.25s;
    }

    #main-menu > li:hover > a::before {
        width: 100%;
        opacity: 1;
    }

    .menu-toggle {
        display: none;
        font-size: 1.5rem;
        color: #333;
        cursor: pointer;
    }

    /* Responsive Design */
    @media (max-width: 992px) {
        #main-menu {
            gap: 15px;
        }

        #main-menu a {
            font-size: 20px;
            padding: 8px 15px;
        }

        .Campus {
            font-size: 2.5rem;
        }
    }

    @media (max-width: 768px) {
        header {
            padding: 15px;
        }

        #logo {
            font-size: 1.5rem;
        }

        .Campus {
            font-size: 2rem;
        }

        #main-menu {
            display: none;
            flex-direction: column;
            gap: 10px;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #FFB6C1;
            padding: 20px;
            border-radius: 5px;
        }

        .menu-toggle {
            display: block;
        }

        .menu-toggle.active + #main-menu {
            display: flex;
        }
    }

    @media (max-width: 576px) {
        .Campus {
            font-size: 1.5rem;
        }

        #main-menu a {
            font-size: 16px;
        }
    }
</style>
