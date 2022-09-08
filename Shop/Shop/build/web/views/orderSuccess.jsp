<%-- 
    Document   : orderSuccess
    Created on : Jul 7, 2022, 6:05:31 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ad-css/sb-admin-2.min.css">

    </head>
    <body id="page-top">
        <%@include file="header.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">



            <!-- Content Wrapper -->
            <div id="content-wrapper" class="bg-white" style="">
                <div class="text-center align-items-center" style="align-items: center">
                    <img src="<%=request.getContextPath()%>/images/success.jpg" width="200px" height="auto" alt="alt"/>
                    <h1 class="h4 text-gray-900 mb-4">Order Successfully! Please check your mail in 7 next day!</h1>
                    <button class="btn btn-light btn-user" style="width: 20%"><a style="color: black" href="<%=request.getContextPath()%>/views/home.jsp">Continue Shopping</a></button>
                </div>
            </div>
            <!-- End of Page Wrapper -->
    </body>
</html>

