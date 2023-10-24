
<%-- 
    Document   : confirmOrder
    Created on : Oct 12, 2023, 12:44:24 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <title>Confirm</title>
    <style>
        td {
            padding: 20px; /* Adjust the value as needed */
        }
    </style>
    <style>
        tr {
            margin-bottom: 20px; /* Adjust the value as needed */
        }
       
    </style>
    <body>
        <a href="ListProductServlet" > Back</a>
        <h1>Confirmed order list</h1>
        <div class="container">

            <%-- Sử dụng biểu thức EL để truy cập giá trị của Cookie --%>


            

 <table>
            <thead>
                <tr>
               
                    <th>Order ID</th>
                    <th>Store ID</th>
                    <th>Customer ID</th>                  
                     <th>Date</th>
                     <th>Status</th>
                      <th>Total price</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr> <!-- Thêm thẻ tr ở đây -->
                        <td> ${order.getOrder_id()}</td>
                        <td> ${order.getStore_id()}</td>
                        <td> ${ order.getCustomer_id()}</td>
                         <td> ${order.getDate()}</td>
                          <td> ${order.getStatus()}</td>
                        <td> ${order.getTotalmoney()}</td>
                        <td>
                            <form action="ViewDetailOrder" method="GET">
                                <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                                <button type="submit" name="viewButton" value="view">
                                    View Detail Order
                                </button>
                            </form>
                        </td>
                        <!-- Hiển thị thông tin khác về đơn hàng -->
                    </c:forEach>
            </tbody>
        </table>

        </div>
            
       
     


    </body>
</html>