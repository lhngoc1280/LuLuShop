<%-- 
    Document   : adminHeader
    Created on : Jun 27, 2022, 5:56:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <header class="header trans_300">

           

            <!-- Main Navigation -->

            <div class="main_nav_container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <div class="logo_container">
                                <a href="<%=request.getContextPath()%>/views/adminHome.jsp">lulu<span>shop</span></a>
                            </div>
                            <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li class="nav-item"><a href="<%=request.getContextPath()%>/views/adminHome.jsp">All product</a></li>
                                    
                                    <li class="nav-item"><a href="<%=request.getContextPath()%>/views/adminDashboard.jsp">dashboard</a></li>




                                </ul>
                                <ul class="navbar_user">
                                    <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                    <li><a href="<%=request.getContextPath()%>/views/adminDashboard.jsp"><i class="fa fa-user" aria-hidden="true"></i></a></li>

                                </ul>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </header>


    </body>
</html>
