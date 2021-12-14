/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.shopping.FruitDTO;
import sample.utils.DBUtils;

/**
 *
 * @author denwi
 */
public class OrderDAO {
    public boolean checkOut(Order order) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders(orderID, userID, email, address, phone, total, orderDate, statusID, paymentStatus) "
                        + " VALUES(?,?,?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, order.getOrderID());
                stm.setString(2, order.getUserID());
                stm.setString(3, order.getEmail());
                stm.setString(4, order.getAddress());
                stm.setString(5, order.getPhone());
                stm.setDouble(6, order.getTotalMoney());
                stm.setDate(7, order.getOrderDate());
                stm.setString(8, order.getStatusID());
                stm.setString(9, order.getPaymentStatus());
                check = stm.executeUpdate() >0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrderDetail(detailID,orderID,productID,quantity,price,statusID) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderDetail.getOrderDetailID());
                stm.setString(2, orderDetail.getOrderID());
                stm.setString(3, orderDetail.getProductID());
                stm.setInt(4, orderDetail.getQuantity());
                stm.setString(5, Double.toString(orderDetail.getPrice()));
                stm.setString(6, orderDetail.getStatusID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String orderID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT orderID FROM tblOrders WHERE orderID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public FruitDTO getByID(int id) throws SQLException{
        FruitDTO fruit = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            String sql = "SELECT productID, productName, productPrice, quantity, categoryID, description, image "
                    + "FROM tblProduct "
                    + "ORDER  productID=? ";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while(rs.next()){
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                Double productPrice = rs.getDouble("productPrice");
                int quantity = rs.getInt("quantity");
                String categoryID = rs.getString("categoryID");
                String description = rs.getString("description");
                String image = rs.getString("image");
                fruit = new FruitDTO(productID, productName, image, description, categoryID, productPrice, quantity);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return fruit;
    }
    
    public int getDetailID() throws SQLException{
        int detail = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            String sql = "SELECT MAX(detailID) as detailID "
                    + "FROM tblOrderDetail ";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if(rs.next()){
                detail = rs.getInt("detailID");               
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return detail;
    }
    
    public boolean updateQuantity(String id, int quantity) throws SQLException{
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = new DBUtils().getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProduct SET quantity=? "
                        + "WHERE productID =?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, id);
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
