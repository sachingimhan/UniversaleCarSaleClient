<%-- 
    Document   : logout
    Created on : Jan 28, 2023, 12:37:53 AM
    Author     : sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <% session.invalidate(); %>
        <% response.sendRedirect("/"); %>
    </body>
</html>
