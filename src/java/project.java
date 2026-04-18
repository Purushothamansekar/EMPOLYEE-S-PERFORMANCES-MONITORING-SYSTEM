/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PERUMAL
 */
public class project extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
                    	          String url = "jdbc:mysql://localhost:3306/athidhar_project";
            Class.forName("com.mysql.jdbc.Driver");Connection con = DriverManager.getConnection(url, "root","root");            Statement smt=con.createStatement();
            String a1=request.getParameter("a1");
             String a2=request.getParameter("a2");
                         String a3=request.getParameter("a3");
                           String a4=request.getParameter("a4");
             String a5=request.getParameter("a5");
                         String a6=request.getParameter("a6");
                           String a7=request.getParameter("a7");
                         
                               String a8=request.getParameter("a8");
                    
                                String a9=request.getParameter("a9");
                         
                               String a10=request.getParameter("a10");
                               String a11=request.getParameter("a11");
                       String a14="Employee";
                         
                          String a15="User";

		ArrayList al=new ArrayList();

      Date date = new Date();
SimpleDateFormat sdf;

sdf = new SimpleDateFormat("MMMM");
 a15=sdf.format(date);           
             
		
  
             if(request.getParameter("add")!=null){
                   if((a1.equals(""))||(a2.equals(""))||(a3.equals(""))||(a4.equals(""))||(a5.equals(""))||(a6.equals(""))||(a7.equals(""))||(a8.equals(""))){
                        request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("aproject.jsp");
                    rs.forward(request, response);
                  }else{
                 String vt=null;
               	ResultSet rt=smt.executeQuery("select * from project where pid='"+a1+"' ");
               if(rt.next()){
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Ration code Already Exist");
                   RequestDispatcher rs=request.getRequestDispatcher("aproject.jsp");
                    rs.forward(request, response); 
                }else {
	      int v=   smt.executeUpdate("insert into project values('"+a1+"','"+a2+"','"+a3+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"','"+a9+"','"+a10+"','"+a4+"')");
                if(v==1){
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Successfully stored");
                   RequestDispatcher rs=request.getRequestDispatcher("aproject.jsp");
                    rs.forward(request, response);
                }else{
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("aproject.jsp");
                    rs.forward(request, response);
                }}}
             }else if(request.getParameter("cancel")!=null){
            
			
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("aproject.jsp");
			requestdispatcher.forward(request, response);

		
                
                }
              
		
              
                else{
                                        
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("aproject.jsp");
                    rs.forward(request, response);
                }
                 
        }catch(Exception e){
            e.printStackTrace();
        }finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
