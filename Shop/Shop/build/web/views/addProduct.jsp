<%-- 
    Document   : addProduct.jsp
    Created on : Jun 26, 2022, 8:40:40 PM
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
                                        <h1 class="h4 text-gray-900 mb-4">Add more product!</h1>
                                        <c:if test="${requestScope.addSuccess!=null}" >
                                            <h4 style="color: red">${requestScope.addSuccess}</h4>
                                        </c:if>
                                    </div>
                                    <form class="user" action="<%=request.getContextPath()%>/addproduct" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="pname"
                                                   placeholder="Product name"required>
                                        </div>
                                        <div class="form-group row form-control-user">
                                            <p>Category: </p>

                                            <select style="border-radius:10rem" class=" form-control" name="cate">
                                                <c:forEach items="${sessionScope.clist}" var="cate">
                                                    <c:if test="${cate.parent_id!=0}">
                                                        <option value="${cate.id}">${cate.name}</option>
                                                    </c:if>

                                                </c:forEach>
                                            </select>


                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <input type="text" class="form-control form-control-user"
                                                       placeholder="Entry Price" name="eprice"required="">
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control form-control-user"
                                                       placeholder="Price" name="price"required>
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control form-control-user"
                                                       placeholder="Discount" name="dis"required>
                                            </div>
                                        </div>


                                        <div class="form-group row flex-column">
                                            <textarea class=""  name="editor" id="editor" cols="75" rows="10" placeholder="Type your content" required>
                                            </textarea>
                                        </div>

                                        <!--upload img-->

                                        <div class="form-group row">
                                            <input type="file" id="img" name="img"  multiple="">
                                        </div>

                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" name="quantity"
                                                   placeholder="Số Lượng">
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
