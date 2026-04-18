<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Project Registration</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #0f0f1a;
            color: white;
        }

        /* NAVBAR */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(15,15,26,0.6);
            backdrop-filter: blur(8px);
            transition: top 0.4s;
            z-index: 1000;
        }

        .nav-container {
            max-width: 1100px;
            margin: auto;
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .left { color: #8b5cf6; }
        .right { color: #ff4d4d; }

        /* CONTAINER */
        .container {
            margin-top: 120px;
            display: flex;
            justify-content: center;
        }

        /* CARD */
        .card {
            background: #1a1a2e;
            padding: 30px;
            border-radius: 12px;
            width: 420px;
        }

        .card h2 {
            text-align: center;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: none;
            border-radius: 6px;
            background: #2a2a40;
            color: white;
        }

        input[type="submit"] {
            background: #8b5cf6;
            cursor: pointer;
        }

        input[type="reset"] {
            background: #ff4d4d;
            cursor: pointer;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar" id="navbar">
    <div class="nav-container">
        <a href="admin.jsp" class="left">HOME</a>
        <a href="login.jsp" class="right">LOGOUT</a>
    </div>
</div>

<!-- FORM -->
<div class="container">
<div class="card">
<h2>Project Registration</h2>

<form action="project" method="post">

<%
int pid = 1;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/athidhar_project","root","root");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select max(pid) from project");

    if(rs.next() && rs.getString(1)!=null){
        pid = Integer.parseInt(rs.getString(1)) + 1;
    }

} catch(Exception e){
    pid = 1; // error hide
}
%>

<input type="text" name="a1" value="<%=pid%>" readonly>
<input type="text" name="a2" placeholder="Project Name" required>
<input type="text" name="a3" placeholder="Client Name" required>
<input type="text" name="a5" placeholder="Contact Number" required>

<textarea name="a6" placeholder="Address"></textarea>

<input type="email" name="a7" placeholder="Email">

<label>Date of Registration</label>
<input type="date" name="a8">

<label>Date of Delivery</label>
<input type="date" name="a9">

<textarea name="a10" placeholder="Technology Used"></textarea>
<textarea name="a4" placeholder="Project Scenario"></textarea>

<input type="submit" value="Submit">
<input type="reset" value="Cancel">

</form>

</div>
</div>

<!-- AUTO HIDE NAVBAR -->
<script>
let prev = window.pageYOffset;
window.onscroll = function() {
    let curr = window.pageYOffset;
    document.getElementById("navbar").style.top = (prev > curr) ? "0" : "-80px";
    prev = curr;
}
</script>

</body>
</html>