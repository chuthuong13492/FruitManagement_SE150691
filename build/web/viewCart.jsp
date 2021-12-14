<%-- 
    Document   : viewCart
    Created on : Oct 7, 2021, 4:10:50 AM
    Author     : denwi
--%>

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
                            <div class="search-text"></div>
                            <div class="cart box_1">
                                <a href="viewCart.jsp">
                                    <h3>
                                        <img src="images/cart.png" alt=""/>

                                        <div class="total">
                                            <span>View Cart</span>
                                        </div>
                                    </h3>
                                </a>
                            </div> 
                            <div class="head-signin">
                                <h5><a href="login.jsp"><i class="hd-dign"></i>Sign in</a></h5>
                            </div>              
                            <div class="clearfix"> </div>					
                        </div>
                    </div>
                    <div class="clearfix"> </div>

                </div>
            </div>
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
                                    <th>REMOVE</th>
                                    <th>EDIT</th>
                                    <th>CHECK</th>
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
                                        totalAmount += fruit.getAmount();
                                %>
                            <form action="MainController">
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
                                    <td>
                                        <input class="btn btn-danger" type="submit" name="action" value="Remove"/>
                                    </td>
                                    <td>
                                        <input class="btn btn-info" type="submit" name="action" value="Edit"/>
                                    </td>
                                    <td>
                                        <form action="MainController">
                                            <input type="hidden" name="amount" value="<%= fruit.getAmount()%>"/>
                                            <input type="hidden" name="quantity" value="<%= fruit.getQuantity()%>"/>

                                            <input class="btn btn-default" type="submit" name="action" value="Check"/>
                                        </form>
                                    </td>
                                </tr>
                            </form>
                            <%
                                }
                            %>

                            </tbody>
                        </table>
                    </div>
                </div>                          
            </div>
            <h1>Total: <%=total%> $</h1>
            <h1>Your Orders: <%= order%>   </h1>
            <form action="MainController">
                <input class="btn btn-success" type="submit" name="action" value="Purchase"/>
            </form><br>
            <%
                }
            %>
            <%
                String message = (String) request.getAttribute("AMOUNT_MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>
        </div>  
        
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
