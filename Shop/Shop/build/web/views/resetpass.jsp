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
                                <h1 class="h4 text-gray-900 mb-4">RESET PASSWORD</h1>
                            </div>
                            

                            <form class="user" action="<%=request.getContextPath()%>/forgotpass" method="post">
                                <div class="form-group">
                                    <label>Enter New Password: </label>
                                    <input type="password" class="form-control form-control-user"  name="newpass" required="" >
                                </div>
                                <div class="form-group">
                                    <label>Re-enter New Password: </label>
                                    <input type="password" class="form-control form-control-user"  name="re-enterpass" required="" >
                                </div>
                                <% if (request.getAttribute("Passnotmatch") != null){
                                %>
                                <h4 style="color: red"><%=request.getAttribute("Passnotmatch")%></h4>
                                <%
                                    }
                                %>
                                
                                <% if (request.getAttribute("resetPassSuccess") != null){
                                %>
                                <h4 style="color: red"><%=request.getAttribute("resetPassSuccess")%></h4>
                                <%
                                    }
                                %>
                                <input type="submit" value="Reset" class="btn btn-primary btn-user btn-block" />
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Page Wrapper -->


    </body>
</html>
