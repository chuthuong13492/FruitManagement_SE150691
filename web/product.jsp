<%-- 
    Document   : product
    Created on : Oct 5, 2021, 10:08:37 AM
    Author     : denwi
--%>

<%@page import="sample.shopping.FruitDAO"%>
<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.FruitDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
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
            String search = (String) request.getParameter("searchV2");
            if (search == null) {
                search = "";
            }
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
                                    <input class="serch" type="text" name="searchV2" value="<%= search%>" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Search';
                                            }"/>

                                    <input class="btn btn-default" type="submit" name="action" value="SearchFruit"/> 
                                </div>
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
                            </form>
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
            FruitDAO dao = new FruitDAO();
            List<FruitDTO> listAll = dao.getAll();
            List<FruitDTO> list = (List<FruitDTO>) request.getAttribute("LIST_FRUIT");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>FRUIT NAME</th>
                                    <th>IMAGE</th>
                                    <th>DESCRIPTION</th>
                                    <th>PRICE</th>
                                    <th>ON SALE</th>
                                    <th>CATEGORY</th>
                                    <th>QUANTITY</th>
                                    <th>BUY</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <%
                                    int count = 1;
                                    for (FruitDTO fruit : list) {
                                %>
                            <form action="MainController">
                                <tr>
                                    <th scope="row"><%= count++%></th>
                                    <td><%= fruit.getFruitName()%>                                 
                                    </td>
                                    <td>
                                        <image src="<%= fruit.getImage()%>" width="128px" height="128px" />
                                    </td>
                                    <td><%= fruit.getDescription()%></td>
                                    <td><%= fruit.getPrice()%>$</td>
                                    <td><%= fruit.getQuantity()%></td>
                                    <td><%= fruit.getCategoryName()%></td>
                                    <td><input type="number" min="1" name="amount" value="1"/></td>
                                    <td>
                                        <input type="hidden" name="productID" value="<%= fruit.getProductID()%>"/>
                                        <input type="hidden" name="fruitName" value="<%= fruit.getFruitName()%>"/>
                                        <input type="hidden" name="image" value="<%= fruit.getImage()%>" width="128px" height="128px"/>
                                        <input type="hidden" name="categoryName" value="<%= fruit.getCategoryName()%>"/>
                                        <input type="hidden" name="price" value="<%= fruit.getPrice()%>"/>
                                        <input type="hidden" name="quantity" value="<%= fruit.getQuantity()%>"/>
                                        <input class="btn btn-success" type="submit" name="action" value="Add to cart"/>
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
        </div>
        <%
            }
        %>
        <%
        } else {
        %>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>FRUIT NAME</th>
                                    <th>IMAGE</th>
                                    <th>DESCRIPTION</th>
                                    <th>PRICE</th>
                                    <th>ON SALE</th>
                                    <th>CATEGORY</th>
                                    <th>QUANTITY</th>
                                    <th>BUY</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <%
                                    int count1 = 1;
                                    for (FruitDTO fruit2 : listAll) {
                                %>
                            <form action="MainController">
                                <tr>
                                    <th scope="row"><%= count1++%></th>
                                    <td><%= fruit2.getFruitName()%>                                 
                                    </td>
                                    <td>
                                        <image src="<%= fruit2.getImage()%>" width="128px" height="128px" />
                                    </td>
                                    <td><%= fruit2.getDescription()%></td>
                                    <td><%= fruit2.getPrice()%>$</td>
                                    <td><%= fruit2.getQuantity()%></td>
                                    <td><%= fruit2.getCategoryName()%></td>
                                    <td><input type="number" min="1" name="amount" value="1"/></td>
                                    <td>
                                        <input type="hidden" name="productID" value="<%= fruit2.getProductID()%>"/>
                                        <input type="hidden" name="fruitName" value="<%= fruit2.getFruitName()%>"/>
                                        <input type="hidden" name="image" value="<%= fruit2.getImage()%>" width="128px" height="128px"/>
                                        <input type="hidden" name="categoryName" value="<%= fruit2.getCategoryName()%>"/>
                                        <input type="hidden" name="price" value="<%= fruit2.getPrice()%>"/>
                                        <input type="hidden" name="quantity" value="<%= fruit2.getQuantity()%>"/>
                                        <input class="btn btn-success" type="submit" name="action" value="Add to cart"/>
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
            <%
                }
            %>
            <%
                String message = (String) request.getAttribute("SHOPPING_MESSAGE");
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
