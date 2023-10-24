<%-- 
    Document   : addcomment
    Created on : Oct 24, 2023, 12:13:13 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>New comment</h1>
        <form action="CommentServlet" method="GET">
            <input type="text" name="dish_id" value ="27"/>
            <input type="text" name="customer_id" value ="15"/>
            <input type="text" name="comment_content" value ="15"/>
            <button type="submit">comment</button>
        </form>
    </body>
</html>
