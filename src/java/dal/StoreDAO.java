/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import connectDB.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Dish;
import model.Store;

/**
 *
 * @author Asus
 */
public class StoreDAO {

    private final DBContext db;

    public StoreDAO() throws Exception {
        db = new DBContext();
    }

    public void addStore(String store_name, String address, String timeOC, String image, String store_phoneNumber) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            String sql = "INSERT INTO Store (store_name, address, timeOC, store_phoneNumber) VALUES (?, ?, ?, ?)";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);

            // Đảm bảo sử dụng UTF-8 cho kết nối để hỗ trợ tiếng Việt
//            connection.createStatement().execute("SET store_name 'UTF8'");
//            connection.createStatement().execute("SET CHARACTER SET 'UTF8'");

            // Kiểm tra và đặt các giá trị đầu vào
            ps.setString(1, store_name);
            ps.setString(2, address);
            ps.setString(3, timeOC);
            ps.setString(4, store_phoneNumber);

            // Thực hiện truy vấn
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng PreparedStatement và Connection trong khối finally để đảm bảo giải phóng tài nguyên
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    // Xử lý lỗi đóng PreparedStatement
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    // Xử lý lỗi đóng Connection
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public ArrayList<Store> getAll() {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT store_id, store_name,address, timeOC, store_phoneNumber FROM Store";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);

            ArrayList<Store> list = new ArrayList<>();

            rs = ps.executeQuery();

            while (rs.next()) {
                Store store = new Store();
                store.setStore_id(rs.getInt("store_id"));
                store.setAddress(rs.getString("address"));
                store.setStore_name(rs.getString("store_name"));
                store.setOcTime(rs.getString("timeOC"));

                store.setStore_PhoneNumber(rs.getString("store_phoneNumber"));

                list.add(store);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return null;
    }

    public void delete(int store_id) {
        try {

            String sql = "DELETE FROM Store WHERE store_id = ?;";
            Connection connection = null;

            connection = db.getConnection();
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, store_id);
                ps.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Store getStoreById(int store_id) {
        try {
            String sql = "select store_id,store_name,timeOC,  store_phoneNumber from Store where store_id = ?";
            Connection connection = null;
            connection = db.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, store_id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Store store = new Store();
            store.setStore_id(rs.getInt("store_id"));
            store.setStore_name(rs.getString("store_name"));
            store.setOcTime(rs.getString("timeOC"));

            store.setStore_PhoneNumber(rs.getString("store_phoneNumber"));
            rs.close();
            ps.close();
            return store;
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(int store_id, String store_name, String address, String timeOC, String phoneNumber) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            String sql = "UPDATE Store \n"
                    + "SET store_name = ?, address = ? , timeOC = ?, store_phoneNumber = ? \n"
                    + "WHERE store_id = ?";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);

            // Kiểm tra và đặt các giá trị đầu vào
            ps.setString(1, store_name);
            ps.setString(2, address);
            ps.setString(3, timeOC);
            ps.setString(4, phoneNumber);
            ps.setInt(5, store_id);
            // Thực hiện truy vấn
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng PreparedStatement và Connection trong khối finally để đảm bảo giải phóng tài nguyên
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    // Xử lý lỗi đóng PreparedStatement
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    // Xử lý lỗi đóng Connection
                    Logger.getLogger(StoreDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}