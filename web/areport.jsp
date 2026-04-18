<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Report</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url("images/back.jpg") no-repeat center center/cover;
            height: 100vh;
        }

        /* NAVBAR */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(8px);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #00d4ff;
        }

        /* CENTER CARD */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            padding: 30px;
            border-radius: 15px;
            width: 400px;
            color: white;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(20px);}
            to {opacity:1; transform: translateY(0);}
        }

        .card h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: none;
            outline: none;
        }

        /* BUTTONS */
        .buttons {
            display: flex;
            justify-content: space-between;
        }

        .buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.3s;
        }

        .view-btn {
            background: #00d4ff;
            color: black;
        }

        .view-btn:hover {
            background: #00aacc;
            transform: scale(1.05);
        }

        .cancel-btn {
            background: #ff4d4d;
            color: white;
        }

        .cancel-btn:hover {
            background: #cc0000;
            transform: scale(1.05);
        }

    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <a href="admin.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<!-- FORM -->
<div class="container">
    <form action="aview" method="post">
        <div class="card">
            <h2><i class="fas fa-chart-line"></i> Task Report</h2>

            <div class="input-group">
                <label>From Date *</label>
                <!-- MODERN DATE PICKER -->
                <input type="date" name="txtFromDate" required>
            </div>

            <div class="input-group">
                <label>To Date *</label>
                <!-- MODERN DATE PICKER -->
                <input type="date" name="txtToDate" required>
            </div>

            <div class="buttons">
                <button type="submit" class="view-btn">View</button>
                <button type="reset" class="cancel-btn">Cancel</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>