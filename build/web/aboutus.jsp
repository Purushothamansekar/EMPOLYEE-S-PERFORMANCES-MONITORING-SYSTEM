<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About - TaskFlow</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f0f1a;
            color: white;
        }

        /* NAVBAR */
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #1a1a2e;
            padding: 15px;
        }

        .navbar a {
            color: white;
            margin: 0 20px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #a78bfa;
        }

        .active {
            color: #8b5cf6;
        }

        /* HERO IMAGE */
        .hero img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        /* ABOUT SECTION */
        .about {
            padding: 60px 20px;
            text-align: center;
        }

        .about h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .about span {
            color: #8b5cf6;
        }

        .about p {
            color: #9ca3af;
            max-width: 800px;
            margin: auto;
            line-height: 1.8;
        }
    </style>
</head>

<body>

<!-- HERO IMAGE -->
<div class="hero">
    <img src="images/android-app-beta-testing.jpg">
</div>

<!-- NAVBAR -->
<div class="navbar">
    <a href="index.jsp">HOME</a>
    <a href="aboutus.jsp" class="active">ABOUT</a>
    <a href="service.jsp">SERVICE</a>
    <a href="contactus.jsp">CONTACT</a>
    <a href="login.jsp">LOGIN</a>
</div>

<!-- ABOUT CONTENT -->
<div class="about">
    <h1>About <span>Our System</span></h1>
    <p>
        This Smart Task Allocation System is designed to simplify task management 
        and improve team productivity. It allows administrators to assign tasks, 
        monitor progress, and generate reports efficiently.
        <br><br>
        Our system ensures better workflow management, secure data handling, 
        and user-friendly interaction for all users.
    </p>
</div>

</body>
</html>