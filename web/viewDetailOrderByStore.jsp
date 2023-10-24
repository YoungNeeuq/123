<%-- 
    Document   : viewDetailOrder
    Created on : Oct 14, 2023, 1:24:49 PM
    Author     : Asus
--%>

<%@page import="model.Store"%>
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
        <%
            int store_id = (int) request.getAttribute("store_id");

        %>
        <h1>Order Detail</h1>
      
        <form action="StatisticByStore" method="GET">
            <input type="hidden" name="store_id" value="<%=store_id%>" />

            <button type="submit">Back</button>
        </form>

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
            </tbody>
        </table>
    </body>
</html>