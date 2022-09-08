<%-- 
    Document   : viewUser
    Created on : Jul 8, 2022, 4:13:18 AM
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
    <body>
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
                    <div class="container">


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <h5 class="card-title m-b-0">All User</h5>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th></th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Logname</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Address</th>

                                                    <th scope="col">Active</th>

                                                </tr>
                                            </thead>

                                            <tbody class="customtable">
                                                <c:forEach items="${sessionScope.userdb.lognameList()}" var="logname">
                                                    <c:set value="${sessionScope.userdb.getUser(logname)}" var="u" />
                                                    <tr style="color: black">
                                                        <th>
                                                            <c:if test="${u.active}">
                                                                <a href="<%=request.getContextPath()%>/updateUser?active=0&logname=${logname}" style="color: red">Ban</a>
                                                            </c:if>
                                                            <c:if test="${!u.active}">
                                                                <a href="<%=request.getContextPath()%>/updateUser?active=1&logname=${logname}" style="color: greenyellow">Active</a>
                                                            </c:if>
                                                        </th>
                                                        <td>${u.name}</td>
                                                        <td>${logname}</td>
                                                        <td>${u.email}</td>
                                                        <td>${u.phone}</td>
                                                        <td>${u.address}</td>

                                                        <td>${u.active}</td> 

                                                    </tr>
                                                </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->
    </body>
</html>
