/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author denwi
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

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
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String confirm = request.getParameter("confirm");
            String roleID = "US";
            String status = "1";

            boolean check = true;
            UserError userError = new UserError("", "", "", "", "", "", "", "", "");
            if (userID.length() > 20 || userID.length() < 2) {
                userError.setUserIDError("User must be 2-20 characters");
                check = false;
            }
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setFullNameError("User Name must be 5-20 characters");
                check = false;
            }
            if (phone.length() > 50 || phone.length() < 1) {
                userError.setPhoneError("Phone must be at least 10 characters");
                check = false;
            }
            if (email.length() > 50 || email.length() < 1) {
                userError.setEmailError("Email must be at least 10 characters");
                check = false;
            }
            if (address.length() > 50 || address.length() < 5) {
                userError.setAddressError("Address must be 5-20 characters");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmPassError("Password do not duplicated!");
                check = false;
            }
            if(check){
                UserDAO dao = new UserDAO();
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if(checkDuplicate){
                    request.setAttribute("USER_ERROR", userError);
                    userError.setUserIDError("UserID is duplicated!");
                }else{
                    UserDTO user = new UserDTO(userID, fullName, phone, email, roleID, address, password, status);
                    boolean checkInsert = dao.insertUser(user);
                    if(checkInsert){                       
                        url = SUCCESS;
                    }
                }                
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController:" + e.toString());
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
