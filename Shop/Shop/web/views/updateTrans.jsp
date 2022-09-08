<%-- 
    Document   : updateTrans
    Created on : Jul 7, 2022, 8:04:16 PM
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

                    <c:set var="t" value="${sessionScope.curTrans}"/>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Content Row -->
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4" style="margin-top: 30px">Transaction Detail</h1>
                        </div>
                        <c:if test="${requestScope.updateSuccess!=null}" >
                            <h4 style="color: greenyellow; text-align: center">${requestScope.updateSuccess}</h4>
                        </c:if>

                        <c:forEach items="${sessionScope.curTrans.oList}" var="o">
                            <c:set var="p" value="${sessionScope.pdb.getProduct(o.pid)}"/>
                            <div class="row">
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                    <!-- Image -->
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                        <img src="<%=request.getContextPath()%>/images/p${p.id}.png" class="w-50"/>
                                        <a href="#!">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                        </a>
                                    </div>
                                    <!-- Image -->
                                </div>

                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <!-- Data -->
                                    ${p.name}

                                    <!-- Data -->
                                </div>

                                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                    <!-- Quantity -->

                                    <p class="text-start text-md-center">
                                        Quantity: ${o.quantity}
                                    </p>
                                    <!-- Quantity -->

                                    <!-- Price -->
                                    <p class="text-start text-md-center">
                                        Price: ${p.price}
                                    </p>
                                    <!-- Price -->
                                </div>
                            </div>
                            <hr class="my-4" />
                        </c:forEach>

                        <div class="row">

                            <div class="col-lg-12">
                                <div class="p-5">
                                    <c:set value="${sessionScope.userdb.getUser(t.userlogname)}" var="u" />
                                    <form class="user" action="<%=request.getContextPath()%>/updateTrans" method="post">
                                        <div class="form-group">
                                            <p>Transaction ID:</p> <input type="text" readonly="" class="form-control form-control-user" value="${t.id}">
                                        </div>
                                        <div class="form-group">
                                            <p>User Login Name:</p> <input type="text" readonly class="form-control form-control-user" value="${t.userlogname}">
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <p>Address: </p>
                                                <input type="text" readonly class="form-control form-control-user" value="${u.address}">
                                            </div>
                                            <div class="col-sm-4">
                                                <p>Phone: </p>
                                                <input type="text" readonly class="form-control form-control-user" value="${u.phone}" >
                                            </div>
                                            <div class="col-sm-4">
                                                <p>Note: </p>
                                                <input type="text" readonly class="form-control form-control-user" value="${t.note}" >
                                            </div>
                                        </div>
                                        <div class="form-group row form-control-user">
                                            <p>Status: </p>

                                            <select style="border-radius:10rem" class=" form-control" name="status">
                                                <c:forEach items="${sessionScope.stlist}" var="st">
                                                    <option value="${st.id}"
                                                            <c:if test="${t.status.equals(st.id)}">
                                                                selected
                                                            </c:if>
                                                            >${st.name}</option>
                                                </c:forEach>

                                            </select>


                                        </div>


                                        <div class="form-group">
                                            <p>Total: </p>
                                            <input type="text" readonly class="form-control form-control-user" value="${t.total}">
                                        </div>
                                        <input type="submit" value="Update" class="btn btn-dark btn-user btn-block" />

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
