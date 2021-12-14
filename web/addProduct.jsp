<%-- 
    Document   : addProduct
    Created on : Oct 20, 2021, 8:53:00 PM
    Author     : denwi
--%>
<%@page import="sample.shopping.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Page</title>
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
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError("", "", "", "", "", "", "");
            }
        %>
        <div class="header">          
            <div class="signin">
                <div class="container">
                    <div class="signin-main">
                        <h1>Add New Product</h1>                        
                        <h2>Informations</h2>
                        <form action="AddProductController" method="POST" enctype="multipart/form-data">
                            <input type="text" name="productID" required="" placeholder="Product ID"/>
                            <div class="error"><%= productError.getProductIDError()%></div>

                            <input type="text" name="productName" required=""  placeholder="Product Name"/>
                            <div class="error"><%= productError.getProductNameError()%></div>

                            <input type="number" name="productPrice" placeholder="Price" required="" />
                            <div class="error"><%= productError.getProductPriceError()%></div>

                            <input type="number" name="productQuantity" placeholder="Quantity" required="" min="1" value="1"/>
                            <div class="error"><%= productError.getProductQuantityError()%></div>

                            <input type="file" name="file" accept="image/*" id="file" onchange="loadFile(event)" />
                            <label for="file" style="cursor: pointer;">Upload Image: </label>
                            <img id="output" width="50" /><br>
                            <script>
                                var loadFile = function (event) {
                                    var image = document.getElementById('output');
                                    image.src = URL.createObjectURL(event.target.files[0]);
                                };
                            </script>

                            <input type="text" name="productCategory" placeholder="Product Cate" required=""/>

                            <input type="text" name="productDescription"  placeholder="Description"/>
                            <div class="error"><%= productError.getProductDescriptionError()%></div>

                            <input type="submit" name="action" value="Add New Product">

                        </form>                            
                    </div>
                </div>                           
            </div>
        </div>
    </body>
</html>
