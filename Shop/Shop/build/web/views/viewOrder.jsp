<%-- 
    Document   : viewOrder
    Created on : Jul 7, 2022, 10:10:07 AM
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
            <div id="content-wrapper" class="d-flex flex-column">
                <h4 class="text-center" style="margin-top: 20px">All transaction: ${sessionScope.listOrder.size()}</h4>
                <c:forEach items="${sessionScope.listOrder}" var="o">
                    <div class="container ">
                        <div class="row d-flex justify-content-center my-4">
                            <div class="col-md-8">
                                <div class="card mb-4">
                                    <div class="card-header py-3">
                                        <h5 class="mb-0">Order - ${o.oList.size()} items</h5>
                                    </div>
                                    <div class="card-body">
                                        <!-- Single item -->

                                        <c:forEach items="${o.getListProductOrder(sessionScope.pdb)}" var="i">
                                            <div class="row" style="color: black">

                                                <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                    <!-- Data -->
                                                    ${i.name}
                                                    <!-- Data -->
                                                </div>

                                                <div class="col-lg-4 col-md-4 mb-4 mb-lg-0">

                                                    <strong>Price: ${i.price * (1 - i.discount/100)}</strong>
                                                    <!-- Price -->
                                                </div>
                                            </div>
                                            <!-- Single item -->

                                            <hr class="my-4" />
                                        </c:forEach>
                                        <div class="row" style="color: black; ">

                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <strong>Order Date:</strong> ${o.creatAt}
                                                <!-- Data -->
                                            </div>
                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <strong>Address:</strong> ${sessionScope.user.address}
                                                <!-- Data -->
                                            </div>
                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <strong>Phone:</strong> ${sessionScope.user.phone}
                                                <!-- Data -->
                                            </div>
                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <strong>Status:</strong> ${o.getStatus(sessionScope.stlist)}
                                                <!-- Data -->
                                            </div>
                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <strong>Note:</strong> ${o.note}
                                                <!-- Data -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />


                                        <div class="">
                                            <ul class="list-group list-group-flush">

                                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                    <div>
                                                        <strong>Total amount</strong>
                                                        <strong>
                                                            <p class="mb-0">(including VAT)</p>
                                                        </strong>
                                                    </div>

                                                    <span><strong>${o.total}</strong></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>
    </body>
</html>
