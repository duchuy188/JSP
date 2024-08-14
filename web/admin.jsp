<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome: <h1> <%= loginUser.getFullName()%> </h1>
        <a href="MainController?action=Logout">Logout</a>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search: <input type="text" name="search" placeholder="Search" value="<%= search%>" required=""/>
            <input type="submit" name="action" value="Search"/>
        </form>

        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td> <%= user.getUserID() %></td>
                    <td>
                        <input type="text" name="fullName" value ="<%=user.getFullName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value ="<%=user.getRoleID()%>" required=""/>
                    </td>
                    <td><%= user.getPassword()%></td>                   
                    <!--delete ở đây nè-->
                    <td>
                        <a href="MainController?action=Delete&userID=<%= user.getUserID()%>&search=<%= search%>">Delete</a>   
                    </td>
                    <!--update ở đây nè-->
                    <td>
                        <input type="submit" name="action" value ="Update"/>
                        <input type="hidden" name="userID" value ="<%=user.getUserID()%>" readonly=""/>
                        <input type="hidden" name="search" value ="<%=search%>"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <%= error%>
    <%
            }
        }
    %>
</body>
</html>