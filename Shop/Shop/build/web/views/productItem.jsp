<%-- 
    Document   : productItem
    Created on : Jul 1, 2022, 2:58:06 AM
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/elegant-icons.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/slicknav.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"/>

    </head>
    <body>
        <div class="super_container">

            <!-- Header -->

            <%@include file="header.jsp" %>
            <div class="container product_section_container" style="margin-top: 100px">
                <div class="row">
                    <div class="col product_section clearfix">

                        <!-- Products -->
                        <div class="products_iso">
                            <div class="row">
                                <div class="col">

                                    <div class="container" style="padding-top:  20px ">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product__details__pic">
                                                    <div class="product__details__pic__item">
                                                        <img style="width: 100%" data-imgbigurl="<%=request.getContextPath()%>/images/p${sessionScope.pdb.getProduct(requestScope.pid).id}.png"
                                                             src="<%=request.getContextPath()%>/images/p${sessionScope.pdb.getProduct(requestScope.pid).id}.png" alt="">

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="product__details__text" id="${requestScope.pid}">
                                                    <h3>${sessionScope.pdb.getProduct(requestScope.pid).name}</h3>
                                                    <div class="product__details__rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-half-o"></i>
                                                        <span>(18 reviews)</span>
                                                    </div>
                                                    <div class="product__details__price">$${sessionScope.pdb.getProduct(requestScope.pid).price}</div>
                                                    <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
                                                        vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
                                                        quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>
                                                    <form action="<%=request.getContextPath()%>/cart" >
                                                        <div class="product__details__quantity">
                                                            <div class="quantity">
                                                                <div class="pro-qty">
                                                                    <input type="number" value="1" name="quantity">
                                                                </div>
                                                            </div>
                                                            <input style="display: none"  type="text" value="${requestScope.pid}" name="pAddCart"/>

                                                            <input  type="submit" value="Add to cart" />
                                                        </div>


                                                    </form>

                                                    <ul>
                                                        <li><b>Availability</b> <span>In Stock</span></li>
                                                        <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                                                        <li><b>Weight</b> <span>0.5 kg</span></li>
                                                        <li><b>Share on</b>
                                                            <div class="share">
                                                                <a href="#"><i class="fa fa-facebook"></i></a>
                                                                <a href="#"><i class="fa fa-twitter"></i></a>
                                                                <a href="#"><i class="fa fa-instagram"></i></a>
                                                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="product__details__tab">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                                               aria-selected="true">Description</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                                               aria-selected="false">Information</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                                               aria-selected="false">Reviews <span>(1)</span></a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                                            <div class="product__details__tab__desc">
                                                                <h6>Products Infomation</h6>
                                                                ${sessionScope.pdb.getProduct(requestScope.pid).description}
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                                                            <div class="product__details__tab__desc">
                                                                <h6>Products Infomation</h6>
                                                                <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                                                    Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                                                    Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                                                    sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                                                    eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                                                    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                                                    sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                                                    diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                                                    ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                                                    Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                                                    Proin eget tortor risus.</p>
                                                                <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                                                    ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                                                    elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                                                    porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                                                    nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                                                            <div class="product__details__tab__desc">
                                                                <h6>Products Infomation</h6>
                                                                <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                                                    Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                                                    Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                                                    sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                                                    eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                                                    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                                                    sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                                                    diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                                                    ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                                                    Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                                                    Proin eget tortor risus.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Product Sorting -->


                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Benefit -->
            <!--
                        <div class="benefit">
                            <div class="container">
                                <div class="row benefit_row">
                                    <div class="col-lg-3 benefit_col">
                                        <div class="benefit_item d-flex flex-row align-items-center">
                                            <div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
                                            <div class="benefit_content">
                                                <h6>free shipping</h6>
                                                <p>Suffered Alteration in Some Form</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 benefit_col">
                                        <div class="benefit_item d-flex flex-row align-items-center">
                                            <div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                                            <div class="benefit_content">
                                                <h6>cach on delivery</h6>
                                                <p>The Internet Tend To Repeat</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 benefit_col">
                                        <div class="benefit_item d-flex flex-row align-items-center">
                                            <div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
                                            <div class="benefit_content">
                                                <h6>45 days return</h6>
                                                <p>Making it Look Like Readable</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 benefit_col">
                                        <div class="benefit_item d-flex flex-row align-items-center">
                                            <div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
                                            <div class="benefit_content">
                                                <h6>opening all week</h6>
                                                <p>8AM - 09PM</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            
            -->



        </div>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.nice-select.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.slicknav.js"></script>
        <script src="<%=request.getContextPath()%>/js/mixitup.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/main.js"></script>


    </body>
</html>
