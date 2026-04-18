<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact - TaskFlow</title>

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

        /* CONTACT INFO */
        .contact {
            padding: 60px 20px;
            display: flex;
            justify-content: center;
        }

        .info-box {
            background-color: #1a1a2e;
            padding: 30px;
            border-radius: 12px;
            width: 400px;
            text-align: center;
        }

        .info-box h2 {
            margin-bottom: 20px;
        }

        .info-box p {
            margin: 10px 0;
            color: #9ca3af;
            font-size: 16px;
        }

        .info-box i {
            color: #8b5cf6;
            margin-right: 10px;
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
    <a href="service.jsp">SERVICE</a>
    <a href="contactus.jsp" class="active">CONTACT</a>
    <a href="login.jsp">LOGIN</a>
</div>

<!-- CONTACT INFO -->
<div class="contact">
    <div class="info-box">
        <h2>Contact Information</h2>

        <p><i class="fas fa-briefcase"></i> Role: Manager</p>
        <p><i class="fas fa-user"></i> NISHANTH</p>
        <p><i class="fas fa-phone"></i> 8637655701</p>
        <p><i class="fas fa-envelope"></i> pnishanth5701@gmail.com</p>

    </div>
</div>

</body>
</html>