<%-- 
    Document   : login
    Created on : Jun 21, 2022, 8:46:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/loginStyle.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header2.css">
        

    </head>
    <body>



        <div class="container">
            
                <header class="header trans_300" style="top: 0px">

            

            <div class="main_nav_container" >
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <div class="logo_container">
                                <a href="<%=request.getContextPath()%>/views/home.jsp">lulu<span>shop</span></a>
                            </div>
                            <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li class="nav-item"><a href="#">new</a></li>

                                    <li class="nav-item dropdown">
                                        <div class="dropdown show">
                                            <a class=" dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                best seller
                                            </a>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </li>

                                    
                                    <li><a href="<%=request.getContextPath()%>/cate">category</a></li>
                                    
                                    <li><a href="#">sale</a></li>
                                    <li><a href="contact.jsp">contact</a></li>
                                </ul>
                                

                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </header>

           
            <div class="row d-flex justify-content-center mt-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card py-3 px-2">
                        <div class="division">
                            <div class="row">
                                <div class="col-3"><div class="line l"></div></div>
                                <div class="col-6"><span>ĐĂNG NHẬP</span></div>
                                <div class="col-3"><div class="line r"></div></div>
                            </div>
                        </div>
                        <form class="myform" method="post" action="<%=request.getContextPath()%>/login">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="User name" name="name">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password" name="pass">
                            </div>
                            <c:if test="${requestScope.LoginError!=null}">
                                <p style="color: red">${requestScope.LoginError}</p>
                            </c:if>
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Ghi nhớ mật khẩu</label>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12 bn"><a href="<%=request.getContextPath()%>/views/forgotpass.jsp">Quên mật khẩu</a></div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="btn btn-block btn-primary btn-lg"><small>Đăng nhập</small></button>
                            </div>
                            <p>Chưa có tài khoản? <a href="<%=request.getContextPath()%>/signup">Đăng kí tại đây</a></p>
                        </form>
                    </div>
                </div>
            </div>
                            
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
