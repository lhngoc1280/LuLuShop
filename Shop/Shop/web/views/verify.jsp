<%-- 
    Document   : verify
    Created on : Jun 28, 2022, 9:49:28 AM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <!-- Custom styles for this template-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ad-css/sb-admin-2.min.css">
        <style>
            #wrapper{
                margin-top: 100px;
            }
        </style>
    </head>
    <body id="page-top">
        <%@include file="header.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Content Row -->
                <div class="row">

                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">VERIFY YOUR EMAIL</h1>
                            </div>
                            <p>1 mã xác thực đã được gửi về email của bạn. Kiểm tra hòm thư và nhập mã xuống dưới đây</p>

                            <form class="user" action="<%=request.getContextPath()%>/verify" method="post">
                                <div class="form-group">
                                    <label>Mã xác thực: </label>
                                    <input type="text" class="form-control form-control-user"  name="code" >
                                </div>
                                <% if (request.getAttribute("WrongCode") != null){
                                %>
                                <h4 style="color: red"><%=request.getAttribute("WrongCode")%></h4>
                                <%
                                    }
                                %>
                                <input type="submit" value="Verify" class="btn btn-primary btn-user btn-block" />
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Page Wrapper -->


    </body>
</html>
