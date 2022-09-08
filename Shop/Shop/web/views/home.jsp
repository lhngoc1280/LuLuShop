<%-- 
    Document   : home
    Created on : Jun 8, 2022, 9:30:05 PM
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

            <%@include file="header.jsp" %>



            <!-- Slider -->

            <div class="main_slider" style="height: 900px; background-image:url(<%=request.getContextPath()%>/images/jenbanner2.jpg)">
                <div class="container fill_height">
                    <div class="row align-items-center fill_height">
                        <div class="col">
                            <div class="main_slider_content ">
                                <h6 class="text-light">Spring / Summer Collection 2022</h6>
                                <h1 class="text-light">Get up to 30% Off New Arrivals</h1>
                                <div class="red_button shop_now_button"><a href="#">shop now</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Banner -->

            <div class="banner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="banner_item align-items-center" style="background-image:url(<%=request.getContextPath()%>/images/jennie2.jpg)">
                                <div class="banner_category">
                                    <a href="categories.jsp">best seller</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="banner_item align-items-center" style="background-image:url(<%=request.getContextPath()%>/images/jennie3.jpg)">
                                <div class="banner_category">
                                    <a href="categories.jsp">shop by emotions</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="banner_item align-items-center" style="background-image:url(<%=request.getContextPath()%>/images/jennie1.jpg)">
                                <div class="banner_category">
                                    <a href="categories.jsp">sale</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- New Arrivals -->

            <div class="new_arrivals">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title new_arrivals_title">
                                <h2>New Arrivals</h2>
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
                                    <div class="product-item men" id="${p.id}">

                                        <div class="product discount product_filter">
                                            <div class="product_image" style="height: 80%">
                                                <img style="height: 100%" src="<%=request.getContextPath()%>/images/p${p.id}.png" alt="">
                                            </div>
                                            <div class="favorite favorite_left"></div>

                                            <c:if test="${p.discount>0}">
                                                <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">

                                                    <span>-${p.discount}%</span>
                                                </div>
                                            </c:if>
                                            <div class="product_info">
                                                <h6 class="product_name"><a href="<%=request.getContextPath()%>/productdetail?pid=${p.id}">${p.getTitle()}</a></h6>
                                                <div class="product_price">${p.price * (1-p.discount/100)}
                                                    <c:if test="${p.discount!=0}"><span>${p.price}</span></c:if>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="red_button add_to_cart_button" ><a  href="<%=request.getContextPath()%>/cart?pAddCart=${p.id}&quantity=1&urltext=<%=request.getRequestURL().toString()%>">Add to cart</a></div>
                                            

                                    </div>
                                </c:forEach>
                                

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Deal of the week -->

            <div class="deal_ofthe_week">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="deal_ofthe_week_img">
                                <img src="<%=request.getContextPath()%>/images/jennieXinhdep.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6 text-right deal_ofthe_week_col">
                            <div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
                                <div class="section_title">
                                    <h2>Deal Of The Week</h2>
                                </div>
                                <ul class="timer">
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="day" class="timer_num">03</div>
                                        <div class="timer_unit">Day</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="hour" class="timer_num">15</div>
                                        <div class="timer_unit">Hours</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="minute" class="timer_num">45</div>
                                        <div class="timer_unit">Mins</div>
                                    </li>
                                    <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                        <div id="second" class="timer_num">23</div>
                                        <div class="timer_unit">Sec</div>
                                    </li>
                                </ul>
                                <div class="red_button deal_ofthe_week_button"><a href="#">shop now</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- New Arrivals -->



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

            <!-- Blogs -->

            <div class="blogs">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="section_title">
                                <h2>Latest Blogs</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row blogs_container">
                        <div class="col-lg-4 blog_item_col">
                            <div class="blog_item">
                                <div class="blog_background" style="background-image:url(<%=request.getContextPath()%>/images/jennie2.jpg)"></div>
                                <div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
                                    <h4 class="blog_title">Here are the trends I see coming this fall</h4>
                                    <span class="blog_meta">by admin | dec 01, 2017</span>
                                    <a class="blog_more" href="#">Read more</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 blog_item_col">
                            <div class="blog_item">
                                <div class="blog_background" style="background-image:url(<%=request.getContextPath()%>/images/jennie2.jpg)"></div>
                                <div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
                                    <h4 class="blog_title">Here are the trends I see coming this fall</h4>
                                    <span class="blog_meta">by admin | dec 01, 2017</span>
                                    <a class="blog_more" href="#">Read more</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 blog_item_col">
                            <div class="blog_item">
                                <div class="blog_background" style="background-image:url(<%=request.getContextPath()%>/images/jennie2.jpg)"></div>
                                <div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
                                    <h4 class="blog_title">Here are the trends I see coming this fall</h4>
                                    <span class="blog_meta">by admin | dec 01, 2017</span>
                                    <a class="blog_more" href="#">Read more</a>
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
                            <form action="post">
                                <div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
                                    <input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
                                    <button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
                                </div>
                            </form>
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

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>-->
        <!--Always remember to call the above files first before calling the bootstrap.min.js file--> 
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>-->

        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/popper.js"></script>
        <script src="<%=request.getContextPath()%>/css/bootstrap4/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="<%=request.getContextPath()%>/plugins/easing/easing.js"></script>
        <script src="<%=request.getContextPath()%>/js/custom.js"></script>


        <script>
                                                function getUrl() {
                                                    document.getElementsByName("url").innerHTML = document.URL;
                                                }
        </script>



    </body>
</html>
