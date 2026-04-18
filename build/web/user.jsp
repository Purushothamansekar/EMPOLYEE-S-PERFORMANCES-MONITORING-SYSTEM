<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String uname = (String) session.getAttribute("user");

if(uname == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - TaskFlow</title>

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
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background: rgba(15, 15, 26, 0.6);
            backdrop-filter: blur(8px);
            transition: top 0.4s;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-right: 20px;
        }

        .navbar a:hover {
            color: #a78bfa;
        }

        .left-menu,
        .right-menu {
            display: flex;
            align-items: center;
        }

        .logo {
            color: #8b5cf6;
            font-size: 18px;
            font-weight: bold;
            margin-right: 30px;
        }

        .logout {
            color: #ff4d4d !important;
        }

        /* DASHBOARD */
        .dashboard {
            padding: 100px 20px 60px;
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
            width: 220px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            background-color: #2a2a40;
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            font-size: 13px;
            color: #bdbdbd;
        }

        .welcome {
            color: #8b5cf6;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar" id="navbar">

    <div class="left-menu">
        <div class="logo">TaskFlow</div>

        <a href="user.jsp">HOME</a>
        <a href="utask.jsp">TASK UPDATE</a>
        <a href="utaskstatus.jsp">TASK STATUS</a>
        <a href="ureport.jsp">REPORTS</a>
    </div>

    <div class="right-menu">
        <a href="login.jsp" class="logout">LOGOUT</a>
    </div>

</div>

<!-- HERO -->
<div class="hero">
    <img src="images/android-app-beta-testing.jpg">
</div>

<!-- DASHBOARD -->
<div class="dashboard">
    <h1>User Dashboard 👨‍💻</h1>
    <p class="welcome">Welcome, <%= uname %></p>
    <p>Manage your tasks, update work progress and view reports.</p>

    <div class="card-container">
        <div class="card" onclick="location.href='utask.jsp'">
            <h3>Task Update</h3>
            <p>Update and manage your assigned tasks.</p>
        </div>

        <div class="card" onclick="location.href='utaskstatus.jsp'">
            <h3>Task Status</h3>
            <p>Check task progress and completion status.</p>
        </div>

        <div class="card" onclick="location.href='ureport.jsp'">
            <h3>Reports</h3>
            <p>View your work reports and summaries.</p>
        </div>
    </div>
</div>

<!-- AUTO HIDE SCRIPT -->
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