<%-- 
    Document   : addAdmin
    Created on : Jul 9, 2022, 6:44:03 AM
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
                                        <h1 class="h4 text-gray-900 mb-4">Add more Admin!</h1>
                                        <c:if test="${requestScope.addSuccess!=null}" >
                                            <p style="color: red">${requestScope.addSuccess}</p>
                                        </c:if>
                                    </div>
                                    <form class="user" action="<%=request.getContextPath()%>/addAdmin" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="name"
                                                   placeholder="Admin Name"required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="logname"
                                                   placeholder="Login Name"required>
                                        </div>
                                        <c:if test="${requestScope.LognameExisted!=null}" >
                                            <p style="color: red">${requestScope.LognameExisted}</p>
                                        </c:if>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"  name="email"
                                                   placeholder="Email"required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="address"
                                                   placeholder="Address"required>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="phone"
                                                   placeholder="Phone"required>
                                        </div>
                                        <c:if test="${requestScope.PassNotMatch!=null}" >
                                            <p style="color: red">${requestScope.PassNotMatch}</p>
                                        </c:if>
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <input type="password" class="form-control form-control-user"
                                                       placeholder="Password" name="pass1"required="">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="password" class="form-control form-control-user"
                                                       placeholder="Re-enter Password" name="pass2"required>
                                            </div>
                                        </div>
                                        
                                        <input type="submit" value="Add" class="btn btn-dark btn-user btn-block" />


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




            <!-- Bootstrap core JavaScript-->

            <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
            <script>
                var value;
                ClassicEditor
                        .create(document.querySelector('#editor'))
                        .then(editor => {
                            value = editor;
                        })
                        .catch(error => {
                            console.error(error);
                        });

                const handleSubmit = () => {
                    document.getElementById('a').innerHTML = value.getData()
                }
            </script>


    </body>
</html>
