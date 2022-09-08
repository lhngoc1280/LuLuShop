<%-- 
    Document   : header
    Created on : Jun 21, 2022, 9:13:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header2.css">
        <title>JSP Page</title>
    </head>
    <body>


        <!-- Header -->

        <header class="header trans_300" style="top: 0px">

            

            <div class="main_nav_container" >
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <div class="logo_container">
                                <a href="<%=request.getContextPath()%>/views/home.jsp">lulu<span>shop</span></a>
                            </div>
                            <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li class="nav-item"><a href="#">new</a></li>

                                    <li class="nav-item dropdown">
                                        <div class="dropdown show">
                                            <a class=" dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                best seller
                                            </a>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </li>

                                    
                                    <li><a href="<%=request.getContextPath()%>/cate?id=1">category</a></li>
                                    
                                    <li><a href="#">sale</a></li>
                                    <li><a href="contact.jsp">contact</a></li>
                                </ul>
                                <ul class="navbar_user">
                                    <li><a href="<%=request.getContextPath()%>/search"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                    <li><a href="<%=request.getContextPath()%>/user"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                    <li class="checkout">
                                        <a href="<%=request.getContextPath()%>/views/cart.jsp">
                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            <span id="checkout_items" class="checkout_items">${sessionScope.cartsize}</span>
                                        </a>
                                    </li>
                                </ul>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </header>



    </body>
</html>
