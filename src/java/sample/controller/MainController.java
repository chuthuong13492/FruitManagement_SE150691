/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author denwi
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String LOGOUT = "LogoutController";
    private static final String DELETE = "DeleteController";
    private static final String UPDATE = "UpdateController";
    private static final String CREATE = "CreateController";
    private static final String SEARCH_FRUIT = "SearchFruitController";
    private static final String SEARCH_PRODUCT = "SearchProductController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String ADD_MORE = "product.jsp";
    private static final String REMOVE_CART = "RemoveCartController";
    private static final String EDIT_CART = "EditCartController";
    private static final String CHECK_CART = "CheckCartController";
    private static final String PURCHASE = "PurchaseController";
    private static final String CHECK_OUT = "CheckOutController";
    private static final String FB = "LoginFacebookController";
    private static final String MANAGE_PRODUCT = "manageProduct.jsp";
    private static final String PAGE_ADD_PRODUCT = "addProduct.jsp";
    private static final String DEL_PRODUCT = "DeleteProductController";
    private static final String EDIT_PRODUCT = "EditProductController";
    private static final String AD = "admin.jsp";

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
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Create".equals(action)) {
                url = CREATE;
            } else if ("Delete".equals(action)) {
                url = DELETE;
            } else if ("Update".equals(action)) {
                url = UPDATE;
            } else if ("SearchFruit".equals(action)) {
                url = SEARCH_FRUIT;
            } else if ("Search Product".equals(action)) {
                url = SEARCH_PRODUCT;
            } else if ("Add to cart".equals(action)) {
                url = ADD_TO_CART;
            } else if ("ADD MORE FRUIT".equals(action)) {
                url = ADD_MORE;
            } else if ("Remove".equals(action)) {
                url = REMOVE_CART;
            } else if ("Edit".equals(action)) {
                url = EDIT_CART;
            } else if ("Check".equals(action)) {
                url = CHECK_CART;
            } else if ("Purchase".equals(action)) {
                url = PURCHASE;
            } else if ("Check Out".equals(action)) {
                url = CHECK_OUT;
            } else if ("FB".equals(action)) {
                url = FB;
            } else if ("Manage Product".equals(action)) {
                url = MANAGE_PRODUCT;
            } else if ("Add Product".equals(action)) {
                url = PAGE_ADD_PRODUCT;
            } else if ("Del".equals(action)) {
                url = DEL_PRODUCT;
            } else if ("Edit Fruit".equals(action)) {
                url = EDIT_PRODUCT;
            } else if ("Back to Admin".equals(action)) {
                url = AD;
            } else {
                session.setAttribute("ERROR_MESSAGE", "Function is not available!");
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
