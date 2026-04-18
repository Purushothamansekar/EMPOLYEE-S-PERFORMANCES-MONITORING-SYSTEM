<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Report - TaskFlow</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f0f1a;
            color: white;
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background: rgba(15, 15, 26, 0.8);
            backdrop-filter: blur(8px);
            z-index: 1000;
        }

        .navbar-left,
        .navbar-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #a78bfa;
        }

        .active {
            color: #8b5cf6 !important;
        }

        .logout {
            color: #ff4d4d !important;
        }

        .hero img {
            width: 100%;
            height: 240px;
            object-fit: cover;
        }

        .container {
            width: 95%;
            margin: 30px auto;
        }

        .card {
            background-color: #1a1a2e;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 0 20px rgba(0,0,0,0.4);
            max-width: 700px;
            margin: auto;
        }

        .card h2 {
            text-align: center;
            color: #a78bfa;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 30px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #ddd;
        }

        .input-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .input-box input[type="text"] {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background-color: #2a2a40;
            color: white;
            font-size: 15px;
            outline: none;
        }

        .input-box img {
            width: 28px;
            height: 28px;
            cursor: pointer;
            border-radius: 6px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button-group input {
            padding: 12px 30px;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .view-btn {
            background-color: #8b5cf6;
            color: white;
        }

        .view-btn:hover {
            background-color: #7c3aed;
        }

        .cancel-btn {
            background-color: #ff4d4d;
            color: white;
        }

        .cancel-btn:hover {
            background-color: #e63946;
        }

        .error {
            color: #ff6b6b;
            font-size: 13px;
            margin-top: 6px;
            display: block;
        }
    </style>
</head>

<body>

<form action="uview" method="post">

<div class="navbar">
    <div class="navbar-left">
        <a href="user.jsp">HOME</a>
        <a href="utask.jsp">TASK UPDATE</a>
        <a href="utaskstatus.jsp">TASK STATUS</a>
        <a href="ureport.jsp" class="active">TASK REPORT</a>
    </div>

    <div class="navbar-right">
        <a href="login.jsp" class="logout">LOGOUT</a>
    </div>
</div>

<div class="hero">
    <img src="images/android-app-beta-testing.jpg">
</div>

<div class="container">
    <div class="card">
        <h2>Work Schedule Report</h2>

        <div class="form-group">
            <label>From Date *</label>
            <div class="input-box">
                <input type="text" id="txtFromDate" name="txtFromDate"
                       placeholder="YYYY-MM-DD"
                       onChange="return val_zero('txtFromDate','err_txtFromDate');"
                       onBlur="return txt_empty('txtFromDate','err_txtFromDate','Should Not Be Blank');" />
                
                <a href="javascript:NewCssCal('txtFromDate','yyyy-mm-dd')">
                    <img src="images/cal.jpg" alt="calendar" />
                </a>
            </div>
            <span id="err_txtFromDate" class="error"></span>
        </div>

        <div class="form-group">
            <label>To Date *</label>
            <div class="input-box">
                <input type="text" id="txtToDate" name="txtToDate"
                       placeholder="YYYY-MM-DD"
                       onChange="return val_zero('txtToDate','err_txtToDate');"
                       onBlur="return txt_empty('txtToDate','err_txtToDate','Should Not Be Blank');" />
                
                <a href="javascript:NewCssCal('txtToDate','yyyy-mm-dd')">
                    <img src="images/cal.jpg" alt="calendar" />
                </a>
            </div>
            <span id="err_txtToDate" class="error"></span>
        </div>

        <div class="button-group">
            <input type="submit" name="Submit3" value="View" class="view-btn" />
            <input type="reset" name="Submit4" value="Cancel" class="cancel-btn" />
        </div>
    </div>
</div>

</form>

</body>
</html>