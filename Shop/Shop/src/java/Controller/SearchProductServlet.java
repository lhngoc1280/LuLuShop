/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProductDAO;
import Model.PageInfor;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Admin
 */
public class SearchProductServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchProductServlet at " + request.getContextPath() + "</h1>");
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
        String keyword = request.getParameter("search");
        HttpSession ses = request.getSession();
        
        //paging
        PageInfor page = (PageInfor) ses.getAttribute("page");
        String cp = request.getParameter("cp");
        String nrpp = request.getParameter("nrpp");
        if (cp!=null){
            page.setCp(Integer.parseInt(cp));
            page.calc();
            ses.setAttribute("page", page);
        }
        if (nrpp!=null){
            page.setNrpp(Integer.parseInt(nrpp));
            page.setCp(1);
            page.calc();
            ses.setAttribute("page", page);
        }
        
        ProductDAO pdb = (ProductDAO) ses.getAttribute("pdb");
        ArrayList<Product> plist = pdb.getProductBySearch(keyword);
        if (keyword != null && keyword!="") {
            ses.setAttribute("querysearch", "search=" + keyword);
        } else{
            plist=null;
        }
        
        
        String sort_by = request.getParameter("sort_by");
        if (sort_by != null) {
            String x = (String) ses.getAttribute("querysearch");
            ses.setAttribute("querysearch", x + "&sort_by=" + sort_by);
            if (sort_by.equals("price")) {
                plist = pdb.sortByPrice(plist);
            } else if (sort_by.equals("name")) {
                plist = pdb.sortByName(plist);
            } else if (sort_by.equals("discount")) {
                plist = pdb.sortByDiscount(plist);
            } else {
                plist = pdb.getProductBySearch(keyword);
            }
            String query = "search=" + keyword + "&sort_by=" + sort_by;
            request.setAttribute("query", query);

            String order_by = request.getParameter("order_by");
            if (order_by != null) {
                String y = (String) ses.getAttribute("querysearch");
                ses.setAttribute("querysearch", y + "&order_by=" + order_by);

                if (order_by.equals("desc")) {
                    Collections.reverse(plist);
                }
            }
        }
        
        if (page != null && plist!=null ) {
            page.setSize(plist.size());
            page.calc();
            ses.setAttribute("page", page);
//            ses.setAttribute("pListSearch", plist);
//            response.sendRedirect("views/xxx.jsp");
        }

        //phan trang mac dinh
        if (page == null) {
            
            page = new PageInfor(1, 12, 0);
            page.calc();
            ses.setAttribute("page", page);
        }
        
        

        ses.setAttribute("pListSearch", plist);
        request.setAttribute("sort_by", sort_by);
        request.setAttribute("search", keyword);

        request.getRequestDispatcher("/views/search.jsp").forward(request, response);
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
