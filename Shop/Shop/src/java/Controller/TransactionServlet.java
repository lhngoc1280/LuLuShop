/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProductDAO;
import DAL.TransactionDAO;
import DAL.UserDAO;
import Model.Cart;
import Model.Item;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class TransactionServlet extends HttpServlet {

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
            out.println("<title>Servlet TransactionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionServlet at " + request.getContextPath() + "</h1>");
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
        User u = (User) ses.getAttribute("user");
        User userUnknown = (User) ses.getAttribute("userUnknown");
        if (userUnknown != null) {
            doPost(request, response);
        } else {

            if (u!=null && !u.isActive()) {
                request.setAttribute("OrderError", "Tài khoản của bạn tạm thời bị khóa, vui lòng thử lại sau!");
                request.getRequestDispatcher("views/cart.jsp").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/views/cart.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/views/transactionCheck.jsp");
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
        Cookie[] cookies = request.getCookies();
        UserDAO userdb = (UserDAO) ses.getAttribute("userdb");
        User u = (User) ses.getAttribute("user");
        Cart cart = (Cart) ses.getAttribute("cart");
        ProductDAO pdb = (ProductDAO) ses.getAttribute("pdb");
        String logname = (String) ses.getAttribute("logname");
        User userUnknown1 = (User) ses.getAttribute("userUnknown");

        if (userdb == null) {
            userdb = new UserDAO();
            userdb.loadUserList();
            ses.setAttribute("userdb", userdb);
        }

        if (logname == null) {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String detailAdd = request.getParameter("detailAdd");
            String note = request.getParameter("note");
            ses.setAttribute("note", note);
            String randomLogname = Math.random() + "";
            while (userdb.lognameExist(randomLogname)) {
                randomLogname = Math.random() + "";
            }
            User userUnknown = new User(firstname + " " + lastname, "123", email, phone, detailAdd, false);
            userdb.Insert(firstname + " " + lastname, randomLogname, "123", email, phone, detailAdd, false);
            userdb.getUserHm().put(randomLogname, userUnknown);
            ses.setAttribute("userUnknown", userUnknown);
            ses.setAttribute("lognameVerify", randomLogname);
            response.sendRedirect(request.getContextPath() + "/verify");
        } else {
            String note = request.getParameter("note");
        TransactionDAO trandb = (TransactionDAO) ses.getAttribute("trandb");
        if (trandb == null) {
            trandb = new TransactionDAO();
            trandb.loadTransList();
        }

        if (u != null) {
            trandb.addTransaction(logname, u, cart, note);
            pdb.loadProductList();
            //xoa cookie cu
            for (Cookie c : cookies) {
                //da co cookie tu truoc
                if (c.getName().equals("cart" + userdb.getLogname(u))) {
//                    response.sendRedirect(request.getContextPath() + "/views/xxx.jsp");
                    c.setMaxAge(0);
                    response.addCookie(c);
                    break;
                }
            }
            ses.setAttribute("cart", new Cart(new ArrayList<Item>(), logname));
        }
        if (userUnknown1 != null) {
            Cart unknownCart = (Cart) ses.getAttribute("unknownCart");
            String note1 = (String) ses.getAttribute("note");
            trandb.addTransaction(logname, u, unknownCart, note1);
            pdb.loadProductList();
            ses.removeAttribute("userUnknown");
            ses.removeAttribute("logname");
            ses.removeAttribute("rolename");
            ses.removeAttribute("user");
            ses.setAttribute("unknownCart", new Cart());
        }
        trandb.loadTransList();
        ses.setAttribute("trandb", trandb);
        //xoa session

        ses.setAttribute("cartsize", 0);
        response.sendRedirect(request.getContextPath() + "/views/orderSuccess.jsp");
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
