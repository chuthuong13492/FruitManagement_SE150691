/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.order.Order;
import sample.order.OrderDAO;
import sample.order.OrderDetail;
import sample.order.OrderError;
import sample.shopping.Cart;
import sample.shopping.FruitDTO;
import sample.user.UserDTO;

/**
 *
 * @author denwi
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    public static final String ERROR = "user.jsp";
    public static final String SUCCESS = "success.jsp";

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
        OrderError orderError = new OrderError("", "", "", "");
        try {
            String orderID = request.getParameter("orderID");
            float total = Float.parseFloat(request.getParameter("total"));
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String statusID = "1";
            String paymentStatus = "Paid";
            long millis = System.currentTimeMillis();
            Date orderDate = new Date(millis);
            OrderDAO dao = new OrderDAO();
            Cart cart = (Cart) session.getAttribute("CART");
            boolean checkValidate = true;
            checkValidate = dao.checkDuplicate(orderID);
            if (!checkValidate) {
                orderError.setOrderIDError("Order ID is duplicated!");
            }
            if (checkValidate) {
                Order order = new Order(orderID, email, userID, address, phone, total, orderDate, statusID, paymentStatus);
                boolean checkOrder = dao.checkOut(order);
                boolean checkInsert = true;
                if (checkOrder) {
                    for (FruitDTO fruit : cart.getCart().values()) {
                        int quantity = fruit.getAmount();
                        int detailID = dao.getDetailID() + 1;
                        System.out.println(detailID);
                        String productID = fruit.getProductID();
                        Double detailPrice = fruit.getPrice();
                        OrderDetail newDetail = new OrderDetail(detailID, orderID, productID, quantity, detailPrice, statusID);
                        boolean checkUpdate = dao.updateQuantity(productID, (fruit.getQuantity() - quantity));
                        if(!checkInsert || !checkUpdate){
                            break;
                        }
                        if (dao.insertOrderDetail(newDetail)) {
                            request.setAttribute("CHECK_OUT", "CHECK OUT SUCCESSFULLY");
                            session.setAttribute("ORDER", newDetail);
                            session.removeAttribute("CART");
                            url = SUCCESS;
                        }
                    }
                }
            } else {
                request.setAttribute("CHECK_OUT_ERROR", orderError);
            }
        } catch (Exception e) {
            log("Error at CheckOutController " + e.toString());
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
