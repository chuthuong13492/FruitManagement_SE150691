<%-- 
    Document   : createUser
    Created on : Sep 29, 2021, 8:33:38 PM
    Author     : denwi
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="js/jquery-1.11.0.min.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <link href='//fonts.googleapis.com/css?family=Hind:400,500,300,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError("","","","","","","","","");
            }
        %>
        <div class="header">          
            <div class="signin">
                <div class="container">
                    <div class="signin-main">
                        <h1>Sign up</h1>
                        <h2>Informations</h2>
                        <form action="MainController" method="POST">
                            <input type="text" name="userID" required="" placeholder="User ID"/>
                            <div class="error"><%= userError.getUserIDError()%></div>

                            <input type="text" name="fullName" required=""  placeholder="User Name"/>
                            <div class="error"><%= userError.getFullNameError()%></div>

                            <input type="text" name="phone" placeholder="Phone Number" required="" />
                            <div class="error"><%= userError.getPhoneError()%></div>
                            
                            <input type="text" name="email" placeholder="Email" required="" />
                            <div class="error"><%= userError.getEmailError()%></div>

                            <input type="text" name="address" placeholder="Address" required=""/>
                            <div class="error"><%= userError.getAddressError()%></div>

                            <input type="password" name="password" class="no-margin" placeholder="Password" required=""/>
                            <div class="error"><%= userError.getPasswordError()%></div>

                            <input type="password" name="confirm"  placeholder="Confirm Password" required=""/>
                            <div class="error"><%= userError.getConfirmPassError()%></div>

                            <input type="submit" name="action" value="Create">
                            
                            <input type="submit" name="action" value="Home">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
