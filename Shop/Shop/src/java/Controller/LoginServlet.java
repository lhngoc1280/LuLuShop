/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.AdminDAO;
import DAL.UserDAO;
import Model.Admin;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);

        HttpSession ses = request.getSession();
        
        if (!checkLoadDB){
            loadDB();
        }
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        Admin ad = admindb.getAdmin(name, pass);
        User u = userdb.getUser(name, pass);
        ses.setAttribute("logname", name);
        ses.setAttribute("admindb", admindb);
        ses.setAttribute("userdb", userdb);
        if (ad!=null){
            if (!ad.isActive()){
                request.setAttribute("LoginError", "Your account does not have permission!");
                doGet(request, response);
            }
            ses.setAttribute("rolename", "admin");
            ses.setAttribute("admin", ad);
            response.sendRedirect(request.getContextPath()+"/home");
        }  else if (u!=null){
            ses.setAttribute("rolename", "user");
            ses.setAttribute("user", u);
            response.sendRedirect(request.getContextPath()+"/home");
        } else {
            request.setAttribute("LoginError", "Wrong Login Name or Password!");
            doGet(request, response);
        }
           
    }
    
    private boolean checkLoadDB = false;
    private AdminDAO admindb;
    private UserDAO userdb;
    
    public void loadDB(){
         admindb = new AdminDAO();
        admindb.loadAdminList();
         userdb = new UserDAO();
        userdb.loadUserList();
        checkLoadDB = true;
    }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
