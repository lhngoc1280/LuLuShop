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
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - ${sessionScope.cartsize} items</h5>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <c:if test="${sessionScope.rolename!=null}">
                                    <c:forEach items="${sessionScope.cart.items}" var="i">
                                        <div class="row" style="color: black">

                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                ${i.getProduct().name}
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-4 mb-4 mb-lg-0">
                                                Quantity: ${i.quantity}
                                                <p></p>
                                                <strong>Price: ${i.getProduct().price * (1 - i.getProduct().discount/100) * i.quantity}</strong>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>
                                </c:if>

                                <c:if test="${sessionScope.rolename==null}">
                                    <c:forEach items="${sessionScope.unknownCart.items}" var="i">
                                        <div class="row" style="color: black">

                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                ${i.getProduct().name}
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-4 mb-4 mb-lg-0">
                                                Quantity: ${i.quantity}
                                                <p></p>
                                                <strong>Price: ${i.getProduct().price * (1 - i.getProduct().discount/100) * i.quantity}</strong>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>
                                </c:if>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                            Products
                                            <c:if test="${sessionScope.rolename==null}">
                                                <span>$${sessionScope.unknownCart.totalMoney}</span>
                                            </c:if>
                                            <c:if test="${sessionScope.rolename!=null}">
                                                <span>${sessionScope.cart.totalMoney}</span>
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
                                                    <p class="mb-0">(including VAT)</p>
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
                                    <form action="<%=request.getContextPath()%>/trans" method="post" name="f">
                                        <c:if test="${sessionScope.rolename==null}">
                                        Điền đầy đủ thông tin của bạn để xác nhận đặt hàng: 
                                        <p></p>
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
                                            </div>

                                            <!-- Detail Address -->
                                            <div class="input-group col-lg-12 mb-4">

                                                <input  type="text" name="detailAdd" placeholder="Detail Address" class="form-control bg-white  border-md"  required="">
                                            </div>
                                            <!-- Divider Text -->

                                            <!-- Already Registered -->
                                            <div class="text-center w-100">
                                                <p class="text-muted font-weight-bold">Already Had An Account? <a href="<%=request.getContextPath()%>/login" class="text-primary ml-2">Login</a></p>
                                            </div>

                                        </div>
                                            </c:if>
                                        Ghi chú cho người bán:
                                        <input type="text" class="form-control form-control-user"  name="note" >
                                        <p></p>
                                        <!--<button><input type="submit" class="btn  btn-lg btn-block" value="Check Out" style=""/></button>-->
                                        <button type="submit" class="btn  btn-lg btn-block">
                                            Check Out
                                        </button>
                                    </form>
                                    <p></p>
                                    <button type="button" class="btn  btn-lg btn-block">
                                        <a style="color: black" href="<%=request.getContextPath()%>/cart">Back To Cart</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
