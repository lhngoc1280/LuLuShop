<%-- 
    Document   : viewAdmin
    Created on : Jul 8, 2022, 5:59:27 PM
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
        <style>
            #content-wrapper{
                min-height: 500px;
            }
        </style>
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
                                        <h5 class="card-title m-b-0">All Admin</h5>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th></th>
                                                    <th scope="col">roleID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Logname</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Active</th>

                                                </tr>
                                            </thead>

                                            <tbody class="customtable">
                                                <c:forEach items="${sessionScope.admindb.lognameList()}" var="logname">
                                                    <c:set value="${sessionScope.admindb.getAdmin(logname)}" var="a" />
                                                    <c:if test="${a.roleID!=1}">
                                                        <tr style="color: black">
                                                            <th>
                                                                <c:if test="${a.active}">
                                                                    <a href="<%=request.getContextPath()%>/updateAdmin?active=0&logname=${logname}" style="color: red">Ban</a>
                                                                </c:if>
                                                                <c:if test="${!a.active}">
                                                                    <a href="<%=request.getContextPath()%>/updateAdmin?active=1&logname=${logname}" style="color: greenyellow">Active</a>
                                                                </c:if>
                                                            </th>
                                                            <td>${a.roleID}</td>
                                                            <td>${a.name}</td>
                                                            <td>${logname}</td>
                                                            <td>${a.email}</td>
                                                            <td>${a.phone}</td>
                                                            <td>${a.address}</td>
                                                            <td>${a.active}</td> 

                                                        </tr>
                                                    </c:if>

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
