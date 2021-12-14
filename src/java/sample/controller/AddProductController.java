/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.shopping.FruitDAO;
import sample.shopping.FruitDTO;
import sample.shopping.ProductError;

/**
 *
 * @author denwi
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {
//blabla
    public static final String ERROR = "addProduct.jsp";
    public static final String SUCCESS = "manageProduct.jsp";

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
        String url = ERROR;
        PrintWriter out = response.getWriter();
        ProductError productError = new ProductError("", "", "", "", "", "", "");
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        String productCategory = request.getParameter("productCategory");
        String description = request.getParameter("productDescription");
        String btn = request.getParameter("action");
        try {
            if (btn != null) {
                if (btn.equals("Add New Product")) {
                    Part p = request.getPart("file");
                    String fileName = p.getSubmittedFileName();
                    String path = "E:"+File.separator+"HoaDNT"+File.separator+"FruitManagement_SE150691"+File.separator+"web"+File.separator+"images"+File.separator + fileName;
                    String image = "images" + File.separator + fileName;
                    FileOutputStream fos =new FileOutputStream(path);
                    InputStream is = p.getInputStream();
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();

                    boolean checkValidator = true;
                    if (productID.length() < 2 || productID.length() > 10) {
                        productError.setProductIDError("Product ID must be in [2,10]!");
                        checkValidator = false;
                    } else if (!productID.matches("^B\\d{1,9}$")) {
                        productError.setProductIDError("Product ID format: [BX...] !!");
                        checkValidator = false;
                    }
                    if (productName.length() < 3 || productName.length() > 50) {
                        productError.setProductNameError("Product Name must be in [3,50]!");
                        checkValidator = false;
                    }
                    if (description.length() < 3 || description.length() > 50) {
                        productError.setProductDescriptionError("Description must be in [3,50]!");
                        checkValidator = false;
                    }
                    if (productPrice <= 0) {
                        productError.setProductPriceError("Product Price must be more than zero!! ");
                        checkValidator = false;
                    }
                    if (checkValidator) {
                        FruitDTO product = new FruitDTO(productID, productName, image, description, productCategory, productPrice, productQuantity);
                        FruitDAO dao = new FruitDAO();
                        boolean check = dao.addNewProduct(product);
                        if (check) {
                            url = SUCCESS;
                        }
                    } else {
                        request.setAttribute("PRODUCT_ERROR", productError);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AddProductController" + e.toString());
            e.printStackTrace();
            if (e.toString().contains("duplicate")) {
                productError.setProductIDError("Duplicate ProductID !");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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
        processRequest(request, response);
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
