import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class utasks extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String Radio = request.getParameter("radiobutton");
        String b = request.getParameter("b");

        String a11 = null, a12 = null, a13 = null, a14 = null, a15 = null;

        try {

            String url = "jdbc:mysql://localhost:3306/athidhar_project";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            HttpSession so = request.getSession(true);

            // ================= SAVE =================
            if ("Save".equals(b)) {

                String a1 = request.getParameter("a1");
                String a2 = request.getParameter("a2");
                String a3 = request.getParameter("a3");
                String a4 = request.getParameter("a4");
                String a5 = request.getParameter("a5");
                String a6 = request.getParameter("a6");
                String a7 = request.getParameter("a7");
                String a8 = request.getParameter("a8");

                if (a1.equals("") || a2.equals("") || a3.equals("") ||
                    a4.equals("") || a5.equals("") || a6.equals("")) {

                    request.setAttribute("msg", "Please fill all fields");
                    request.getRequestDispatcher("utask.jsp").forward(request, response);
                    return;
                }

                // generate ID
                int v = 1000;
                ResultSet rs = st.executeQuery("select max(tdid) from taskdetail");
                if (rs.next() && rs.getString(1) != null) {
                    v = Integer.parseInt(rs.getString(1)) + 1;
                }

                String user = (String) so.getAttribute("un1");
                if (user == null) user = "Unknown";

                int i = st.executeUpdate(
                    "insert into taskdetail values('" + v + "','" +
                    a1 + "','" +
                    a2 + "','" +
                    user + "','" +
                    a3 + "','" +
                    a4 + "','" +
                    a6 + "','" +
                    a7 + "','" +
                    a5 + "','" +
                    a8 + "')"
                );

                if (i > 0) {
                    request.setAttribute("msg", "Task Added Successfully");
                } else {
                    request.setAttribute("msg", "Insert Failed");
                }

                request.getRequestDispatcher("utask.jsp").forward(request, response);
            }

            // ================= VIEW =================
            else if ("View".equals(b)) {

                ResultSet rs1 = st.executeQuery(
                        "select * from task where tid='" + Radio + "'");

                if (rs1.next()) {

                    a11 = rs1.getString(1);
                    a12 = rs1.getString(2);
                    a13 = rs1.getString(4);
                    a14 = rs1.getString(5);
                    a15 = rs1.getString(6);
                }

                request.setAttribute("a11", a11);
                request.setAttribute("a12", a12);
                request.setAttribute("a13", a13);
                request.setAttribute("a14", a14);
                request.setAttribute("a15", a15);

                request.getRequestDispatcher("utask.jsp").forward(request, response);
            }

            // ================= DEFAULT =================
            else {
                request.getRequestDispatcher("utask.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e);
        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}