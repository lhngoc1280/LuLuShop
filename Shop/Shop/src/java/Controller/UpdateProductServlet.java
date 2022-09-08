/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javafx.stage.FileChooser;
import javax.swing.JFileChooser;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ProductDAO pdb;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
         pdb = (ProductDAO) ses.getAttribute("pdb");
        
        String type_raw = request.getParameter("type");
        String id_raw = request.getParameter("id");
        
        try {
            if (type_raw==null){
                request.setAttribute("pUpdate", pdb.getProduct(1));
            } else{
                int type = Integer.parseInt(type_raw);
            int id = Integer.parseInt(id_raw);
            if (type==0) {
                //update
                request.setAttribute("pUpdate", pdb.getProduct(id));
            } else {
                //delete
                pdb.Delete(id);
                request.setAttribute("DeleteSuccess", "Delete Successfully!");
            }
            }
            
        } catch (Exception e) {
        }
        request.getRequestDispatcher("views/updateProduct.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("pid"));
       String pname = request.getParameter("pname").trim();
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
        String imgname = "p" + (id)+".png";
        //xoa anh cu
        File f = new File("C:\\Users\\Admin\\Documents\\PRJ301\\Shop\\web\\images\\"+imgname);
        f.delete();
        //them anh moi
        imagePart.write(uploadFolder + "/" + imgname);
        
        
        pdb.Update(id, pname, cate, eprice, price, quantity, dis, editor);
        request.setAttribute("updateSuccess", "Update successfully!");
         request.setAttribute("pUpdate", pdb.getProduct(id));
                request.getRequestDispatcher("views/updateProduct.jsp").forward(request, response);

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
