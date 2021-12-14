<%-- 
    Document   : viewCart
    Created on : Oct 7, 2021, 4:10:50 AM
    Author     : denwi
--%>

<%@page import="sample.order.OrderError"%>
<%@page import="sample.order.Order"%>
<%@page import="sample.order.OrderDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.shopping.FruitDTO"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <script src="js/jquery-1.11.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

        <link href='//fonts.googleapis.com/css?family=Hind:400,500,300,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='//fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <script src="js/simpleCart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null) {
                return;
            }
            OrderError error = (OrderError) request.getAttribute("CHECK_OUT_ERROR");
            if (error == null) {
                error = new OrderError();
            }
            Cart cart = (Cart) session.getAttribute("CART");
        %>
        <div class="header">
            <div class="container">
                <div class="header-main">
                    <div class="top-nav">
                        <div class="content white">
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <div class="navbar-brand logo">
                                        <a href="home.jsp"><img src="images/logo1.png" alt=""></a>
                                    </div>
                                </div>
                                <!--/.navbar-header-->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li><a href="home.jsp">Home</a></li>
                                        <li class="dropdown">
                                            <a href="product.jsp" class="" >Fruit Product</a>                                            
                                        </li>                                      
                                        <li><a href="contact.jsp">Contact</a></li>
                                    </ul>
                                </div>
                                <!--/.navbar-collapse-->
                            </nav>
                            <!--/.navbar-->
                        </div>
                    </div>

                    <div class="header-right">
                        <div class="search">
                            <form action="MainController">
                                <div class="search-text">

                                </div>
                                <div class="cart box_1">
                                    <a href="viewCart.jsp">
                                        <h3>

                                        </h3>
                                    </a>
                                </div> 
                            </form>
                            <div class="head-signin">

                            </div>              
                            <div class="clearfix"> </div>					
                        </div>
                    </div>
                    <div class="clearfix"> </div>

                </div>
            </div>
        </div> 
        <div class="container">
            <h1>Welcome user: <%= user.getFullName()%> </h1>    
            <form action="MainController">          
                <input class="btn btn-danger" type="submit" name="action" value="Logout"/>
            </form>
        </div>
        <%
            if (cart != null) {
        %>                                
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>ID</th>
                                    <th>FRUIT NAME</th>
                                    <th>IMAGE</th>
                                    <th>CATEGORY</th>
                                    <th>AMOUNT</th>
                                    <th>PRICE</th>
                                    <th>TOTAL</th>                                   
                                </tr>
                            </thead>
                            <tbody>    
                                <%
                                    int count = 1;
                                    String order = "";
                                    double total = 0;
                                    int totalAmount = 0;
                                    for (FruitDTO fruit : cart.getCart().values()) {
                                        total += fruit.getPrice() * fruit.getAmount();
                                        order += fruit.getProductID() + ":" + fruit.getAmount() + ". ";
                                        totalAmount += fruit.getAmount(); // for dẻ ở đây à, đâng
                                %>
                                <tr>
                                    <th scope="row"><%= count++%></th>
                                    <td>
                                        <input type="text" name="fruitID" value="<%= fruit.getProductID()%>" readonly=""/>
                                    </td>
                                    <td><%= fruit.getFruitName()%>                                 
                                    </td>
                                    <td>
                                        <image src="<%= fruit.getImage()%>" width="128px" height="128px" />
                                    </td>
                                    <td><%= fruit.getCategoryName()%></td>
                                    <td>
                                        <input type="number" name="amount" value="<%= fruit.getAmount()%>" required="" min="1"/>
                                    </td>
                                    <td><%= fruit.getPrice()%>$</td>
                                    <td><%= fruit.getAmount() * fruit.getPrice()%>$</td>
                                </tr>
                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </div>
                </div>                          
            </div>
            <h1>
                Total money: <%= total%>$
            </h1>
            <h1>
                Your Orders: <%= order%>   
            </h1> 

        </div>
        <%
            String message = (String) request.getAttribute("AMOUNT_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
        <div class="header">          
            <div class="signin">
                <div class="container">
                    <div class="signin-main">
                        <h1>Order Information</h1>
                        <h2>Informations</h2>
                        <form action="MainController" method="POST">
                            <input type="text" name="orderID" required="" placeholder="Order ID"/>
                            <div class="error"><%= error.getOrderIDError()%></div>

                            <input type="text" name="email" required=""  placeholder="Email"/>

                            <input type="text" name="address" placeholder="Address" required="" />

                            <input type="text" name="phone" placeholder="Phone" required="" /><br>

                            <input type="hidden" name="total" value="<%= total%>" readonly=""/><br>

                            <input type="submit" name="action" value="Check Out">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>                    
        <div class="footer">
            <div class="container">
                <div class="footer-main">
                    <div class="ftr-grids-block">
                        <div class="col-md-3 footer-grid">
                            <ul>
                                <li><a href="product.html">Fruit</a></li>
                                <li><a href="product.html">Rau</a></li>
                                <li><a href="product.html">Củ</a></li>
                                <li><a href="product.html">Quả</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 footer-grid">
                            <ul>
                                <li><a href="login.html">Your Account</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                                <li><a href="product.html">Store Locator</a></li>
                                <li><a href="pressroom.html">Press Room</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 footer-grid">
                            <ul>
                                <li><a href="terms.html">Website Terms</a></li>
                                <li><select class="country">
                                        <option value="select your location">Select Country</option>
                                        <option value="saab">Australia</option>
                                        <option value="fiat">Singapore</option>
                                        <option value="audi">London</option>
                                    </select>

                                </li>
                                <li><a href="shortcodes.html">Short Codes</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 footer-grid-icon">
                            <ul>
                                <li><a href="#"><span class="u-tub"> </span></a></li>
                                <li><a href="#"><span class="instro"> </span></a></li>
                                <li><a href="#"><span class="twitter"> </span></a></li>
                                <li><a href="#"><span class="fb"> </span></a></li>
                                <li><a href="#"><span class="print"> </span></a></li>
                            </ul>
                            <form>
                                <input class="email-ftr" type="text" value="Newsletter" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Newsletter';
                                        }">
                                <input type="submit" value="Submit"> 
                            </form>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="copy-rights">
                        <p>© 2021 FruitStore. All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </div>                    
    </body>

</html>
