import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String url = "jdbc:mysql://localhost:3306/athidhar_project";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");

            String username = request.getParameter("a1");
            String password = request.getParameter("a2");

            HttpSession session = request.getSession(true);

            int flag = 0;
            String role = "";

            // ADMIN LOGIN
            if ("Admin".equals(username) && "Admin".equals(password)) {
                flag = 1;
                role = "Admin";
            } else {

                PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM employee WHERE ename=?");

                ps.setString(1, username);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    String dbPass = rs.getString("pass");

                    if (password.equals(dbPass)) {
                        flag = 1;
                        role = "Employee";
                        session.setAttribute("un1", username);
                    }
                }
            }

            if (flag == 1 && role.equals("Admin")) {
                session.setAttribute("user", username);
                response.sendRedirect("admin.jsp");

            } else if (flag == 1) {
                response.sendRedirect("user.jsp");

            } else {
                response.sendRedirect("login.jsp?msg=Invalid Login");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?msg=Error");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }
}