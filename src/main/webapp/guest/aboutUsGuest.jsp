<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Perfume Store - About Us</title>
    <style>
        /* Reset & Base Styles */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            overflow-x: hidden;
            background-color: #f4f4f9;
        }

        section {
            padding-top: 100px;
            min-height: 100vh;
        }

        .main-width {
            max-width: 1200px;
            width: 95%;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .content {
            padding-top: 14px;
            flex: 1;
        }

        .content .main-text {
            margin-top: 50px;
            color: #333;
        }

        .content .main-text h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #C21010;
        }

        .content .main-text h1 {
            font-size: 64px;
            line-height: 1.2;
            color: #333;
            font-family: 'Permanent Marker', cursive;
        }

        .content .main-text p {
            color: #555;
            line-height: 1.8;
            font-size: 16px;
            margin-bottom: 20px;
            max-width: 550px;
        }

        .content .main-text a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #C21010;
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .content .main-text a:hover {
            background-color: #e94b3c;
            transform: scale(1.05);
        }

        .image {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .image img {
            max-width: 100%;
            height: auto;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .image img:hover {
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .main-width {
                flex-direction: column;
            }

            .content .main-text h1 {
                font-size: 48px;
            }

            .content .main-text p {
                font-size: 14px;
            }

            .image {
                margin-top: 30px;
            }
        }
    </style>
</head>

<body>
    <%@include file="headerGuest.jsp"%>
    <section class="hero">
        <div class="main-width">
            <div class="content">
                <div class="main-text">
                    <h3>Perfume Information</h3>
                    <h1>Perfume Store</h1>
                    <p>Welcome to Perfume Store, where you can explore the world with perfumes of many diverse genres. We are passionate about helping you expand your knowledge, as well as practice analytical and logical thinking.</p>
                    <p>At Perfume Store, you can experience various types of perfumes, including famous literary works and genres related to local and global history.</p>
                    <p>Order online or through our mobile app, and we will deliver directly to your door!</p>
                    <a href="/guest/menuGuest">Shop Now</a>
                </div>
            </div>
            <div class="image">
                <img src="../img/about_us.jpg" alt="Perfume Store">
            </div>
        </div>
    </section>
    <%@include file="footerGuest.jsp"%>
</body>

</html>
