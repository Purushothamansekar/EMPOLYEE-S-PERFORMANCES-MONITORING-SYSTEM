```jsp
<%@page import="java.sql.*"%>
<%@page import="dataset.BlowFishDecryption"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Status</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #0f0f1a;
            color: white;
        }

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
            text-decoration: none;
            font-weight: bold;
            color: white;
        }

        .left { color: #8b5cf6; }
        .right { color: #ff4d4d; }

        .container {
            margin-top: 120px;
            padding: 20px;
        }

        .card {
            background: #1a1a2e;
            padding: 20px;
            border-radius: 12px;
        }

        h2 {
            text-align: center;
            color: #a78bfa;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background: #8b5cf6;
        }

        td {
            background: #2a2a40;
        }

        tr:hover td {
            background: #3a3a60;
        }

        .no-data {
            color: #ff8080;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>

<body>

<div class="navbar" id="navbar">
    <div class="nav-container">
        <a href="admin.jsp" class="left">HOME</a>
        <a href="login.jsp" class="right">LOGOUT</a>
    </div>
</div>

<div class="container">
<div class="card">
<h2>Task Status</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Project</th>
    <th>Category</th>
    <th>Work(HR)</th>
    <th>Task</th>
    <th>Status</th>
    <th>Date</th>
    <th>Worked(HR)</th>
</tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    BlowFishDecryption d = new BlowFishDecryption();

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/athidhar_project","root","root");

    st = con.createStatement();
    rs = st.executeQuery("select * from taskdetail");

    boolean hasData = false;

    while(rs.next()) {
        hasData = true;
%>
<tr>
    <td><%=rs.getString(1)%></td>
    <td><%=d.toDecrypt(rs.getString(3))%></td>
    <td><%=d.toDecrypt(rs.getString(5))%></td>
    <td><%=d.toDecrypt(rs.getString(6))%></td>
    <td><%=d.toDecrypt(rs.getString(7))%></td>
    <td><%=d.toDecrypt(rs.getString(8))%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=d.toDecrypt(rs.getString(10))%></td>
</tr>
<%
    }

    if(!hasData) {
%>
<tr>
    <td colspan="8" class="no-data">No Task Status Found</td>
</tr>
<%
    }

} catch(Exception e) {
%>
<tr>
    <td colspan="8" class="no-data">
        Error: <%=e.getMessage()%>
    </td>
</tr>
<%
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(st != null) st.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
}
%>

</table>

</div>
</div>

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
