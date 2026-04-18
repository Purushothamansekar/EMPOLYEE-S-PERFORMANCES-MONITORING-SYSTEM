<%@page import="dataset.BlowFishDecryption"%>
<%@page import="dataset.BlowFishEncryption"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String flag=(String)request.getAttribute("ss");
String msg="";
if(flag!=null){
    msg=(String)request.getAttribute("msg");
}

String flag1=(String)request.getAttribute("ss1");
String a1="";
String a2="";
String a3="";
String a4="";
String a5="";
String a6="";

if(flag1!=null){
    a1=(String)request.getAttribute("a11");
    a2=(String)request.getAttribute("a12");
    a3=(String)request.getAttribute("a13");
    a4=(String)request.getAttribute("a14");
    a6=(String)request.getAttribute("a15");
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Task Update - TaskFlow</title>

    <script type="text/javascript" src="js/datetimepicker_css.js"></script>
    <script type="text/javascript" src="js/general.js"></script>
    <script language="JavaScript" src="js/security.js"></script>

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
            margin-bottom: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }

        .card h2 {
            margin-top: 0;
            text-align: center;
            color: #a78bfa;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th {
            background-color: #2a2a40;
            color: white;
            padding: 12px;
        }

        table td {
            padding: 10px;
            border-bottom: 1px solid #333;
            text-align: center;
            color: #ddd;
        }

        table tr:hover {
            background-color: #252540;
        }

        .form-table td {
            border: none;
            text-align: left;
            padding: 12px;
        }

        input[type="text"],
        select {
            width: 220px;
            padding: 10px;
            border-radius: 8px;
            border: none;
            background-color: #2a2a40;
            color: white;
        }

        .btn {
            background: linear-gradient(to right, #8e2de2, #4a00e0);
            color: white;
            border: none;
            padding: 10px 22px;
            border-radius: 8px;
            cursor: pointer;
            margin-right: 10px;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .msg {
            color: #00ff99;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form action="utasks" method="post">

<div class="navbar">
    <div class="navbar-left">
        <a href="user.jsp">HOME</a>
        <a href="utask.jsp" class="active">TASK UPDATE</a>
        <a href="utaskstatus.jsp">TASK STATUS</a>
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
        <h2>Task List</h2>

        <table>
            <tr>
                <th>Select</th>
                <th>Task Id</th>
                <th>Project Name</th>
                <th>Category</th>
                <th>Work</th>
                <th>Task</th>
                <th>Assigned Date</th>
                <th>Complete Date</th>
            </tr>

            <%
            try{
                BlowFishDecryption dsc = new BlowFishDecryption();

                String url = "jdbc:mysql://localhost:3306/athidhar_project";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "root");
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from task where status=''");

                while(rs.next()){
            %>

            <tr>
                <td><input type="radio" name="radiobutton" value="<%=rs.getString(1)%>"></td>
                <td><%=rs.getString(1)%></td>
                <td><%=dsc.toDecrypt(rs.getString(2))%></td>
                <td><%=dsc.toDecrypt(rs.getString(4))%></td>
                <td><%=dsc.toDecrypt(rs.getString(5))%></td>
                <td><%=dsc.toDecrypt(rs.getString(6))%></td>
                <td><%=dsc.toDecrypt(rs.getString(7))%></td>
                <td><%=dsc.toDecrypt(rs.getString(8))%></td>
            </tr>

            <%
                }

                rs.close();
                st.close();
                con.close();

            } catch(Exception e){
                out.println("<tr><td colspan='8'>" + e + "</td></tr>");
            }
            %>
        </table>

        <br>
        <center>
            <input type="submit" name="b" value="View" class="btn">
        </center>
    </div>

    <div class="card">
        <h2>Update Task</h2>

        <table class="form-table">
            <tr>
                <td>Task Id</td>
                <td><input type="text" name="a1" value="<%=a1%>" readonly></td>
            </tr>

            <tr>
                <td>Project Name</td>
                <td><input type="text" name="a2" value="<%=a2%>" readonly></td>
            </tr>

            <tr>
                <td>Category</td>
                <td><input type="text" name="a3" value="<%=a3%>" readonly></td>
            </tr>

            <tr>
                <td>Work</td>
                <td><input type="text" name="a4" value="<%=a4%>" readonly></td>
            </tr>

            <tr>
                <td>Task</td>
                <td><input type="text" name="a6" value="<%=a6%>"></td>
            </tr>

            <tr>
                <td>Appointment Date</td>
                <td>
                    <input type="text" id="a5" name="a5" readonly>
                    <a href="javascript:NewCssCal('a5','ddmmyyyy')">
                        <img src="images/cal.jpg" width="25" height="21">
                    </a>
                </td>
            </tr>

            <tr>
                <td>Project Status</td>
                <td>
                    <select name="a7">
                        <option value="">Select Status</option>
                        <option value="Completed">Completed</option>
                        <option value="In-progress">In-progress</option>
                        <option value="Hold">Hold</option>
                        <option value="Not Yet Started">Not Yet Started</option>
                        <option value="Started">Started</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>Worked Hours</td>
                <td><input type="text" name="a8"></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <input type="submit" name="b" value="Save" class="btn">
                    <input type="reset" value="Cancel" class="btn">
                </td>
            </tr>
        </table>

        <div class="msg"><%=msg%></div>
    </div>

</div>

</form>

</body>
</html>