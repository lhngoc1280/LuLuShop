/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.MessagingException;
import newpackage.SendEmail;

/**
 *
 * @author Admin
 */
public class VerifyEmailServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifyEmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyEmailServlet at " + request.getContextPath() + "</h1>");
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
        String verCode = String.valueOf(SendEmail.getrdcode());
        String host = getServletContext().getInitParameter("host");
        String port = getServletContext().getInitParameter("port");
        String userName = getServletContext().getInitParameter("user");
        String password = getServletContext().getInitParameter("pass");
        User u = (User) ses.getAttribute("userVerify");
        User userUnknown = (User) ses.getAttribute("userUnknown");
        String toAddress ;

        String location = request.getParameter("lo");
        if (location != null) {
            ses.setAttribute("location", location);
            User user = (User) ses.getAttribute("user");
            toAddress = user.getEmail();
        } else if (userUnknown != null) {
            
            toAddress = userUnknown.getEmail();
        } else{
            toAddress = u.getEmail();
        }

        ses.setAttribute("verifyCode", verCode);
        try {
            SendEmail.sendEmail(host, port, userName, password, toAddress, "Verify Code for you account", verCode);
        } catch (MessagingException ex) {

        }
        request.getRequestDispatcher("views/verify.jsp").forward(request, response);
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
//        processRequest(request, response);

        HttpSession ses = request.getSession();
        String entercode = request.getParameter("code");
        String authcode = (String) ses.getAttribute("verifyCode");

        String lognamefp = (String) ses.getAttribute("lognamefp");
        String location = (String) ses.getAttribute("location");
        User userUnknown = (User) ses.getAttribute("userUnknown");

        //nhap dung ma xac nhan
        if (entercode.equals(authcode)) {
            if (lognamefp != null) { //forgot pass
                response.sendRedirect(request.getContextPath() + "/views/resetpass.jsp");
            } else
            if (location != null) { //del account
                if (location.equals("deluser")) {
                    response.sendRedirect(request.getContextPath() + "/delacc");
                }
            }else {//set active
                 response.sendRedirect(request.getContextPath() + "/setactive");
            }

        } else {
            request.setAttribute("WrongCode", "Mã xác thực sai, vui lòng nhập lại!");
            request.getRequestDispatcher("views/verify.jsp").forward(request, response);
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
