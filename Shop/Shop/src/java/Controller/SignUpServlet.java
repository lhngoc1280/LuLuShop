/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AddressDAO;
import DAL.AdminDAO;
import DAL.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

        AddressDAO addb = new AddressDAO();
        request.setAttribute("adb", addb);
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
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
        UserDAO userdb = new UserDAO();
        AdminDAO admindb = new AdminDAO();
        admindb.loadAdminList();
        userdb.loadUserList();
        HttpSession ses = request.getSession();

        ses.setAttribute("userdb", userdb);
        String name = request.getParameter("firstname").trim() + " " + request.getParameter("lastname").trim();
        String logname = request.getParameter("logname").trim();
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String detailadd = request.getParameter("detailAdd");
        String add = detailadd + "-" + ward + "-" + district + "-" + province;
        String pass = request.getParameter("password");
        String repass = request.getParameter("passwordConfirmation");

        if (userdb.lognameExist(logname) || admindb.lognameExisted(logname)) {
            request.setAttribute("LognameError", "Tên đăng nhập đã tồn tại!");

        } else if (!pass.equals(repass)) {
            request.setAttribute("NotMatchPass", "Mật khẩu nhập lại không đúng!");

        } else {
            User u = new User(name, pass, email, phone, add, false);
            userdb.getUserHm().put(logname, u);
            userdb.Insert(name, logname, pass, email, phone, add, false);
//            request.setAttribute("SignupSuccess", "Sign Up Successfully!");

            ses.setAttribute("userVerify", u);
            ses.setAttribute("lognameVerify", logname);
            response.sendRedirect(request.getContextPath()+"/verify");
        }

        doGet(request, response);
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
