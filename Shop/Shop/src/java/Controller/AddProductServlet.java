/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CateDAO;
import DAL.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.mail.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AddProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
        
        request.getRequestDispatcher("views/addProduct.jsp").forward(request, response);
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
        
        ProductDAO pdb = (ProductDAO) ses.getAttribute("pdb");

        String pname = request.getParameter("pname");
        int cate = Integer.parseInt(request.getParameter("cate"));
        int eprice = Integer.parseInt(request.getParameter("eprice"));
        int price = Integer.parseInt(request.getParameter("price"));
        int dis = Integer.parseInt(request.getParameter("dis"));
        String editor = request.getParameter("editor");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        //image
//        String uploadFolder = request.getServletContext().getRealPath("/images");
            String uploadFolder = "C:\\Users\\Admin\\Documents\\PRJ301\\Shop\\web\\images";
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectory(uploadPath);
        }
        jakarta.servlet.http.Part imagePart = request.getPart("img");
        String imgname = "p" + (pdb.getpList().size()+1)+".png";
        imagePart.write(uploadFolder + "/" + imgname);

        pdb.Insert(pname, cate, eprice, price, quantity, dis, editor, true, 0);
        
       
        request.setAttribute("addSuccess", "Add product successfully!");
        doGet(request, response);

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
