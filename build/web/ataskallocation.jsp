<%@page import="java.sql.*"%>
<%@page import="dataset.BlowFishDecryption"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String msg = "";

if(request.getAttribute("msg") != null){
    msg = request.getAttribute("msg").toString();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Task Allocation - TaskFlow</title>

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
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #ddd;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background-color: #2a2a40;
            color: white;
            font-size: 15px;
            outline: none;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
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

        .submit-btn {
            background-color: #8b5cf6;
            color: white;
        }

        .submit-btn:hover {
            background-color: #7c3aed;
        }

        .cancel-btn {
            background-color: #ff4d4d;
            color: white;
        }

        .cancel-btn:hover {
            background-color: #e63946;
        }

        .message {
            text-align: center;
            color: #4ade80;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<div class="navbar">
    <div class="navbar-left">
        <a href="admin.jsp">HOME</a>
        <a href="aemployee.jsp">EMPLOYEES</a>
        <a href="aproject.jsp">PROJECTS</a>
        <a href="ataskallocation.jsp" class="active">TASK ALLOCATION</a>
        <a href="ataskstatus.jsp">TASK STATUS</a>
        <a href="areport.jsp">REPORTS</a>
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
        <h2>Task Allocation</h2>

        <form action="task" method="post">

            <%
            int tid = 1;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/athidhar_project",
                    "root",
                    "root"
                );

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select max(tid) from task");

                if(rs.next() && rs.getString(1) != null){
                    tid = Integer.parseInt(rs.getString(1)) + 1;
                }

                rs.close();
                st.close();
                con.close();

            } catch(Exception e){
                tid = 1;
            }
            %>

            <div class="form-group">
                <label>Task ID</label>
                <input type="text" name="a1" value="<%=tid%>" readonly>
            </div>

            <div class="form-group">
                <label>Select Project</label>
                <select name="a2" required>
                    <option value="">Select Project</option>

                    <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/athidhar_project",
                            "root",
                            "root"
                        );

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select pname from project");

                        while(rs.next()){
                    %>

                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

                    <%
                        }

                        rs.close();
                        st.close();
                        con.close();

                    } catch(Exception e){}
                    %>

                </select>
            </div>

            <div class="form-group">
                <label>Select Employee</label>
                <select name="a3" required>
                    <option value="">Select Employee</option>

                    <%
                    try {
                        BlowFishDecryption d = new BlowFishDecryption();

                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/athidhar_project",
                            "root",
                            "root"
                        );

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select ename from employee");

                        while(rs.next()){
                            String name = "";

                            try{
                                name = d.toDecrypt(rs.getString(1));
                            } catch(Exception ex){
                                name = rs.getString(1);
                            }
                    %>

                    <option value="<%=name%>"><%=name%></option>

                    <%
                        }

                        rs.close();
                        st.close();
                        con.close();

                    } catch(Exception e){}
                    %>

                </select>
            </div>

            <div class="form-group">
                <label>Select Category</label>
                <select name="a4" required>
                    <option value="">Select Category</option>
                    <option value="Development">Development</option>
                    <option value="Testing">Testing</option>
                    <option value="Maintenance">Maintenance</option>
                    <option value="Deployment">Deployment</option>
                </select>
            </div>

            <div class="form-group">
                <label>Work Hours</label>
                <input type="text" name="a5" placeholder="Enter Work Hours" required>
            </div>

            <div class="form-group">
                <label>Task Scenario</label>
                <textarea name="a6" placeholder="Enter Task Details" required></textarea>
            </div>

            <div class="form-group">
                <label>Assigned Date</label>
                <input type="date" name="a7" required>
            </div>

            <div class="form-group">
                <label>Completion Date</label>
                <input type="date" name="a8" required>
            </div>

            <div class="button-group">
                <input type="submit" value="Submit" class="submit-btn">
                <input type="reset" value="Cancel" class="cancel-btn">
            </div>

            <div class="message">
                <%=msg%>
            </div>

        </form>
    </div>
</div>

</body>
</html>