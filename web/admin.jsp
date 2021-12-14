

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title> 
        <link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style3.css" rel="stylesheet" />
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='//fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>

    </head>    
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <div class="main">
            <h1>Hello Admin: <%= loginUser.getFullName()%></h1>	
            <form action="MainController">
                <div class="search-five">
                    <button  class="btn btn-outline-secondary" type="submit" name="action" value="Manage Product">
                        Manage Product
                    </button>
                </div>
            </form>
            <div class="search-five">
                <div>                   
                    <form class="blabla" action="MainController">
                        <input type="text" name="search" value="<%= search%>" onfocus="this.value = '';" onblur="if (this.value == '') {
                                    this.value = 'Ex. Enter User Name';
                                }" >
                        <input type="submit" name="action" value="Search">
                        <input type="submit" name="action" value="Logout"/>
                        <div class="clear"></div>
                    </form>             
                </div>              
            </div>	
        </div>
        <%
            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>FullName</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Role ID</th>
                                <th>Address</th>
                                <th>Password</th>
                                <th>Status</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (UserDTO user : list) {
                            %>
                        <form action="MainController">
                            <tr>
                                <th scope="row"><%= count++%></th>
                                <td><%= user.getUserID()%>                                  
                                </td>
                                <td>
                                    <input type="text" name="fullName" value="<%= user.getFullName()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="phone" value="<%= user.getPhone()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="email" value="<%= user.getEmail()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="roleID" value="<%= user.getRoleID()%>"/>
                                </td>
                                <td>
                                    <input type="text" name="address" value="<%= user.getAddress()%>"/>
                                </td>
                                <td><%= user.getPassword()%>
                                </td>
                                <td><a href="#" class="btn btn-success"><%= user.getStatusID()%></a></td>
                                <td>
                                    <a href="MainController?userID=<%= user.getUserID()%>&action=Delete&search=<%= search%>">Delete</a>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Update"/>
                                    <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                    <input type="hidden" name="search" value="<%= search%>"/>         
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
            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
            if (error_message == null) {
                error_message = "";
            }
        %>
        <h1> <%= error_message%> </h1>

        <%            }

        %>

        <script src="js/bootstrap3.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap2.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
