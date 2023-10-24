<%@page import="model.Customer"%>
<%@page import="dal.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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

    <head>
        <title>Order Tracking</title>
    </head>
    <body>
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
            CustomerDAO customerDAO = new CustomerDAO();
            Customer c = customerDAO.getCustomer(customer_id);
            String acc = c.getUsername();
        %>
        <a href="Profile?acc=<%=acc%>">Back</a> 


        <c:if test="${not empty listTracking}">
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Store ID</th>
                        <th>Order Date</th>                 
                        <th>Total price</th>
                        <th>Order Status</th>
                        <!-- Add more columns as needed -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${listTracking}">
                        <tr>
                            <td>${order.getOrder_id()}</td>
                            <td>${order.getStore_id()}</td>
                            <td>${order.getDate()}</td>
                            <td>${order.getTotalmoney()}</td>
                            <td>${order.getStatus()}</td>
                            <td>
                                <form action="ViewOrderTrackingDetail" method="GET">
                                    <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                                    <button type="submit" name="viewButton" value="view">
                                        View Detail Order
                                    </button>
                                </form>
                            </td>
                            <td>
                                <c:set var="status" value="${order.getStatus().trim()}"  />
                                <c:if test="${status ne 'succeed'}">

                                    <form action="CancelOrderServlet" method="GET">
                                        <input type="hidden" name="customer_id" id="customer_id" value="<%= customer_id%>">
                                        <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                                        <button type="submit" name="viewButton" value="view">
                                            Cancel Order
                                        </button>
                                    </form>


                                </c:if>
                            </td>


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty listTracking}">
            <p>No orders found.</p>
        </c:if>
    </body>
</html>