/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProductDAO;
import DAL.UserDAO;
import Model.Cart;
import Model.Item;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ChangeCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangeCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeCartServlet at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        UserDAO userdb = (UserDAO) ses.getAttribute("userdb");
        ProductDAO pdb = (ProductDAO) ses.getAttribute("pdb");

        String act = request.getParameter("act");
        String act_id = request.getParameter("pid");

        //tang giam so luong / xoa
        if (act != null) {
            User u = (User) ses.getAttribute("user");
            int proId = Integer.parseInt(act_id);
            Product p = pdb.getProduct(proId);
            Item i;
            if (act.equals("minus")) {
                i = new Item(p, -1, p.getPrice());
            } else if (act.equals("plus")) {
                i = new Item(p, 1, p.getPrice());
            } else {
                //xoa
                i = null;
            }
            if (u != null) {

                Cart cart = (Cart) ses.getAttribute("cart");
                if (i != null) {
                    cart.addItem(i);
                } else {
                    cart.removeItem(proId);
                }

                //cap nhat cookie
                for (Cookie c : cookies) {
                    //da co cookie tu truoc
                    if (c.getName().equals("cart" + userdb.getLogname(u))) {
//                        response.sendRedirect(request.getContextPath() + "/views/xxx.jsp");

                        c.setMaxAge(0);
                        response.addCookie(c);

                        break;
                    }
                }
                //chua co cookie

                Cookie c = new Cookie("cart" + userdb.getLogname(u), cart.toString());
                c.setMaxAge(86400);
                response.addCookie(c);
//                     response.sendRedirect(request.getContextPath() + "/views/xxx.jsp");

                ses.setAttribute("cart", cart);
                ses.setAttribute("cartsize", cart.getItems().size());
            } else { // nguoi dung chua dang nhap
                Cart unknownCart = (Cart) ses.getAttribute("unknownCart");

                if (i != null) {
                    unknownCart.addItem(i);
                } else {
                    unknownCart.removeItem(proId);
                }
                ses.setAttribute("unknownCart", unknownCart);
                ses.setAttribute("cartsize", unknownCart.getItems().size());
            }
            String uri = request.getScheme() + "://"
                    + // "http" + "://
                    request.getServerName()
                    + // "myhost"
                    ":"
                    + // ":"
                    request.getServerPort()
                    + // "8080"
                    request.getRequestURI();     // "/people"
//             "?" +                           // "?"
//             request.getQueryString();       // "lastname=Fox&age=30"
//            String url = request.getParameter("url");

            response.sendRedirect(uri + "#" + act_id);
        } else {
            response.sendRedirect(request.getContextPath() + "/views/cart.jsp");
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
