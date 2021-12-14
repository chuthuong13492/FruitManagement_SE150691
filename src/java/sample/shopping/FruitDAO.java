/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author denwi
 */
public class FruitDAO {
    public List<FruitDTO> getAll() throws SQLException{
        List<FruitDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "SELECT p.productID, p.productName, p.categoryID, p.productPrice, p.description, p.quantity, c.categoryName, p.image, p.statusID "
                        + "FROM tblProduct p, tblCategory c "
                        + "WHERE p.categoryID = c.categoryID AND statusID = 1";
                stm = conn.prepareStatement(sql);    
                rs = stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String categoryID = rs.getString("categoryID");
                    Double price = rs.getDouble("productPrice");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    String categoryName= rs.getString("categoryName");
                    String image = rs.getString("image");
                    int status = rs.getInt("statusID");
                    list.add(new FruitDTO(productID, productName, price, quantity, categoryID,  categoryName, description, image, status));
                }
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();            
        }
        return list;
    }
    
    public List<FruitDTO> getListFruit(String search) throws SQLException{
        List<FruitDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = " SELECT p.productID, p.productName, p.categoryID, p.productPrice, p.description, p.quantity, c.categoryName, p.image, p.statusID "
                        + " FROM tblProduct p, tblCategory c "
                        + " WHERE p.categoryID = c.categoryID AND productName like ? AND statusID = 1";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String categoryID = rs.getString("categoryID");
                    Double price = rs.getDouble("productPrice");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    String categoryName= rs.getString("categoryName");
                    String image = rs.getString("image");
                    int status = rs.getInt("statusID");
                    list.add(new FruitDTO(productID, productName, price, quantity, categoryID,  categoryName, description, image, status));
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();            
        }
        return list;
    }    
    
    public List<FruitDTO> getListProduct(String search) throws SQLException{
        List<FruitDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = " SELECT p.productID, p.productName, p.categoryID, p.productPrice, p.description, p.quantity, c.categoryName, p.image, p.statusID "
                        + " FROM tblProduct p, tblCategory c "
                        + " WHERE p.categoryID = c.categoryID AND productName like ?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String categoryID = rs.getString("categoryID");
                    Double price = rs.getDouble("productPrice");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    String categoryName= rs.getString("categoryName");
                    String image = rs.getString("image");
                    int status = rs.getInt("statusID");
                    list.add(new FruitDTO(productID, productName, price, quantity, categoryID,  categoryName, description, image, status));
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();            
        }
        return list;
    }
    
    public boolean addNewProduct(FruitDTO product) throws SQLException, ClassNotFoundException, IOException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblProduct(productID, productName, productPrice, quantity, image, categoryID, description, statusID) "
                        + "VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getFruitName());
                stm.setString(3, Double.toString(product.getPrice()));
                stm.setString(4, Integer.toString(product.getQuantity()));
                stm.setString(5, product.getImage());
                stm.setString(6, product.getCategoryID());
                stm.setString(7, product.getDescription());
                stm.setString(8, "1");
                check = stm.executeUpdate() > 0?true:false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();  
        }
        return check;
    }  
    
    public boolean deteleProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblProduct "
                    + "SET statusID = 0 "
                    + "WHERE productID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, productID);
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public boolean updateProduct(FruitDTO product ) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProduct "
                        + "SET productName=?, productPrice=?, quantity=?, categoryID=?, description=?, statusID=? "
                        + "WHERE productID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getFruitName());
                stm.setString(2, String.valueOf(product.getPrice()));
                stm.setString(3, String.valueOf(product.getQuantity()));
                stm.setString(4, product.getCategoryID());
                stm.setString(5, product.getDescription());
                stm.setInt(6, product.getStatus());
                stm.setString(7, product.getProductID());
                check = stm.executeUpdate() > 0?true:false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(stm != null) stm.close();
            if(conn != null) conn.close(); 
        }
        return check;
    }   
    
}
