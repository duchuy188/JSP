<%@page import="sample.product.Cart"%>
<%@page import="sample.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Page</title>
    </head>
    <body>
        <h1>My Duyen Official</h1>
        <%
            Cart cart =(Cart)session.getAttribute("CART");
            if(cart!=null){
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count =1;
                    double total =0;
                    for(Product product: cart.getCart().values()){
                            total += product.getPrice()*product.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%=count++%></td>
                    
                    <td><%=product.getId()%></td>
                     <input type="hidden" name="id" value="<%= product.getId()%>"/>       
                        
                    <td><%=product.getName()%></td>
                                     
                    <td><%=product.getPrice()%></td>
                    
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" min="1" required=""/>                       
                    </td>
                    
                    <td><%=product.getPrice()*product.getQuantity()%></td>
                    
                    <td>
                        <a href="MainController?action=Remove&id=<%= product.getId()%>">Remove</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                </tr>
                </form>
                <%
                    }
                %>

            </tbody>
        </table>
                <h1> Total: <%= total %>$</h1>

        <%
            }
        %>
        <a href="shopping.html">Add More</a>
    </body>
</html>