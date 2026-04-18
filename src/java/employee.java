import dataset.BlowFishEncryption;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class employee extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            String url = "jdbc:mysql://localhost:3306/athidhar_project";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");

            BlowFishEncryption asc = new BlowFishEncryption();

            // 🔥 GET VALUES
            String a1 = request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String password = request.getParameter("password");
            String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
            String a5 = request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            String a8 = request.getParameter("a8");
            String a9 = request.getParameter("a9");
            String a10 = request.getParameter("a10");

            // ✅ NULL FIX (VERY IMPORTANT)
            if(a3 == null) a3 = "";
            if(a4 == null) a4 = "";
            if(a5 == null) a5 = "";
            if(a6 == null) a6 = "";
            if(a7 == null) a7 = "";
            if(a8 == null) a8 = "";
            if(a9 == null) a9 = "";
            if(a10 == null) a10 = "";

            String role = "Employee";

            if (request.getParameter("add") != null) {

                // ✅ VALIDATION
                if (a1 == null || a2 == null || password == null ||
                        a1.trim().equals("") || a2.trim().equals("") || password.trim().equals("")) {

                    response.sendRedirect("aemployee.jsp?msg=Fill all required fields");
                    return;
                }

                // 🔍 CHECK EXIST
                PreparedStatement check = con.prepareStatement(
                        "SELECT * FROM employee WHERE eid=?");
                check.setString(1, a1);

                ResultSet rs = check.executeQuery();

                if (rs.next()) {
                    response.sendRedirect("aemployee.jsp?msg=Employee Already Exists");
                } else {

                    // 🔥 INSERT
                    PreparedStatement ps = con.prepareStatement(
                            "INSERT INTO employee VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");

                    ps.setString(1, a1);
                    ps.setString(2, asc.toEncrypt(a2.getBytes()));
                    ps.setString(3, asc.toEncrypt(password.getBytes()));
                    ps.setString(4, asc.toEncrypt(a3.getBytes()));
                    ps.setString(5, asc.toEncrypt(a4.getBytes()));
                    ps.setString(6, asc.toEncrypt(a5.getBytes()));
                    ps.setString(7, asc.toEncrypt(a6.getBytes()));
                    ps.setString(8, asc.toEncrypt(a7.getBytes()));
                    ps.setString(9, asc.toEncrypt(a8.getBytes()));
                    ps.setString(10, asc.toEncrypt(a9.getBytes()));
                    ps.setString(11, asc.toEncrypt(a10.getBytes()));
                    ps.setString(12, role);

                    int v = ps.executeUpdate();

                    if (v == 1) {
                        response.sendRedirect("aemployee.jsp?msg=Registered Successfully");
                    } else {
                        response.sendRedirect("aemployee.jsp?msg=Registration Failed");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("aemployee.jsp?msg=Server Error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}