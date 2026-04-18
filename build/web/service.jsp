<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Services - TaskFlow</title>

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

        /* SERVICES SECTION */
        .services {
            padding: 60px 20px;
            text-align: center;
        }

        .services h1 {
            font-size: 36px;
            margin-bottom: 40px;
        }

        .services span {
            color: #8b5cf6;
        }

        .service-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .card {
            background-color: #1a1a2e;
            padding: 25px;
            width: 260px;
            border-radius: 12px;
            margin: 15px;
            text-align: center;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card i {
            font-size: 35px;
            color: #8b5cf6;
            margin-bottom: 15px;
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            color: #9ca3af;
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
    <a href="aboutus.jsp">ABOUT</a>
    <a href="service.jsp" class="active">SERVICE</a>
    <a href="contactus.jsp">CONTACT</a>
    <a href="login.jsp">LOGIN</a>
</div>

<!-- SERVICES -->
<div class="services">
    <h1>Our <span>Services</span></h1>

    <div class="service-cards">
        <div class="card">
            <i class="fas fa-user-cog"></i>
            <h3>User Management</h3>
            <p>Create, update, and manage user accounts efficiently.</p>
        </div>

        <div class="card">
            <i class="fas fa-tasks"></i>
            <h3>Task Allocation</h3>
            <p>Assign tasks to team members with ease and accuracy.</p>
        </div>

        <div class="card">
            <i class="fas fa-chart-bar"></i>
            <h3>Performance Reports</h3>
            <p>Track and analyze task completion and productivity.</p>
        </div>

        <div class="card">
            <i class="fas fa-shield-alt"></i>
            <h3>Secure System</h3>
            <p>Ensure safe and secure data handling at all levels.</p>
        </div>
    </div>
</div>

</body>
</html>