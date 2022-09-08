<%-- 
    Document   : signup
    Created on : Jun 21, 2022, 9:07:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="DAL.AddressDAO"%>
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


        <div class="container">
            <div class="row py-5 mt-4 align-items-center">
                <!-- For Demo Purpose -->
                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
                    <img src="https://dep.com.vn/wp-content/uploads/2021/05/jennie-blackpink-calvin-klein-heron-preston-deponline-09-20210518.jpg" alt="" class="img-fluid mb-3 d-none d-md-block">
                    <!--<img src="https://dep.com.vn/wp-content/uploads/2021/05/jennie-blackpink-calvin-klein-heron-preston-deponline-05-20210518.jpg" alt="" class="img-fluid mb-3 d-none d-md-block">-->
                    <img src="https://dep.com.vn/wp-content/uploads/2021/05/jennie-blackpink-calvin-klein-heron-preston-deponline-07-20210518.jpg" alt="" class="img-fluid mb-3 d-none d-md-block">

                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                    <h1>Create an Account</h1>
                    <% if (request.getAttribute("SignupSuccess") != null){
                    %>
                    <h4 style="color: red"><%=request.getAttribute("SignupSuccess")%></h4>
                    <%
                        }
                    %>
                    <form action="<%=request.getContextPath()%>/signup" method="post">
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
                            <% if (request.getAttribute("LognameError") != null){
                            %>
                            <p style="color: red"><%=request.getAttribute("LognameError")%></p>
                            <%
                                }
                            %>
                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">

                                <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white  border-md" required="">
                            </div>

                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4">
                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" class="form-control bg-white border-md  pl-3" required="">
                            </div>


                            <!--Province--> 
                            <div class="input-group col-lg-12 mb-4">
                                <select id="province" name="province" class="form-control custom-select bg-white  border-md" required="">
                                    <option value="" disabled="" selected="">select province</option>
                                    <c:forEach items="${sessionScope.provinceList}" var="pv">
                                        <option value="${pv}">${pv}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!--District--> 
                            <div class="input-group col-lg-12 mb-4">

                                <select id="district" name="district" class="form-control custom-select bg-white  border-md"  required="">
                                    <option value="" disabled="" selected="">select district</option>
                                </select>
                            </div>

                            <!--Ward--> 
                            <div class="input-group col-lg-12 mb-4">

                                <select id="ward" name="ward" class="form-control custom-select bg-white  border-md" required="">
                                    <option value="" disabled="" selected="">select ward</option>
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

                                <input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirm Password" class="form-control bg-white  border-md" required="">
                            </div>
                            <% if (request.getAttribute("NotMatchPass") != null){
                            %>
                            <p style="color: red"><%=request.getAttribute("NotMatchPass")%></p>
                            <%
                                }
                            %>


                            <c:if test="${sessionScope.errorWhileSendMail!=null}">
                                <p style="color: red">${sessionScope.errorWhileSendMail}</p>
                            </c:if>



                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">

                                <input type="submit" class=" btn btn-primary btn-block py-2 font-weight-bold" value="Create your account"></input>


                            </div>

                            <!-- Divider Text -->

                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <p class="text-muted font-weight-bold">Already Registered? <a href="<%=request.getContextPath()%>/login" class="text-primary ml-2">Login</a></p>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#province").change(function () {
                $.ajax({
                    url: "/Shop/detailAdd",
                    type: 'GET',
                    data: {province: $('#province option:selected').val()},

                    success: function (data) {
                        var row = document.getElementById("district");
                        row.innerHTML = data;
                    }
                });
            });
        });

    </script>    

    <script>
        $(document).ready(function () {
            $("#district").change(function () {
                $.ajax({
                    url: "/Shop/detailAdd",
                    type: 'GET',
                    data: {province: $('#province option:selected').val(),
                        district: $('#district option:selected').val()},
                    success: function (data) {
                        var row = document.getElementById("ward");
                        row.innerHTML = data;
                    }
                });
            });
        });
    </script>
</html>
