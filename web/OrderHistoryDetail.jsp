<%-- 
    Document   : viewDetailOrder
    Created on : Oct 14, 2023, 1:24:49 PM
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dal.OrderDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="dal.DishDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td {
                padding: 10px; /* Adjust the value as needed */
            }
        </style>
        <style>
            tr {
                margin-bottom: 10px; /* Adjust the value as needed */
            }
            th {
                margin-bottom: 10px; /* Adjust the value as needed */
            }
            td
            {
                text-align: center;
            }
        </style>
    </head>

    <body>

        <h1>Order Detail</h1>
        <%
            Cookie[] cookies = request.getCookies();
            int customer_id = 0;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("customer_idd")) {
                        customer_id = Integer.parseInt(cookie.getValue());

                    }
                }
            }
            List<OrderDetail> listOrderDetail = (List) request.getAttribute("listDetail");

        %>

        <a href="OrderHistoryServlet?customer_id=<%=customer_id%>">Back</a> 

        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="orderDetail" items="${listDetail}">
                    <tr>
                        <td><img src="img/${orderDetail.getImage()}" alt="anh" width="100px" /></td>
                        <td>${orderDetail.getName()}</td>
                        <td>${orderDetail.getQuantity()}</td>
                        <td>${orderDetail.getPrice()}</td>
                        <td>${orderDetail.getProduct_id()}</td>



                    </tr>


                </c:forEach>
            </tbody>
        </table>

        <form action="CommentServlet" method="get">
            <input type="hidden" name="customer_id" id="customer_id" value="<%= customer_id%>">
            <c:forEach var="dish" items="${listDetail}">
                <input type="hidden" name="dish_id" value="${dish.getProduct_id()}">
            </c:forEach>


            <!-- Hiển thị ô để người dùng nhập bình luận -->
            <textarea id="comment_content" name="comment_content" rows="3" cols="40" placeholder="Bình luận..."></textarea>
            <button type="submit">Gửi</button>
        </form>

    </body>
</html>