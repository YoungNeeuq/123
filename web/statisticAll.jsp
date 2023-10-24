<%-- 
    Document   : statisticAll
    Created on : Oct 17, 2023, 5:11:44 PM
    Author     : Asus
--%>

<%@page import="model.Order"%>
<%@page import="model.Store"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic</title>
    </head>
    <body>
        <button>  <a href="ListProductServlet">Back</a> </button>
        <h1>Statistic</h1>
        <%
            int sum = (int) request.getAttribute("sum");
            List<Store> listStore = (List) request.getAttribute("storeList");
            List<Order> list = (List) request.getAttribute("list");
            int total = list.size();
        %>
        <h2>Revenue for all store: <%= sum%> VNÐ </h2>
        <h2>Total order for all store: <%= total%> orders </h2>
        <h2>Store</h2>
        <form action="RevenueByDateMonthYear" method="GET">
            <label>Statistic by date, month, year: </label>
            <select name="select">
                <option value="1">Date</option>
                <option value="2">Month</option>
                <option value="3">Year</option>
            </select>
            <button type="submit">View</button>
        </form>
        <c:forEach var="store" items="<%= listStore%>" >
            <div class="product col-md-3 mx-3 mb-4">


                <div class="product-name-price">
                    <h3 class="product-name">${store.getStore_name()}</h3>
                    <p class="product-price">${store.getAddress()}</p>
                </div>



                <div class="product-button d-flex justify-content-center">

                    <form action="StatisticByStore" method="GET">
                        <input type="hidden" name="store_id" value="${store.getStore_id()}">
                        <button class="product-delete btn btn-danger"> View detail</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </body>
</html>