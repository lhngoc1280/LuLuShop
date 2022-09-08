/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.UserDAO;
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
public class ForgotPassServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession ses = request.getSession();
        UserDAO userdb = (UserDAO) ses.getAttribute("userdb");
        if (userdb==null){
            userdb = new UserDAO();
            userdb.loadUserList();
            ses.setAttribute("userdb", userdb);
        }
        
        //get data from forgot pass
        String lognamefp = request.getParameter("logname");
        if (lognamefp != null) {
            if (userdb.getUser(lognamefp) != null) {
                ses.setAttribute("userVerify", userdb.getUser(lognamefp));
                ses.setAttribute("lognamefp", lognamefp);
                response.sendRedirect(request.getContextPath() + "/verify");
            } else {
                request.setAttribute("lognameNotExisted", "login name not existed");
                request.getRequestDispatcher("views/forgotpass.jsp").forward(request, response);
            }
        }
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
        HttpSession ses = request.getSession();
        String newpass = request.getParameter("newpass");
        String reenterpass = request.getParameter("re-enterpass");
        UserDAO userdb = (UserDAO) ses.getAttribute("userdb");
        if (!newpass.equals(reenterpass)) {
            request.setAttribute("Passnotmatch", "Mật khẩu nhập lại không đúng");
            request.getRequestDispatcher("views/resetpass.jsp").forward(request, response);

        } else {
            String lognamefp = (String) ses.getAttribute("lognamefp");
            userdb.setNewPass(newpass, lognamefp);
            ses.removeAttribute("userVerify");
            ses.removeAttribute("lognamefp");
            request.setAttribute("resetPassSuccess", "Reset password successfully!");
            request.getRequestDispatcher("views/resetpass.jsp").forward(request, response);

        }

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
