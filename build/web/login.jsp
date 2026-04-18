<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String u = request.getParameter("a1");
String p = request.getParameter("a2");

String error = "";

if(u != null && p != null){

    try{
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/athidhar_project",
            "root",
            "root"
        );

        Statement st = con.createStatement();

        // Admin Login
        if(u.equals("admin") && p.equals("admin")){
            session.setAttribute("user", u);
            response.sendRedirect("admin.jsp");
        }
        else{
            // User Login without encryption
            ResultSet rs = st.executeQuery(
                "SELECT * FROM employee WHERE ename='"+u+"' AND pass='"+p+"'"
            );

            if(rs.next()){
                session.setAttribute("user", u);
                response.sendRedirect("user.jsp");
            } 
            else{
                error = "Invalid Username or Password";
            }
        }

        con.close();

    } 
    catch(Exception e){
        error = e.toString();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login - TaskFlow</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
            padding: 40px;
            width: 380px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            text-align: center;
        }

        .login-box h2 {
            color: #fff;
            margin-bottom: 25px;
            font-size: 28px;
        }

        .login-box input {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: none;
            outline: none;
            border-radius: 10px;
            background: rgba(255,255,255,0.15);
            color: white;
            font-size: 15px;
        }

        .login-box input::placeholder {
            color: #ddd;
        }

        .btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(to right, #8e2de2, #4a00e0);
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
            opacity: 0.9;
        }

        .error {
            color: #ff6b6b;
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="login-container">
    <div class="login-box">
        <h2>Welcome Back</h2>

        <form method="post">
            <input type="text" name="a1" placeholder="Enter Username" required>
            <input type="password" name="a2" placeholder="Enter Password" required>

            <button type="submit" class="btn">Sign In</button>
        </form>

        <div class="error">
            <%= error %>
        </div>
    </div>
</div>

</body>
</html>