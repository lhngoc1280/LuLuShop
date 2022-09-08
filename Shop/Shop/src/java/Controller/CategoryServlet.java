/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CateDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.PageInfor;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(name = "CategoryServlet", urlPatterns = {"/cate"})
public class CategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet CategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServlet at " + request.getContextPath() + "</h1>");
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

        //paging
        PageInfor page = (PageInfor) ses.getAttribute("page");
        String cp = request.getParameter("cp");
        String nrpp = request.getParameter("nrpp");
        if (cp != null) {
            page.setCp(Integer.parseInt(cp));
            page.calc();
            ses.setAttribute("page", page);
        }
        if (nrpp != null) {
            page.setNrpp(Integer.parseInt(nrpp));
            page.setCp(1);
            page.calc();
            ses.setAttribute("page", page);
        }

        ProductDAO pdb = (ProductDAO) ses.getAttribute("pdb");
        ArrayList<Category> clist = (ArrayList<Category>) ses.getAttribute("clist");
        ArrayList<Product> plist;
        String id_raw = request.getParameter("id");

        int cid;
        if (id_raw == null) {
            cid = 1;
            plist = pdb.getProductByCate("1", clist);
        } else {
            cid = Integer.parseInt(id_raw);
            plist = pdb.getProductByCate(id_raw, clist);
        }
        String cname = "";
        for (Category c : clist) {
            if (c.getId() == cid) {
                cname = c.getName();
                break;
            }
        }
        ses.setAttribute("querycate", "id=" + cid);

        String sort_by = request.getParameter("sort_by");
        if (sort_by != null) {
            String x = (String) ses.getAttribute("querycate");
            ses.setAttribute("querycate", x + "&sort_by=" + sort_by);
            if (sort_by.equals("price")) {
                plist = pdb.sortByPrice(plist);
            } else if (sort_by.equals("name")) {
                plist = pdb.sortByName(plist);
            } else if (sort_by.equals("discount")) {
                plist = pdb.sortByDiscount(plist);
            } else {
                plist = pdb.getProductByCate(id_raw, clist);
            }
            String query = request.getQueryString();
            request.setAttribute("query", query);

            String order_by = request.getParameter("order_by");
            if (order_by != null) {
                String y = (String) ses.getAttribute("querycate");
                ses.setAttribute("querycate", y + "&order_by=" + order_by);

                if (order_by.equals("desc")) {
                    Collections.reverse(plist);
                }
            }
        }
        if (page != null && plist!=null) {
            page.setSize(plist.size());
            page.calc();
            ses.setAttribute("page", page);
        }

        //phan trang mac dinh
        if (page == null) {
            page = new PageInfor(1, 12, plist.size());
            page.calc();
            ses.setAttribute("page", page);
        }

        request.setAttribute("plist", plist);
        request.setAttribute("cid", cid);
        request.setAttribute("cname", cname);
//        ses.setAttribute("querycate", request.getQueryString());
//        response.sendRedirect("views/xxx.jsp");
        request.getRequestDispatcher("/views/categories.jsp").forward(request, response);

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

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    // Getting servlet request URL
//        String url = request.getRequestURL().toString();
//
//        // Getting servlet request query string.
//        String queryString = request.getQueryString();
//
//        // Getting request information without the hostname.
//        String uri = request.getRequestURI();
//
//        // Below we extract information about the request object path
//        // information.
//        String scheme = request.getScheme();
//        String serverName = request.getServerName();
//        int portNumber = request.getServerPort();
//        String contextPath = request.getContextPath();
//        String servletPath = request.getServletPath();
//        String pathInfo = request.getPathInfo();
//        String query = request.getQueryString();
//
//        response.setContentType("text/html");
//        PrintWriter pw = response.getWriter();
//        pw.print("Url: " + url + "<br/>");
//        pw.print("Uri: " + uri + "<br/>");
//        pw.print("Scheme: " + scheme + "<br/>");
//        pw.print("Server Name: " + serverName + "<br/>");
//        pw.print("Port: " + portNumber + "<br/>");
//        pw.print("Context Path: " + contextPath + "<br/>");
//        pw.print("Servlet Path: " + servletPath + "<br/>");
//        pw.print("Path Info: " + pathInfo + "<br/>");
//        pw.print("Query: " + query);
}
