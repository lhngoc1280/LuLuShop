<%-- 
    Document   : viewTrans
    Created on : Jul 7, 2022, 6:35:41 PM
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
                                        <h5 class="card-title m-b-0">All Transaction</h5>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th></th>
                                                    <th scope="col">User</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Phone</th>
                                                    <th scope="col">Total</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Note</th>
                                                    <th scope="col">Create At</th>
                                                    <th scope="col">ID</th>
                                                </tr>
                                            </thead>
                                            
                                            <tbody class="customtable">
                                                <c:forEach items="${sessionScope.trandb.transList}" var="t">
                                                    <c:set value="${sessionScope.userdb.getUser(t.userlogname)}" var="u" />
                                                    <tr style="color: black">
                                                        <th><a href="<%=request.getContextPath()%>/updateTrans?id=${t.id}" style="color: black">Detail</a></th>
                                                        <td>${t.userlogname}</td>
                                                        <td>${u.address}</td>
                                                        <td>${u.phone}</td>
                                                        <td>${t.total}</td>
                                                        <td>${t.getStatus(sessionScope.stlist)}</td>
                                                        <td>${t.note}</td> 
                                                        <td>${t.creatAt}</td> 
                                                        <td>${t.id}</td> 
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

