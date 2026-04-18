<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - TaskFlow</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f0f1a;
            color: white;
        }

        /* HERO */
        .hero {
            position: relative;
        }

        .hero img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        /* NAVBAR */
        .navbar {
            position: fixed; /* important */
            top: 0;
            left: 0;
            width: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background: rgba(15, 15, 26, 0.6);
            backdrop-filter: blur(8px);
            transition: top 0.4s; /* smooth hide/show */
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            color: #a78bfa;
        }

        .left {
            margin-left: 10px;
            color: #8b5cf6;
        }

        .right {
            margin-right: 10px;
            color: #ff4d4d;
        }

        /* DASHBOARD */
        .dashboard {
            padding: 100px 20px 60px; /* space for fixed navbar */
            text-align: center;
        }

        .dashboard h1 {
            font-size: 32px;
        }

        .dashboard p {
            color: #9ca3af;
        }

        /* CARDS */
        .card-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .card {
            background-color: #1a1a2e;
            padding: 20px;
            border-radius: 12px;
            width: 200px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            background-color: #2a2a40;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar" id="navbar">
    <a href="admin.jsp" class="left">HOME</a>
    <a href="login.jsp" class="right">LOGOUT</a>
</div>

<!-- HERO -->
<div class="hero">
    <img src="images/android-app-beta-testing.jpg">
</div>

<!-- DASHBOARD -->
<div class="dashboard">
    <h1>Admin Dashboard 🔐</h1>
    <p>Welcome Admin! Manage your system here.</p>

    <div class="card-container">
        <div class="card" onclick="location.href='aemployee.jsp'"><h3>Employees</h3></div>
        <div class="card" onclick="location.href='aproject.jsp'"><h3>Projects</h3></div>
        <div class="card" onclick="location.href='ataskallocation.jsp'"><h3>Task Allocation</h3></div>
        <div class="card" onclick="location.href='ataskstatus.jsp'"><h3>Task Status</h3></div>
        <div class="card" onclick="location.href='areport.jsp'"><h3>Reports</h3></div>
    </div>
</div>

<!-- AUTO HIDE SCRIPT 🔥 -->
<script>
let prevScroll = window.pageYOffset;

window.onscroll = function() {
    let currentScroll = window.pageYOffset;

    if (prevScroll > currentScroll) {
        document.getElementById("navbar").style.top = "0";
    } else {
        document.getElementById("navbar").style.top = "-80px";
    }

    prevScroll = currentScroll;
}
</script>

</body>
</html>