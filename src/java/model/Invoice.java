package model;
import com.entity.CartItem;
import java.util.Date;
import java.util.List;

public class Invoice {

    private int order_id;
    private int customer_id;
    private Date date;
   private List<CartItem> cartItems;
    private double total_price;
    private String status;

    public Invoice(int order_id, int customer_id, Date date, List<CartItem> cartItems, double total_price, String status) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.date = date;
        this.cartItems = cartItems;
        this.total_price = total_price;
        this.status = status;
    }

    public Invoice() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Invoice{" + "order_id=" + order_id + ", customer_id=" + customer_id + ", date=" + date + ", cartItems=" + cartItems + ", total_price=" + total_price + ", status=" + status + '}';
    }

   
}
