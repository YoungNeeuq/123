<%-- 
    Document   : orderHistory
    Created on : Oct 17, 2023, 9:49:27 PM
    Author     : Asus
--%>

<%@page import="model.Customer"%>
<%@page import="dal.CustomerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            Customer customer = customerDAO.getCustomer(customer_id);
            String acc = customer.getUsername();
        %>
        <a href="Profile?acc=<%=acc%>">Back</a> 
        
        <form action="OrderHistoryByDMY" method="GET">
            <label>Statistic by date, month, year: </label>
            <select name="select">
                <option value="1">Date</option>
                <option value="2">Month</option>
                <option value="3">Year</option>
            </select>
            <input type="hidden" name="customer_id" id="customer_id" value="<%= customer_id%>">
            <button type="submit">View</button>
        </form>
        <h1>Order History</h1>
        <%
            List<Order> list = (List) request.getAttribute("list");
            int total = list.size();
        %>
        <h2>Numbers of order: <%= total%>  </h2>
        <table>
            <thead>
                <tr>
                    <td>Order ID</td>
                    <td>Store ID</td>
                    <td>Total price</td>
                    <td>Date</td>
                    <td>Status</td>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="<%= list%>">
                    <tr>
                        <td> ${order.getOrder_id()}</td>
                        <td> ${order.getStore_id()}</td>
                        <td> ${order.getTotalmoney()}</td>
                        <td> ${order.getDate()}</td>
                        <td> ${order.getStatus()}</td>
                        <td>
                            <form action="ViewOrderHistoryDetail" method="GET">
                                <input type="hidden" name="order_id" value="${order.getOrder_id()}"/>
                                <button type="submit" > View Detail </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>