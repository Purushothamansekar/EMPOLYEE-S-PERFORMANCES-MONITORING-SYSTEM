<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Registration</title>

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
}

.nav-container {
    display: flex;
    justify-content: space-between;
    padding: 20px;
}

.container {
    margin-top: 120px;
    display: flex;
    justify-content: center;
}

.card {
    background: #1a1a2e;
    padding: 30px;
    border-radius: 12px;
    width: 400px;
}

input, select, textarea {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border-radius: 6px;
    border: none;
    background: #2a2a40;
    color: white;
}

input[type="submit"] {
    background: #8b5cf6;
}

input[type="reset"] {
    background: #ff4d4d;
}
</style>
</head>

<body>

<div class="navbar">
    <div class="nav-container">
        <a href="admin.jsp">HOME</a>
        <a href="login.jsp">LOGOUT</a>
    </div>
</div>

<div class="container">
<div class="card">

<h2>Employee Registration</h2>

<%
String msg = request.getParameter("msg");
if(msg!=null){
%>
<p style="color:red;text-align:center;"><%=msg%></p>
<%
}
%>

<form action="employee" method="post">

<%
int eid = 1;
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/athidhar_project","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select max(eid) from employee");
    if(rs.next() && rs.getString(1)!=null){
        eid = Integer.parseInt(rs.getString(1)) + 1;
    }
}catch(Exception e){}
%>

<input type="text" name="a1" value="<%=eid%>" readonly>

<input type="text" name="a2" placeholder="Username" required>

<input type="password" name="password" placeholder="Password" required>

<select name="a3">
<option>Designation</option>
<option>Development</option>
<option>Testing</option>
<option>Maintenance</option>
<option>Deployment</option>
</select>

<input type="text" name="a4" placeholder="Experience" required>
<input type="text" name="a5" placeholder="Contact Number" required>

<textarea name="a6" placeholder="Address"></textarea>

<input type="email" name="a7" placeholder="Email">

<input type="date" name="a8">
<input type="date" name="a9">

<textarea name="a10" placeholder="Area of Interest"></textarea>

<input type="submit" name="add" value="Register">
<input type="reset" value="Cancel">

</form>

</div>
</div>

</body>
</html>
