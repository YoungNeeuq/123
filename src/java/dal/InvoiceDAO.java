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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Invoice;

/**
 *
 * @author Asus
 */
public class InvoiceDAO extends DBContext {

    private final DBContext db;

    public InvoiceDAO() throws Exception {
        db = new DBContext();
    }
//public void add(String nameOfDish, int numOfDish, String address, String store_phoneNumber, int invoice_price, int customer_id, 
//        int order_id, String email) {
//    Connection connection = null;
//    PreparedStatement ps = null;
//    
//    try {
//        String sql = "INSERT INTO Dish (name, infor, price, image, comment, typeOfDish) VALUES (?, ?, ?, ?, ?, ?)";
//        connection = db.getConnection();
//        ps = connection.prepareStatement(sql);
//        
//        // Kiểm tra và đặt các giá trị đầu vào
//        ps.setString(1, name);
//        ps.setString(2, infor);
//        ps.setInt(3, price);
//        ps.setString(4, image);
//        ps.setString(5, comment);
//        ps.setString(6, typeOfDish);
//        
//        // Thực hiện truy vấn
//        ps.executeUpdate();
//    } catch (SQLException ex) {
//        Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
//    } finally {
//        // Đóng PreparedStatement và Connection trong khối finally để đảm bảo giải phóng tài nguyên
//        if (ps != null) {
//            try {
//                ps.close();
//            } catch (SQLException ex) {
//                // Xử lý lỗi đóng PreparedStatement
//                Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        if (connection != null) {
//            try {
//                connection.close();
//            } catch (SQLException ex) {
//                // Xử lý lỗi đóng Connection
//                Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//    }
//}

//    public Invoice getInvoiceByOId(int order_id) {
//        Connection connection = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        Invoice invoice = null;
//
//        try {
//            String sql = "SELECT\n"
//                    + "    O.[order_id],\n"
//                    + "    O.[customer_id],\n"
//                    + "    O.[date],\n"
//                    + "    C.[nameOfDish],\n"
//                    + "    C.[numOfDish],\n"
//                    + "    C.[price],\n"
//                    + "    O.[total_price]\n"
//                    + "FROM [KFCStore].[dbo].[Order] AS O\n"
//                    + "INNER JOIN [KFCStore].[dbo].[OrderDetail] AS C\n"
//                    + "    ON O.[order_id] = C.[order_id]\n"
//                    + "WHERE O.[order_id] = ?";
//
//            connection = db.getConnection();
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, order_id);
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                invoice = new Invoice();
//                invoice.setInvoice_id(rs.getInt("order_id")); // Điều này có thể cần được điều chỉnh tùy theo cơ sở dữ liệu
//                invoice.setCustomer_id(rs.getInt("customer_id"));
//                invoice.setOrder_date(rs.getDate("date"));
//                invoice.setNameOfDish(rs.getString("nameOfDish"));
//                invoice.setNumOfDish(rs.getInt("numOfDish"));
//                invoice.setPrice(rs.getDouble("price"));
//                invoice.setTotalPrice(rs.getDouble("total_price"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DishDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            if (rs != null) {
//                try {
//                    rs.close();
//                } catch (SQLException e) {
//                    // Xử lý lỗi đóng ResultSet
//                }
//            }
//            if (ps != null) {
//                try {
//                    ps.close();
//                } catch (SQLException e) {
//                    // Xử lý lỗi đóng PreparedStatement
//                }
//            }
//            if (connection != null) {
//                try {
//                    connection.close();
//                } catch (SQLException e) {
//                    // Xử lý lỗi đóng Connection
//                }
//            }
//        }
//
//        return invoice;
//    }

}
