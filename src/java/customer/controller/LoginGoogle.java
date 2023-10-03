/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer.controller;

import admin.controller.addServlet;
import dal.CustomerDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.GooglePojo;
import model.GoogleUtils;

/**
 *
 * @author Asus
 */
public class LoginGoogle extends HttpServlet {
private static final long serialVersionUID = 1L;
  public LoginGoogle() {
    super();
  }
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
        String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = GoogleUtils.getToken(code);
      GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
      request.setAttribute("id", googlePojo.getId());
      request.setAttribute("name", googlePojo.getName());
      request.setAttribute("email", googlePojo.getEmail());
      request.setAttribute("verified_email", googlePojo.isVerified_email());
       
        RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
      dis.forward(request, response);
    }
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
            try {
               
                String verified_email = request.getParameter("verified_email");
                // Sử dụng giá trị verified_email theo cách bạn muốn ở đây
                if ("true".equals(verified_email)) {
                    // Xử lý khi verified_email là "true"
                       response.sendRedirect("ListProductCustomer");
                        request.setAttribute("acc","123");
                   
                } else {
                    request.setAttribute("tbsubmit", "tài khoan email khong hop le");
                    // Trả về trang login.jsp bằng cách chuyển hướng Servlet (phương thức GET)
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                 String username = request.getParameter("id");
                String password = "";
                String email = request.getParameter("email");
                String phoneNumber = "";
                String role = "c";
                
                try {
                    Customer customer = new Customer();
                    CustomerDAO customerDAO = new CustomerDAO();
                    if(customerDAO.getCustomerEmail(email) == null)
                    {
                         customerDAO.add(username,password,email,phoneNumber,role);
                      
                    } 

                } catch (Exception ex) {
                    response.sendRedirect("success.jsp");
                    Logger.getLogger(addServlet.class.getName()).log(Level.SEVERE, null,
                            ex);
                }
                
            } catch (Exception ex) {
             Logger.getLogger(LoginGoogle.class.getName()).log(Level.SEVERE, null, ex);
            }
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