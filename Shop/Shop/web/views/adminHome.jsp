<%-- 
    Document   : adminHome
    Created on : Jun 24, 2022, 10:53:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/responsive.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_styles2.css">
        <title>JSP Page</title>
    </head>
    <body>


        <div class="super_container">

            <!-- Header -->

            <%@include file="adminHeader.jsp" %>
            <!-- Banner -->


            <div class="new_arrivals" style="margin-top: 50px">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title new_arrivals_title">
                                <h2>All Product</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col text-center">
                            <div class="new_arrivals_sorting">
                                <ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
                                    <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">Tất Cả</li>
                                    <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">Đầm</li>
                                    <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">Áo Thun</li>
                                    <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">Jeans</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
                                
                                <!-- Product 1 -->
                                <c:forEach items="${sessionScope.pdb.pList}" var="p">
                                    <div class="product-item men" style="height: 380px">
                                    
                                    <div class="product discount product_filter">
                                        <div class="product_image" style="height: 80%">
                                            <img style="height: 100%" src="<%=request.getContextPath()%>/images/p${p.id}.png" alt="">
                                        </div>
                                        <div class="favorite favorite_left"></div>
                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-${p.discount}%</span></div>
                                        <div class="product_info">
                                            <h6 class="product_name"><a href="single.jsp">${p.getTitle()}</a></h6>
                                            <div class="product_price">${p.price * (1-p.discount/100)}
                                                <c:if test="${p.discount!=0}"><span>${p.price}</span></c:if>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="red_button add_to_cart_button" ><a href="<%=request.getContextPath()%>/updateproduct?type=0&id=${p.id}" >Update</a></div>

                                </div>
                                </c:forEach>
                                

                            </div>
                        </div>
                    </div>
                </div>
            </div>


       

            <!-- Footer -->
            <%@include file="footer.jsp" %>
           
        </div>

        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/popper.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/easing/easing.js"></script>
        <script src="<%=request.getContextPath()%>/js/custom.js"></script>
    </body>
</html>
