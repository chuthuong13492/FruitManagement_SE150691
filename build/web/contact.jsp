<%@page import="sample.shopping.FruitDTO"%>
<%@page import="sample.shopping.Cart"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Contact</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Shoplist Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Hind:400,500,300,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
        <!-- start-smoth-scrolling -->
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
        <!-- //end-smoth-scrolling -->
        <script src="js/simpleCart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <!--header strat here-->
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
                                        <li><a href="contact.html">Contact</a></li>
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
        <!--header end here-->
        <!--contact start here-->
        <div class="contact">
            <div class="container">
                <div class="contact-main">
                    <div class="contact-top">
                        <h1>Contact Us</h1>
                    </div>
                    <div class="col-md-6 contact-left">
                        <h2>Information</h2>
                        <h4>Fruit Store</h4>
                        <p>Pls ,Contact us if you needed!</p>
                        <ul>
                            <li><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> </span>HCM City</li>
                            <li><span class="glyphicon glyphicon-phone" aria-hidden="true"> </span>+1284 485 978</li>			    	
                            <li><span class="glyphicon glyphicon-envelope" aria-hidden="true"> </span><a href="mailto:info@example.com">@example.com</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 contact-right">
                        <h3>Feedback</h3>
                        <form>
                            <input type="text" placeholder="Name" required="">
                            <input type="text" placeholder="Email" required="">
                            <textarea placeholder="Message" required=""></textarea>
                            <input type="submit" value="send">
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--contact end here-->
        <!--map start here-->
        <div class="map">
            <div class="container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d501725.3382528634!2d106.41503918888193!3d10.755341073779014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1633352412729!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
        <!--map end here-->
        <!--footer strat here-->
        <div class="footer">
            <div class="container">
                <div class="footer-main">
                    <div class="ftr-grids-block">
                        <div class="col-md-3 footer-grid">
                            <ul>
                                <li><a href="product.html">Fruit</a></li>
                                <li><a href="product.html">Rau</a></li>
                                <li><a href="product.html">C?</a></li>
                                <li><a href="product.html">Qu?</a></li>
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
        <!--footer end here-->
    </body>
</html>
