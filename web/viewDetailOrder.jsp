<%-- 
    Document   : viewDetailOrder
    Created on : Oct 14, 2023, 1:24:49 PM
    Author     : Asus
--%>

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
        <a href="ShowConfirmOrder">Back</a>
        <table>
            <thead>
                <tr>

                    <th>Image</th>
                    <th>Name</th>


                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Confirm</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="orderDetail" items="${listDetail}">

                    <tr>

                        <td> <img src="img/${orderDetail.getImage()}" alt="anh" width="100px"/> </td>

                        <td> ${orderDetail.getName()}</td>
                        <td> ${orderDetail.getQuantity()}</td>
                        <td> ${orderDetail.getPrice()}</td>


                    </tr>
                </c:forEach>
                <% List<OrderDetail> list = (List) request.getAttribute("listDetail");
                    int order_id = list.get(0).getOrder_id();
                %>
                <% String role = String.valueOf(request.getAttribute("role"));%>

            <td>
                <form action="ConfirmOrderServlet" method="GET">
                    <input type="hidden" name="order_id" value="<%= order_id%>">
                    <button type="submit" name="viewButton" value="1">
                        Confirm
                    </button>
                </form>
            </td>
            <td>
                <form action="ConfirmOrderServlet" method="GET">
                    <input type="hidden" name="order_id" value="<%= order_id%>">
                    <button type="submit" name="viewButton" value="2">
                        Discard
                    </button>
                </form>
            </td>


        </td>
    </tbody>
</table>
</body>
</html>