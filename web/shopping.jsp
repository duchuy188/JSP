<%-- 
    Document   : shopping
    Created on : Jun 15, 2024, 10:17:27 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <div>Welcome to my Official Product</div>
        <form action="MainController" method="POST">
            Choose your product:
            <select name="cmbProduct">
                <option value="P01-Black Pencil-5">Black Pencil-5$</option>
                <option value="P02-English Book-10">English Book-10$</option>
                <option value="P03-Note Book-7">Note Book-7$</option>
                <option value="P04-Sky Ruler-3">Sky Ruler-3$</option>
            </select>
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="50">50</option>
            </select>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="View"/>
        </form>
        <%
            String message=(String) request.getAttribute("MESSAGE");
            if(message==null){
             message="";
            }
        %>
        <%= message %>
    </body>
</html>
