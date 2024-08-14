<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1> Login information: </h1>
        <form action="MainController" method="Post">
            User ID:<input type="text" name="userID" /></br>
            Password:<input type="password" name="password" /></br>
            <input type="submit" name="action" value="Login" />
            <input type="reset" value="Reset" />    

        </form>
        <%
            String error=(String) request.getAttribute("ERROR");
            if (error == null) error="";
        %>
        <%= error %>
        <a href="create.jsp">Create new user</a>
       
    </body>
</html>