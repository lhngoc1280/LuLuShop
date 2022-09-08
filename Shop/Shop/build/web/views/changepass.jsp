<%-- 
    Document   : changepass
    Created on : Jul 6, 2022, 10:49:56 AM
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
            <!-- Sidebar -->
            <%@include file="userSidebar.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Content Row -->
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Change Your Password!</h1>
                                        <c:if test="${requestScope.ChangePassSuccess!=null}" >
                                            <p style="color: green">${requestScope.ChangePassSuccess}</p>
                                        </c:if>
                                    </div>
                                    <form class="user" action="<%=request.getContextPath()%>/changepass" method="post">
                                        <div class="form-group">
                                            <label>Old Password: </label>
                                            <input type="password" class="form-control form-control-user"  name="oldpass">
                                        </div>
                                        <c:if test="${requestScope.WrongPass!=null}" >
                                            <p style="color: red">${requestScope.WrongPass}</p>
                                        </c:if>
                                        <div class="form-group">
                                            <label>New Password: </label>
                                            <input type="password" class="form-control form-control-user"  name="newpass1">
                                        </div>
                                        <div class="form-group">
                                            <label>Re-enter Password: </label>
                                            <input type="password" class="form-control form-control-user"  name="newpass2">
                                        </div>
                                        <c:if test="${requestScope.PassNotMatch!=null}" >
                                            <p style="color: red">${requestScope.PassNotMatch}</p>
                                        </c:if>
                                        <input type="submit" value="Change" class="btn btn-dark btn-user btn-block" />
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->
    </body>
</html>

