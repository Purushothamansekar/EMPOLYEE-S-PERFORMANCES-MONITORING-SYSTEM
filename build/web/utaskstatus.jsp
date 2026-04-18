<%@page import="dataset.BlowFishDecryption"%>
<%@page import="dataset.BlowFishEncryption"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Status - TaskFlow</title>

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
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }

        .card h2 {
            text-align: center;
            color: #a78bfa;
            margin-top: 0;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th {
            background-color: #2a2a40;
            color: white;
            padding: 12px;
            font-size: 14px;
        }

        table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #333;
            color: #ddd;
        }

        table tr:hover {
            background-color: #252540;
        }

        .message {
            color: #ff6b6b;
            text-align: center;
            font-weight: bold;
            padding: 20px;
        }
    </style>
</head>

<body>

<form action="" method="post">

<div class="navbar">
    <div class="navbar-left">
        <a href="user.jsp">HOME</a>
        <a href="utask.jsp">TASK UPDATE</a>
        <a href="utaskstatus.jsp" class="active">TASK STATUS</a>
        <a href="ureport.jsp">TASK REPORT</a>
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
        <h2>View Task Update Status</h2>

        <table>
            <tr>
                <th>TDID</th>
                <th>Project Name</th>
                <th>Category</th>
                <th>Work(HR)</th>
                <th>Task</th>
                <th>Status</th>
                <th>Date</th>
                <th>Worked(HR)</th>
            </tr>

            <%
            try{
                BlowFishEncryption asc = new BlowFishEncryption();
                BlowFishDecryption dsc = new BlowFishDecryption();

                HttpSession so = request.getSession(true);

                String username = "";

                if(so.getAttribute("un1") != null){
                    username = so.getAttribute("un1").toString();
                }

                if(!username.equals("")){

                    String url = "jdbc:mysql://localhost:3306/athidhar_project";
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection(url, "root", "root");
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery(
                        "select * from taskdetail where ename='" + 
                        asc.toEncrypt(username.getBytes()) + "'"
                    );

                    boolean dataFound = false;

                    while(rs.next()){
                        dataFound = true;
            %>

            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=dsc.toDecrypt(rs.getString(3))%></td>
                <td><%=dsc.toDecrypt(rs.getString(5))%></td>
                <td><%=dsc.toDecrypt(rs.getString(6))%></td>
                <td><%=dsc.toDecrypt(rs.getString(7))%></td>
                <td><%=dsc.toDecrypt(rs.getString(8))%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=dsc.toDecrypt(rs.getString(10))%></td>
            </tr>

            <%
                    }

                    if(!dataFound){
            %>

            <tr>
                <td colspan="8" class="message">No task status found</td>
            </tr>

            <%
                    }

                    rs.close();
                    st.close();
                    con.close();

                } else {
            %>

            <tr>
                <td colspan="8" class="message">Session Expired. Please login again.</td>
            </tr>

            <%
                }

            } catch(Exception e){
            %>

            <tr>
                <td colspan="8" class="message"><%=e%></td>
            </tr>

            <%
            }
            %>

        </table>
    </div>
</div>

</form>

</body>
</html>