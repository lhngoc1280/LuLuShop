<%-- 
    Document   : chart
    Created on : Jul 10, 2022, 8:03:59 AM
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

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="adminSidebar.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div class="container-fluid" style="margin-top: 20px">


                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Daily Income</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                    <hr>
                                </div>
                            </div>


                        </div> 
                        <div class="col-xl-4 col-lg-5">
                            <div class="col-xl col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Tổng thu nhập </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.trandb.total}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Tổng lãi</div>
                                                    <c:set value="${sessionScope.pdb}" var="plist"/>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.trandb.total - sessionScope.trandb.getTotalEntry(plist)}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Thu nhập tháng này</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.trandb.totalMonthlyIncome()}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa fa-dollar-sign fa-2 text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- End of Content Wrapper -->

                    </div>

                    <div class="row">
                        <div class="col-xl col-lg-7">
                            <!-- Bar Chart -->
                            <div class="card shadow ">
                                <div class="card-header ">
                                    <h6 class="m-0 font-weight-bold text-primary">Monthly Income</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>

                                </div>
                            </div>
                        </div>
                    </div>    

                    <div class="row" style="margin-top: 20px">
                        <div class="col">
                            <c:set value="${sessionScope.trandb}" var="t"/>
                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Tình trạng đơn hàng</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Đặt hàng thành công <span
                                            class="float-right">${t.getTotalTran("st1")}</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${t.getPercentTran("st1")}%"
                                             id="l1"     aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Xác nhận đơn hàng <span
                                            class="float-right">${t.getTotalTran("st2")}</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: ${t.getPercentTran("st2")}%"
                                             id="l2"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Đang giao hàng <span
                                            class="float-right">${t.getTotalTran("st3")}</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: ${t.getPercentTran("st3")}%"
                                             id="l3" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Giao hàng thành công <span
                                            class="float-right">${t.getTotalTran("st4")}</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: ${t.getPercentTran("st4")}%"
                                             id="l4" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Tổng số đơn hàng <span
                                            class="float-right">${t.getTotalTran()}</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                             aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <!-- End of Page Wrapper -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <!-- Bootstrap core JavaScript-->
                    <script src="<%=request.getContextPath()%>/js/vendor/jquery/jquery.min.js"></script>
                    <script src="<%=request.getContextPath()%>/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                    <!-- Core plugin JavaScript-->
                    <script src="<%=request.getContextPath()%>/js/vendor/jquery-easing/jquery.easing.min.js"></script>

                    <!-- Custom scripts for all pages-->
                    <script src="<%=request.getContextPath()%>/js/admin/sb-admin-2.min.js"></script>

                    <!-- Page level plugins -->
                    <script src="<%=request.getContextPath()%>/js/vendor/chart.js/Chart.min.js"></script>

                    <!-- Page level custom scripts -->
                    <script src="<%=request.getContextPath()%>/js/admin/demo/chart-area-demo.js"></script>
                    <script src="<%=request.getContextPath()%>/js/admin/demo/chart-pie-demo.js"></script>
                    <!--<script src="<%=request.getContextPath()%>/js/admin/demo/chart-bar-demo.js"></script>-->
                    <script src="<%=request.getContextPath()%>/js/admin/demo/chart-bar-demo2.js"></script>

                    </body>
                    </html>
