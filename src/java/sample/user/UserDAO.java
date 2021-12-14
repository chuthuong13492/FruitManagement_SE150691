/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author denwi
 */
public class UserDAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "SELECT u.fullName, u.roleID, u.address, u.phone, s.statusID, u.email "
                        + "FROM tblUsers u, tblStatus s "
                        + "WHERE u.statusID = s.statusID and userID=? AND password=? AND s.statusID='1' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String status = rs.getString("statusID");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, fullName, phone, email, roleID, address, "", status);
                }
            }   
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return user;
    }
    public List<UserDTO> getListUser(String search) throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            String sql = "SELECT u.userID, u.fullName, u.roleID, u.address, u.phone, s.statusName, u.email "
                    + "FROM tblUsers u, tblStatus s "
                    + "WHERE s.statusID = u.statusID and fullName like ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            rs = stm.executeQuery();
            while(rs.next()){
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String password = "***";
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String status = rs.getString("statusName");
                String email = rs.getString("email");
                list.add(new UserDTO(userID, fullName, phone, email, roleID, address, password, status));
            }
        }catch(Exception e){            
        }finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    public boolean  deleteUser(String userID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "UPDATE tblUsers "
                        + "SET statusID = 2 "
                        + "WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public boolean  updateUser(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "UPDATE tblUsers "
                        + "SET fullName=?, roleID=?, phone=?, email=?, address=? "
                        + "WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getEmail());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getUserID());
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){            
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public boolean  checkDuplicate(String userID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "SELECT userID "
                        + "FROM tblUsers "
                        + "WHERE userID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
            if(rs != null) rs.close();
        }
        return check;
    }
    public boolean insertUser(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "INSERT INTO tblUsers(fullName, phone, email, password, address, userID, roleID, statusID) "
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getPhone());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getPassword());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getUserID());
                stm.setString(7, "US");
                stm.setString(8, "1");
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public boolean insertUserFB(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "INSERT INTO tblUsers(fullName, phone, email, password, address, userID, roleID, statusID) "
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getPhone());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getPassword());
                stm.setString(5, user.getAddress());
                stm.setString(6, user.getUserID());
                stm.setString(7, user.getRoleID());
                stm.setString(8, user.getStatusID());
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public static UserDTO checkLoginFB(String userID) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                String sql = "SELECT userID, fullName, password, roleID, phone, statusID, address, email "
                        + "FROM tblUsers "
                        + "WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if(rs.next()){
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    String roleID = rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String statusID = rs.getString("statusID");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, fullName, phone, email, roleID, address, password, statusID);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm != null) stm.close();
            if(conn != null) conn.close();
            if(rs != null) rs.close();
        }   
        return user;
    }
}
