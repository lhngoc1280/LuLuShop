<%-- 
    Document   : cart
    Created on : Jul 1, 2022, 4:50:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/cart.css"/>
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="h-100 " style="margin-top: 50px">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <c:if test="${requestScope.OrderError!=null}" >
                        <p style="color: red">${requestScope.OrderError}</p>
                    </c:if>
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - ${sessionScope.cartsize} items</h5>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <c:if test="${sessionScope.rolename!=null}">
                                    <c:forEach items="${sessionScope.cart.items}" var="i">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                    <img src="<%=request.getContextPath()%>/images/p${i.getProduct().id}.png"
                                                         class="w-100"/>
                                                    <a href="#!">
                                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                    </a>
                                                </div>
                                                <!-- Image -->
                                            </div>

                                            <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>${i.getProduct().name}</strong></p>
                                                <p>Color: </p>
                                                <p>Size: </p>
                                                <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                                                        title="Remove item">
                                                    <a href="<%=request.getContextPath()%>/changecart?act=remove&pid=${i.getProduct().id}" style="color: white"><i class="fa fa-trash"></i></a>

                                                </button>

                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                <!-- Quantity -->
                                                <div class="d-flex mb-4" style="max-width: 300px">
                                                    <button class="btn" style="padding: 6px; height: 38px">
                                                        <a href="<%=request.getContextPath()%>/changecart?act=minus&pid=${i.getProduct().id}" style="color: black"><i class="fa fa-minus"></i></a>
                                                    </button>

                                                    <div class="form-outline">
                                                        <input id="form1" min="0" readonly name="quantity" value="${i.quantity}" type="number" class="form-control" />
                                                        <label class="form-label" for="form1">Quantity</label>
                                                    </div>

                                                    <button class="btn" style="padding: 6px; height: 38px">
                                                        <a href="<%=request.getContextPath()%>/changecart?act=plus&pid=${i.getProduct().id}" style="color: black"><i class="fa fa-plus"></i></a>
                                                    </button>
                                                </div>
                                                <!-- Quantity -->

                                                <!-- Price -->
                                                <p class="text-start text-md-center">
                                                    <strong>${i.getProduct().price * (1-i.getProduct().discount/100)}</strong>
                                                </p>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>
                                </c:if>


                                <c:if test="${sessionScope.rolename==null}">

                                    <c:forEach items="${sessionScope.unknownCart.items}" var="i">

                                        <div class="row" id="i.getProduct().id">
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                    <img src="<%=request.getContextPath()%>/images/p${i.getProduct().id}.png"
                                                         class="w-100"/>
                                                    <a href="#!">
                                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                    </a>
                                                </div>
                                                <!-- Image -->
                                            </div>

                                            <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>${i.getProduct().name}</strong></p>
                                                <p>Color: </p>
                                                <p>Size: </p>
                                                <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                                                        title="Remove item">
                                                    <a href="<%=request.getContextPath()%>/changecart?act=remove&pid=${i.getProduct().id}" style="color: white"><i class="fa fa-trash"></i></a>

                                                </button>

                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                <!-- Quantity -->
                                                <div class="d-flex mb-4" style="max-width: 300px">
                                                    <button class="btn" style="padding: 6px; height: 38px">
                                                        <a href="<%=request.getContextPath()%>/changecart?act=minus&pid=${i.getProduct().id}" style="color: black"><i class="fa fa-minus"></i></a>
                                                    </button>

                                                    <div class="form-outline">
                                                        <input id="form1" min="0" readonly name="quantity" value="${i.quantity}" type="number" class="form-control" />
                                                        <label class="form-label" for="form1">Quantity</label>
                                                    </div>

                                                    <button class="btn" style="padding: 6px; height: 38px">
                                                        <a href="<%=request.getContextPath()%>/changecart?act=plus&pid=${i.getProduct().id}" style="color: black"><i class="fa fa-plus"></i></a>
                                                    </button>
                                                </div>
                                                <!-- Quantity -->

                                                <!-- Price -->
                                                <p class="text-start text-md-center">
                                                    <strong>${i.getProduct().price * (1-i.getProduct().discount/100)}</strong>
                                                </p>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>

                                    <form action="signup" method="post" style="display: none">
                                        <div class="row">

                                            <!-- First Name -->
                                            <div class="input-group col-lg-6 mb-4">
                                                <input id="firstName" type="text" name="firstname" placeholder="First Name" class="form-control bg-white  border-md" required="">
                                            </div>

                                            <!-- Last Name -->
                                            <div class="input-group col-lg-6 mb-4">
                                                <input id="lastName" type="text" name="lastname" placeholder="Last Name" class="form-control bg-white border-md" required="">
                                            </div>

                                            <!-- Email Address -->
                                            <div class="input-group col-lg-12 mb-4">
                                                <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white  border-md" required="">
                                            </div>

                                            <!-- Phone Number -->
                                            <div class="input-group col-lg-12 mb-4">
                                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" class="form-control bg-white border-md  pl-3" required="">
                                            </div>.

                                            <!-- Detail Address -->
                                            <div class="input-group col-lg-12 mb-4">

                                                <input  type="text" name="detailAdd" placeholder="Detail Address" class="form-control bg-white  border-md"  required="">
                                            </div>


                                            <!-- Submit Button -->
                                            <div class="form-group col-lg-12 mx-auto mb-0">

                                                <input type="submit" class=" btn btn-primary btn-block py-2 font-weight-bold" value="Check out"></input>


                                            </div>

                                            <!-- Divider Text -->

                                            <!-- Already Registered -->
                                            <div class="text-center w-100">
                                                <p class="text-muted font-weight-bold">Already Registered? <a href="<%=request.getContextPath()%>/login" class="text-primary ml-2">Login</a></p>
                                            </div>

                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p><strong>Expected shipping delivery</strong></p>
                                <p class="mb-0">12.10.2020 - 14.10.2020</p>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        Products
                                        <c:if test="${sessionScope.rolename==null}">
                                            <span>$${sessionScope.unknownCart.getTotalMoney()}</span>
                                        </c:if>
                                        <c:if test="${sessionScope.rolename!=null}">
                                            <span>${sessionScope.cart.getTotalMoney()}</span>
                                        </c:if>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        Shipping
                                        <span>0</span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0">(including 2% VAT)</p>
                                            </strong>
                                        </div>

                                        <c:if test="${sessionScope.rolename==null}">
                                            <span><strong>${sessionScope.unknownCart.totalMoney*1.02}</strong></span>
                                        </c:if>
                                        <c:if test="${sessionScope.rolename!=null}">
                                            <span><strong>${sessionScope.cart.totalMoney *1.02}</strong></span>
                                        </c:if>

                                    </li>
                                </ul>

                                <button type="button" class="btn  btn-lg btn-block">
                                    <a style="color: black" href="<%=request.getContextPath()%>/trans">Check Out</a>
                                </button>
                                <button type="button" class="btn  btn-lg btn-block">
                                    <a style="color: black" href="<%=request.getContextPath()%>/views/home.jsp">Back To Shop</a>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
