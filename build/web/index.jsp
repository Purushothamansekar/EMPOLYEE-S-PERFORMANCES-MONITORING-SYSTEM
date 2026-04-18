<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>TaskFlow</title>

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

        /* HERO TEXT */
        .hero-text {
            text-align: center;
            padding: 50px 20px;
        }

        .hero-text h1 {
            font-size: 40px;
        }

        .hero-text span {
            color: #8b5cf6;
        }

        .hero-text p {
            color: #9ca3af;
        }

        /* FEATURES */
        .features {
            display: flex;
            justify-content: space-around;
            padding: 40px;
            flex-wrap: wrap;
        }

        .card {
            background-color: #1a1a2e;
            padding: 20px;
            width: 250px;
            border-radius: 12px;
            text-align: center;
            margin: 10px;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card i {
            font-size: 30px;
            color: #8b5cf6;
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
    <a href="index.jsp" class="active">HOME</a>
    <a href="aboutus.jsp">ABOUT</a>
    <a href="service.jsp">SERVICE</a>
    <a href="contactus.jsp">CONTACT</a>
    <a href="login.jsp">LOGIN</a>
</div>

<!-- HERO TEXT -->
<div class="hero-text">
    <h1>Smart <span>Task Allocation</span> System</h1>
    <p>Manage tasks efficiently with a modern workflow</p>
</div>

<!-- FEATURES -->
<div class="features">
    <div class="card">
        <i class="fas fa-user"></i>
        <h3>User Management</h3>
        <p>Manage all users easily</p>
    </div>

    <div class="card">
        <i class="fas fa-tasks"></i>
        <h3>Task Assignment</h3>
        <p>Assign tasks quickly</p>
    </div>

    <div class="card">
        <i class="fas fa-chart-line"></i>
        <h3>Reports</h3>
        <p>Track performance</p>
    </div>
</div>

</body>
</html>