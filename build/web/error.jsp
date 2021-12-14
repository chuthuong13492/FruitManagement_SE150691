<%-- 
    Document   : error
    Created on : Sep 28, 2021, 10:17:16 AM
    Author     : denwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Error: <%= session.getAttribute("ERROR_MESSAGE") %></h1>
    </body>
</html>
