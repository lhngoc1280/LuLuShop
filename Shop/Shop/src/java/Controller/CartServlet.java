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
import java.util.ArrayList;
import javax.mail.Session;

/**
 *
 * @author Admin
 */
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
        String pAddCart = request.getParameter("pAddCart");
        Product p = pdb.getProduct(pAddCart);
        String quantity = request.getParameter("quantity");
        String cart_txt = "";

        String uri = request.getScheme() + "://"
                + // "http" + "://
                request.getServerName()
                + // "myhost"
                ":"
                + // ":"
                request.getServerPort()
                + // "8080"
                request.getRequestURI();     // "/people"
        ses.setAttribute("uri", uri);

        if (pAddCart != null) {
            User u = (User) ses.getAttribute("user");
            Item i = new Item(p, Integer.parseInt(quantity), p.getPrice());
            if (u != null) {
                Cart cart = (Cart) ses.getAttribute("cart");
                cart.addItem(i);
                ses.setAttribute("cartsize", cart.getItems().size());
                //xoa cookie cu
                for (Cookie c : cookies) {
                    //da co cookie tu truoc
                    if (c.getName().equals("cart" + userdb.getLogname(u))) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                        break;
                    }
                }
                //tao moi cookie
                Cookie c = new Cookie("cart" + userdb.getLogname(u), cart.toString());
                c.setMaxAge(86400);
                response.addCookie(c);

            } else { // nguoi dung chua dang nhap
                Cart unknownCart = (Cart) ses.getAttribute("unknownCart");
                unknownCart.addItem(i);
                ses.setAttribute("unknownCart", unknownCart);
                ses.setAttribute("cartsize", unknownCart.getItems().size());
            }
            String url = request.getParameter("urltext");
//            ses.setAttribute("urltext", url);
            if (url!=null && url.contains("home.jsp")) {
                response.sendRedirect(url + "#" + pAddCart);
            } else if (url!=null) {
                //request tu category.jsp
                String querycate = request.getParameter("qcate");
                String querysearch = request.getParameter("qsearch");

                if (querycate != null) {
                    if (querycate != "") {
                        querycate = (String) ses.getAttribute("querycate");
                        ses.removeAttribute("querycate");
                        url = request.getContextPath() + "/cate?" + querycate;
                    } else {
                        url = request.getContextPath() + "/cate";
                    }
                } else if (querysearch != null) {

                    if (querysearch != "") {
                        querysearch = (String) ses.getAttribute("querysearch");
                        ses.removeAttribute("querysearch");
                        url = request.getContextPath() + "/search?" + querysearch;
                    } else {
                        url = request.getContextPath() + "/search";
                    }
                }

                response.sendRedirect(url);
            } else 
            response.sendRedirect(request.getContextPath()+"/productdetail?pid="+pAddCart);

//            response.sendRedirect(request.getContextPath() + "/views/xxx.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/views/home.jsp");

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
