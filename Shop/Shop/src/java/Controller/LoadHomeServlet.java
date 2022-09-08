/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CateDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import Model.Cart;
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

/**
 *
 * @author Admin
 */
public class LoadHomeServlet extends HttpServlet {

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
            out.println("<title>Servlet LoadAdHomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadAdHomeServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        if (!checkLoadDB) {
            loadDB();
        }

        ses.setAttribute("pdb", pdb);
        ses.setAttribute("clist", catedb.getCateList());

        //load cart
        Cookie[] cookies = request.getCookies();
        UserDAO userdb = (UserDAO) ses.getAttribute("userdb");
        
        String cart_txt = "";

        User u = (User) ses.getAttribute("user");
        if (u != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("cart" + userdb.getLogname(u))) {
                    cart_txt = c.getValue();
                    break;
                }
            }
            Cart cart = new Cart(userdb.getLogname(u), cart_txt, pdb.getpList());
            ses.setAttribute("cart", cart);
            ses.setAttribute("cartsize", cart.getItems().size());
//response.sendRedirect("views/xxx.jsp");
        } else {
            ses.setAttribute("unknownCart", new Cart());
            ses.setAttribute("cartsize", 0);
        }
        //end load cart

        Object role = ses.getAttribute("rolename");
        if (role != null) {
            if (((String) role).equals("admin")) {
                response.sendRedirect("views/adminHome.jsp");
            }else 
                        response.sendRedirect("views/home.jsp");

        } else
        response.sendRedirect("views/home.jsp");

    }

    private boolean checkLoadDB = false;
    private ProductDAO pdb;
    private CateDAO catedb;

    public void loadDB() {
        pdb = new ProductDAO();
        pdb.loadProductList();
        catedb = new CateDAO();
        catedb.loadCateList();

        checkLoadDB = true;
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
