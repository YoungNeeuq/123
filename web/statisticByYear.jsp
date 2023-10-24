<%-- 
    Document   : statisticByDate
    Created on : Oct 19, 2023, 12:24:46 AM
    Author     : Asus
--%>

<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>

    <body>
        <button> <a href="Statistic">Back</a> </button>
        <h1>Statistic by date</h1>
        <%
            List<Integer> listYear = (List) request.getAttribute("listYear");
            List<Order> listOrder = (List) request.getAttribute("listOrder");
            int sum = (int) request.getAttribute("sum");
             
        %>
        <form action="RevenueByDateMonthYear" method="Post">
            <label>Select date: </label>
            <select name="year">
                <c:forEach var="year" items="<%= listYear%>" >
                    <option value="${year}">${year}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="type" value="3" />
            <button type="submit">View</button>
        </form>
        <h2>Total revenue: <%= sum%></h2>
        <table>
            <thead>
                <tr>
                    <td>Order ID</td>
                    <td>Store ID</td>
                    <td>Customer ID</td>
                    <td>Total Price</td>
                    <td>Status</td>
                    <td>Date</td>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="order" items="<%= listOrder%>" >
                    <tr>
                        <td>${order.getOrder_id()}</td>
                        <td>${order.getStore_id()}</td>
                        <td>${order.getCustomer_id()}</td>
                        <td>${order.getTotalmoney()}</td>
                        <td>${order.getStatus()}</td>
                        <td>${order.getDate()}</td>
    
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <c:if test="${empty listOrder}">
            <p>No orders found.</p>
        </c:if>

    </body>
</html>
