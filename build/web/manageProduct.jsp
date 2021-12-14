<%-- 
    Document   : manageProduct
    Created on : Oct 19, 2021, 2:45:32 PM
    Author     : denwi
--%>

<%@page import="java.util.List"%>
<%@page import="sample.shopping.FruitDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style3.css" rel="stylesheet" />
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='//fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%
            String search = (String) request.getParameter("searchV3");
            if (search == null) {
                search = "";
            }
        %>
        <div class="main">
            <h1>MANAGE PRODUCT</h1>	
            <form action="MainController">
                <div class="search-five">
                    <button  class="btn btn-outline-secondary" type="submit" name="action" value="Add Product">
                        Add Product
                    </button>
                </div>
            </form>
            <div class="search-five">
                <div>                   
                    <form class="blabla" action="MainController">
                        <input type="text" name="searchV3" value="<%= search%>" onfocus="this.value = '';" onblur="if (this.value == '') {
                                    this.value = 'Ex. Enter Product Name';
                                }" >
                        <input type="submit" name="action" value="Search Product">
                        <input type="submit" name="action" value="Back to Admin">                        
                        <div class="clear"></div>
                    </form>                    
                </div>              
            </div>	
        </div>
        <%
            List<FruitDTO> list = (List<FruitDTO>) request.getAttribute("LIST_FRUIT");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>FRUIT ID</th>
                                <th>FRUIT NAME</th>
                                <th>IMAGE</th>
                                <th>DESCRIPTION</th>
                                <th>PRICE</th>
                                <th>QUANTITY</th>
                                <th>CATEGORY</th>
                                <th>STATUS</th>
                                <th>EDIT</th>
                                <th>DELETE</th>
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
                                <td>  
                                    <%= fruit.getProductID()%>
                                </td>
                                <td>
                                    <input type="text" name="productName" value="<%= fruit.getFruitName()%>"/>
                                </td>
                                <td>
                                    <image src="<%= fruit.getImage()%>" width="128px" height="128px" />
                                </td>
                                <td>
                                    <input type="text" name="description" value="<%= fruit.getDescription()%>"/>
                                </td>
                                <td>
                                    <input type="number" min="1" name="productPrice" value="<%= fruit.getPrice()%>"/>$
                                </td>
                                <td>
                                    <input type="number" min="1" name="quantity" value="<%= fruit.getQuantity()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="categoryID" value="<%= fruit.getCategoryID()%>"/>
                                </td>
                                <td>
                                    <input type="number" name="statusID" min="0" max="1" value="<%= fruit.getStatus()%>"/>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Edit Fruit"/>
                                    <input type="hidden" name="productID" value="<%= fruit.getProductID()%>"/>
                                    <input type="hidden" name="search" value="<%= search%>"/>
                                </td>
                                <td>
                                    <a href="MainController?productID=<%= fruit.getProductID()%>&action=Del&search=<%= search%>">Delete</a>
                                </td>                               
                            </tr>
                        </form>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>
    </body>
</html>
