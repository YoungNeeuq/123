<%-- 
    Document   : statisticByStore
    Created on : Oct 17, 2023, 5:46:51 PM
    Author     : Asus
--%>

<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Store"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic By Store</title>
    </head>

    <body>
        <button> <a href="Statistic">Back</a> </button>
        <%  int sum = (int) request.getAttribute("sumByStore");
            Store storee = (Store) request.getAttribute("storee");
            List<Order> listOrder = (List<Order>) request.getAttribute("listOrder");
          
            int total = listOrder.size();
            int store_id = (int) request.getAttribute("store_id");
        %>
        <h1><%= storee.getStore_name()%></h1>
        <h2>Revenue: <%= sum%> VNÐ</h2>
        <h2>Total order:  <%= total%> succeed orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Total money</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="<%= listOrder %>" >
                    <tr>
                        <td >${order.getOrder_id() }</td>
                        <td >${order.getTotalmoney()}</td>
                        <td >${order.getDate()}</td>
                        <td >${order.getStatus()}</td>
                          
                        <td>


                            <form action="ViewDetailOrder" method="Post">
                                 <input type="hidden" name="store_id" value="<%= store_id %>">

                                <input type="hidden" name="order_id" value="${order.getOrder_id()}">
                                <button class="product-delete btn btn-danger"> View detail</button>
                            </form>

                        </td>
                    </tr>

                </c:forEach>
            </tbody>

        </table>

    </body>
</html>