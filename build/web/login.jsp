<%-- 
    Document   : login
    Created on : Sep 28, 2021, 4:58:37 PM
    Author     : denwi
--%>

<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.FruitDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link href='//fonts.googleapis.com/css?family=Hind:400,500,300,600,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
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
        <div class="login">
            <div class="container">
                <div class="login-main">
                    <h1>Login</h1>
                    <div class="col-md-6 login-left">
                        <h2>Existing User</h2>
                        <form action="MainController" method="POST" >
                            <input type="text" name="userID" placeholder="Username" />
                            <input type="password" name="password" placeholder="Password" />
                            <input type="submit" name="action" value="Login"/>
                        </form>

                        <%
                            String error = (String) request.getAttribute("ERROR_MESSAGE");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <h2><%= error%></h2>
                        <script>
                            function statusChangeCallback(response) {
                                if (response.status === 'connected') {
                                    const formEle = document.createElement("form");
                                    formEle.setAttribute("method", "POST");
                                    formEle.setAttribute("action", "MainController");
                                    const inputTokenEle = document.createElement('input')
                                    inputTokenEle.setAttribute("type", 'text')
                                    inputTokenEle.setAttribute("name", 'token')
                                    inputTokenEle.setAttribute("value", response.authResponse.accessToken)
                                    const submitBtnEle = document.createElement("input");
                                    submitBtnEle.setAttribute("id", "submit_btn")
                                    submitBtnEle.setAttribute("type", "submit");
                                    submitBtnEle.setAttribute("name", "action")
                                    submitBtnEle.setAttribute("value", "FB");
                                    formEle.appendChild(inputTokenEle)
                                    formEle.appendChild(submitBtnEle);
                                    document.body.appendChild(formEle)
                                    const submitBtn = document.querySelector('#submit_btn');
                                    submitBtn.click()
                                    document.body.removeChild(formEle);
                                }
                            }
                            function checkLoginState() {
                                FB.getLoginStatus(function (response) {
                                    statusChangeCallback(response);
                                });
                            }
                            window.fbAsyncInit = function () {
                                FB.init({
                                    appId: '305543917680006',
                                    cookie: true, // enable cookies to allow the server to access 
                                    // the session
                                    xfbml: true, // parse social plugins on this page
                                    version: 'v2.2' // use version 2.2
                                });

                                FB.getLoginStatus(function (response) {
                                    statusChangeCallback(response);
                                });
                            };
                            // Load the SDK asynchronously
                            (function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id))
                                    return;
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "//connect.facebook.net/en_US/sdk.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));
                        </script>
                        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                        </fb:login-button>

                    </div>

                    <div class="col-md-6 login-right">
                        <h3>New User? Create an Account</h3>
                        <p>Dont have the account?Please, make one!</p>
                        <a href="createUser.jsp" class="login-btn">Create an Account </a>
                    </div>
                    <div class="clearfix"> </div>                   
                </div>
            </div>
        </div>

        <div>
            <br>
            <br>
            <br>
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

