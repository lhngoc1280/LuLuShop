<%-- 
    Document   : adminDashboard
    Created on : Jun 26, 2022, 3:42:05 AM
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
        <!-- Custom styles for this template-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ad-css/sb-admin-2.min.css">
        
    </head>
    <body id="page-top">
        <%@include file="adminHeader.jsp" %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="adminSidebar.jsp" %>
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
                                        <h1 class="h4 text-gray-900 mb-4">Your information!</h1>
                                        <c:if test="${requestScope.updateSuccess!=null}" >
                                            <h4 style="color: red">${requestScope.updateSuccess}</h4>
                                        </c:if>
                                    </div>
                                    <form class="user" action="<%=request.getContextPath()%>/admin" method="post">
                                        <div class="form-group">
                                            <label>Admin Name: </label>
                                            <input type="text" class="form-control form-control-user"  name="adName"
                                                   value="${sessionScope.admin.name}">
                                        </div>
                                        <div class="form-group">
                                            <label>Login Name: </label>
                                            <input type="text" class="form-control form-control-user"  name="logname"
                                                   value="${sessionScope.logname}">

                                            <c:if test="${requestScope.lognameError!=null}" >
                                                <p style="color: red">${requestScope.lognameError}</p>
                                            </c:if>
                                        </div>
                                        <div class="form-group row">

                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <label >Email: </label>
                                                <input type="email" class="form-control form-control-user"  name="email"
                                                       value="${sessionScope.admin.email}">

                                            </div>
                                            <div class="col-sm-6">
                                                <label >Phone: </label>
                                                <input type="text" class="form-control form-control-user"  name="phone"
                                                       value="${sessionScope.admin.phone}">
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label>Address: </label>
                                            <input type="text" class="form-control form-control-user"  name="add"
                                                   value="${sessionScope.admin.address}">
                                        </div>

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

