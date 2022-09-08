<%-- 
    Document   : categories
    Created on : Jun 10, 2022, 12:33:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/animate.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/categories_styles.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/categories_responsive.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="super_container">

            <!-- Header -->

            <%@include file="header.jsp" %>
            <div class="fs_menu_overlay"></div>
            <div class="container product_section_container" style="margin-top: 100px">
                <div class="row">
                    <div class="col product_section clearfix">

                        <!-- Breadcrumbs -->

                        <div class="breadcrumbs align-items-center " style="padding-top: 10px; margin-bottom: 20px" >
                            <form action="<%=request.getContextPath()%>/search" style="text-align: center">
                                <input style="float: left; width: 68%" type="text" class="form-control form-control-user"  name="search" placeholder="Enter key word to search"/>     
                                <input style="float: right; width: 30%" type="submit" value="Search" class="btn  btn-user "/>
                            </form>
                        </div>
                        <!-- Sidebar -->
<!--
-->                        <div class="sidebar">
                             <!--Price Range Filtering--> 
                            <div class="sidebar_section">
                                <div class="sidebar_title">
                                    <h5>Filter by Price</h5>
                                </div>
                                <p><input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;"></p>
                                <div id="slider-range"></div>
                                <div class="filter_button"><span>filter</span></div>
                            </div>
                        </div>

                        <!-- Main Content -->
                        <div class="main_content">
                            <!-- Products -->
                            <div class="products_iso">
                                <div class="row">
                                    <div class="col">
                                        <!-- Product Sorting -->
                                        <div class="product_sorting_container product_sorting_container_top">
                                            <ul class="product_sorting">
                                                <li>
                                                    <span class="type_sorting_text">Default Sorting</span>
                                                    <i class="fa fa-angle-down"></i>
                                                    <c:if test="${requestScope.search!=null}">
                                                        <ul class="sorting_type">
                                                            <li class="type_sorting_btn" >
                                                                <a href="<%=request.getContextPath()%>/search?sort_by=default&search=${requestScope.search}">
                                                                    <span>Default Sorting</span>
                                                                </a>
                                                            </li>
                                                            <li class="type_sorting_btn" >
                                                                <a href="<%=request.getContextPath()%>/search?sort_by=price&search=${requestScope.search}">
                                                                    <span>Price</span>
                                                                </a>
                                                            </li>
                                                            <li class="type_sorting_btn" >
                                                                <a href="<%=request.getContextPath()%>/search?sort_by=name&search=${requestScope.search}">
                                                                    <span>Product Name</span>
                                                                </a>
                                                            </li>
                                                            <li class="type_sorting_btn" >
                                                                <a href="<%=request.getContextPath()%>/search?sort_by=discount&search=${requestScope.search}">
                                                                    <span>Discount</span>
                                                                </a>
                                                            </li>

                                                        </ul>
                                                    </c:if>

                                                </li>
                                                <li>
                                                    <span>Order By</span>

                                                    <i class="fa fa-angle-down"></i>
                                                    <ul class="sorting_num">
                                                        <c:if test="${requestScope.sort_by!=null}">
                                                            <li  ><a href="<%=request.getContextPath()%>/search?order_by=asc&${requestScope.query}"><span>Ascending</span></a></li>
                                                            <li ><a href="<%=request.getContextPath()%>/search?order_by=desc&${requestScope.query}"><span>Descending</span></a></li>
                                                            </c:if>
                                                    </ul>
                                                </li>
                                                
                                                <c:set value="${sessionScope.page}" var="page"/>
                                                <c:set value="${sessionScope.querysearch}" var="querysearch"/>
                                                <li>
                                                    <span>Show</span>
                                                    <span class="num_sorting_text">${page.nrpp}</span>
                                                    <i class="fa fa-angle-down"></i>
                                                    <ul class="sorting_num">
                                                        <c:forEach items="${page.arrNrpp}" var="n">
                                                            <li class="num_sorting_btn" ><a href="<%=request.getContextPath()%>/search?${querysearch}&nrpp=${n}"><span>${n}</span></a></li>
                                                                    </c:forEach>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <div class="pages d-flex flex-row align-items-center">
                                                <c:if test="${page.cp>1}">
                                                    <div class="page_next" style="padding-right: 30px"><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${page.cp-1}"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a></div>
                                                        </c:if>

                                                <div class="page_current">
                                                    <span>${page.cp}</span>
                                                    <ul class="page_selection">
                                                        <c:forEach begin="${1}" end="${page.np}" var="n">
                                                            <li><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${n}">${n}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="page_total"><span>of</span>${page.np}</div>
                                                <c:if test="${page.cp<page.np}">
                                                    <div id="next_page" class="page_next"><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${page.cp+1}""><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
                                                        </c:if>
                                            </div>

                                        </div>

                                        <!-- Product Grid -->

                                        <div class="product-grid">
                                            <!-- Product 1 -->

                                            <c:forEach items="${sessionScope.pListSearch}" var="p" begin="${page.begin}" end="${page.end}">
                                                <div class="product-item men">
                                                    <div class="product discount product_filter">
                                                        <div class="product_image" style="height: 80%">
                                                            <img style="height: 100%" src="<%=request.getContextPath()%>/images/p${p.id}.png" alt="">
                                                        </div>
                                                        <div class="favorite favorite_left"></div>
                                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
                                                        <div class="product_info">
                                                            <h6 class="product_name"><a href="<%=request.getContextPath()%>/productdetail?pid=${p.id}">${p.getTitle()}</a></h6>
                                                            <div class="product_price">${p.price * (1-p.discount/100)}
                                                                <c:if test="${p.discount!=0}"><span>${p.price}</span></c:if>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="red_button add_to_cart_button" ><a href="<%=request.getContextPath()%>/cart?pAddCart=${p.id}&quantity=1&urltext=search.jsp&qsearch=${sessionScope.querysearch}" >Add to cart</a></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <!-- Product Sorting -->
                                        <div class="product_sorting_container product_sorting_container_bottom clearfix">
                                            <ul class="product_sorting">
                                                <li>
                                                    <span>Show</span>
                                                    <span class="num_sorting_text">${page.nrpp}</span>
                                                    <i class="fa fa-angle-down"></i>
                                                    <ul class="sorting_num">
                                                        <c:forEach items="${page.arrNrpp}" var="n">
                                                            <li class="num_sorting_btn" ><a href="<%=request.getContextPath()%>/search?${querysearch}&nrpp=${n}"><span>${n}</span></a></li>
                                                                    </c:forEach>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <span class="showing_results">Showing ${page.begin+1}–${page.end+1} of ${page.size} results</span>
                                            <div class="pages d-flex flex-row align-items-center">
                                                <c:if test="${page.cp>1}">
                                                    <div class="page_next" style="padding-right: 30px"><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${page.cp-1}"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a></div>
                                                        </c:if>

                                                <div class="page_current">
                                                    <span>${page.cp}</span>
                                                    <ul class="page_selection">
                                                        <c:forEach begin="${1}" end="${page.np}" var="n">
                                                            <li><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${n}">${n}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                                <div class="page_total"><span>of</span>${page.np}</div>
                                                <c:if test="${page.cp<page.np}">
                                                    <div id="next_page" class="page_next"><a href="<%=request.getContextPath()%>/search?${querysearch}&cp=${page.cp+1}""><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
                                                        </c:if>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Benefit -->

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

                <!-- Newsletter -->

                <div class="newsletter">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
                                    <h4>Newsletter</h4>
                                    <p>Subscribe to our newsletter and get 20% off your first purchase</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
                                    <input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
                                    <button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->

                <footer class="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                                    <ul class="footer_nav">
                                        <li><a href="#">Blog</a></li>
                                        <li><a href="#">FAQs</a></li>
                                        <li><a href="contact.jsp">Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </footer>

            </div>
            <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
            <script src="<%=request.getContextPath()%>/css/bootstrap4/popper.js"></script>
            <script src="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.js"></script>
            <script src="<%=request.getContextPath()%>/plugins/Isotope/isotope.pkgd.min.js"></script>
            <script src="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
            <script src="<%=request.getContextPath()%>/plugins/easing/easing.js"></script>
            <script src="<%=request.getContextPath()%>/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
            <script src="<%=request.getContextPath()%>/js/categories_custom.js"></script>

    </body>


</html>
