<%-- 
    Document   : signup
    Created on : Jun 21, 2022, 9:07:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/animate.css">
        <style>

            .border-md {
                border-width: 2px;
                
            }
            .btn-facebook {
                background: #405D9D;
                border: none;
            }

            .btn-facebook:hover, .btn-facebook:focus {
                background: #314879;
            }

            .btn-twitter {
                background: #42AEEC;
                border: none;
            }

            .btn-twitter:hover, .btn-twitter:focus {
                background: #1799e4;
            }

            body {
                min-height: 100vh;
            }

            .form-control:not(select) {
                padding: 1.5rem 0.5rem;
            }

            select.form-control {
                height: 52px;
                padding-left: 0.5rem;
            }

            .form-control::placeholder {
                color: #ccc;
                font-weight: bold;
                font-size: 0.9rem;
            }
            .form-control:focus {
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <!-- Navbar-->
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light py-3">
                <div class="container">
                    <!-- Navbar Brand -->
                    <a href="#" class="navbar-brand">
                        <img src="https://bootstrapious.com/i/snippets/sn-registeration/logo.svg" alt="logo" width="150">
                    </a>
                </div>
            </nav>
        </header>


        <div class="container">
            <div class="row py-5 mt-4 align-items-center">
                <!-- For Demo Purpose -->
                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
                    <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
                    <h1>Create an Account</h1>
                    <p class="font-italic text-muted mb-0">Create a minimal registeration page using Bootstrap 4 HTML form elements.</p>
                    <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
                            <u>Bootstrapious</u></a>
                    </p>
                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                    <form action="signup" method="post">
                        <div class="row">

                            <!-- First Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <input id="firstName" type="text" name="firstname" placeholder="First Name" class="form-control bg-white  border-md" required="">
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <input id="lastName" type="text" name="lastname" placeholder="Last Name" class="form-control bg-white border-md" required="">
                            </div>
                            
                            <!-- Logname -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <input  type="text" name="logname" placeholder="Login Name" class="form-control bg-white  border-md" required="">
                            </div>

                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white  border-md" required="">
                            </div>

                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <select id="countryCode" name="countryCode" style="max-width: 80px" class="custom-select form-control bg-white  border-md h-100 font-weight-bold text-muted">
                                    <option value="">+84</option>
                                    <option value="">+10</option>
                                    <option value="">+15</option>
                                    <option value="">+18</option>
                                </select>
                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" class="form-control bg-white border-md  pl-3" required="">
                            </div>.


                            <!-- Province -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <select id="job" name="province" class="form-control custom-select bg-white  border-md" required="">
                                    <c:forEach items="${adb.provinceList}" var="pr">
                                        <option value="${pr}">${pr}</option>
                                    </c:forEach>
                                    
                                </select>
                            </div>
                            
                            <!-- District -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <select id="job" name="district" class="form-control custom-select bg-white  border-md"  required="">
                                    <option value="">Choose your job</option>
                                    <option value="">Designer</option>
                                    <option value="">Developer</option>
                                    <option value="">Manager</option>
                                    <option value="">Accountant</option>
                                </select>
                            </div>
                            
                            <!-- Ward -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <select id="job" name="ward" class="form-control custom-select bg-white  border-md" required="">
                                    <option value="">Choose your job</option>
                                    <option value="">Designer</option>
                                    <option value="">Developer</option>
                                    <option value="">Manager</option>
                                    <option value="">Accountant</option>
                                </select>
                            </div>
                            
                            <!-- Detail Address -->
                            <div class="input-group col-lg-12 mb-4">
                                
                                <input  type="text" name="detailAdd" placeholder="Detail Address" class="form-control bg-white  border-md"  required="">
                            </div>

                            <!-- Password -->
                            <div class="input-group col-lg-6 mb-4">
                                
                                <input id="password" type="password" name="password" placeholder="Password" class="form-control bg-white  border-md"  required="">
                            </div>

                            <!-- Password Confirmation -->
                            <div class="input-group col-lg-6 mb-4">
                                
                                <input id="passwordConfirmation" type="text" name="passwordConfirmation" placeholder="Confirm Password" class="form-control bg-white  border-md" required="">
                            </div>

                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                
                                    <input type="submit" class=" btn btn-primary btn-block py-2 font-weight-bold" value="Create your account"></input>
                                    
                                
                            </div>

                            <!-- Divider Text -->
                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>

                            <!-- Social Login -->
                            <div class="form-group col-lg-12 mx-auto">
                                <a href="#" class="btn btn-primary btn-block py-2 btn-facebook">
                                    <i class="fa fa-facebook-f mr-2"></i>
                                    <span class="font-weight-bold">Continue with Facebook</span>
                                </a>
                                <a href="#" class="btn btn-primary btn-block py-2 btn-twitter">
                                    <i class="fa fa-twitter mr-2"></i>
                                    <span class="font-weight-bold">Continue with Twitter</span>
                                </a>
                            </div>

                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <p class="text-muted font-weight-bold">Already Registered? <a href="#" class="text-primary ml-2">Login</a></p>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    
            <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/popper.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.js"></script>
        <script>
        $(function () {
            $('input, select').on('focus', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
            });
            $('input, select').on('blur', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
            });
        });
    </script>
</html>
