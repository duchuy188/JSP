<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Login User's Information:</h1>
        <% 
          UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        User ID: <%= loginUser.getUserID() %> <br/>
        Full Name: <%= loginUser.getFullName()%> <br/>
        Role ID: <%= loginUser.getRoleID()%> <br/>
        Password: <%= loginUser.getPassword() %> <br/>
    </body>
</html