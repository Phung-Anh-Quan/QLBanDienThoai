<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="link_css" value="/web/css"/>
<c:set var="link_js" value="/web/js"/>
<c:set var="link_img" value="/web/images"/>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="java.text.resources"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta name='copyright' content=''>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Tag  -->
    <title>Trang chủ</title>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${link_img}/favicon.png">
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
          rel="stylesheet">
    <!-- StyleSheet -->
    <!-- Bootstrap -->
    <link href="${link_css}/bootstrap.css" rel="stylesheet">
    <!-- Magnific Popup -->
    <link href="${link_css}/magnific-popup.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${link_css}/font-awesome.css" rel="stylesheet">
    <!-- Fancybox -->
    <link href="${link_css}/jquery.fancybox.min.css" rel="stylesheet">
    <!-- Themify Icons -->
    <link href="${link_css}/themify-icons.css" rel="stylesheet">
    <!-- Nice Select CSS -->
    <link href="${link_css}/niceselect.css" rel="stylesheet">
    <!-- Animate CSS -->
    <link href="${link_css}/animate.css" rel="stylesheet">
    <!-- Flex Slider CSS -->
    <link href="${link_css}/flex-slider.min.css" rel="stylesheet">
    <!-- Owl Carousel -->
    <link href="${link_css}/owl-carousel.css" rel="stylesheet">
    <!-- Slicknav -->
    <link href="${link_css}/slicknav.min.css" rel="stylesheet">

    <!-- Eshop StyleSheet -->
    <link href="${link_css}/reset.css" rel="stylesheet">
    <link href="${link_css}/style.css" rel="stylesheet">
    <link href="${link_css}/responsive.css" rel="stylesheet">


</head>
<body class="js">

<!-- Preloader -->
<jsp:include page="preload.jsp"/>
<!-- End Preloader -->

<!-- Header -->
<jsp:include page="header.jsp"/>
<!--/ End Header -->

<!-- Slider Area -->
<section class="hero-slider">
    <!-- Single Slider -->
    <div class="single-slider">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-9 offset-lg-3 col-12">
                    <div class="text-inner">
                        <div class="row">
                            <div class="col-lg-7 col-12">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Single Slider -->
</section>
<!--/ End Slider Area -->

<!-- Start Product Area -->
<div class="product-area section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2>Trending sản phẩm</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="product-info">
                    <div class="tab-content" id="myTabContent">
                        <!-- Start Single Tab -->
                        <div class="tab-pane fade show active" id="man" role="tabpanel">
                            <div class="tab-single">
                                <div class="row">
                                    <c:forEach items="${trendingItem}" var="pTrend">
                                        <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                            <div class="single-product">
                                                <div class="product-img" >
                                                    <a href="/products/item?id=${pTrend.productId}">
                                                        <img class="default-img"
                                                             style="height: 250px; width: 250px;"
                                                             src="${pTrend.imageUrl}"
                                                             alt="E-Shop">
                                                        <img class="hover-img"
                                                             style="height: 750px; width: 550px;"
                                                             src="${pTrend.imageUrl}"
                                                             alt="E-Shop">
                                                    </a>
                                                    <div class="button-head">
                                                        <div class="product-action">
                                                            <a data-toggle="modal" data-target="#exampleModal"
                                                               title="Quick View" href="/products/item?id=${pTrend.productId}"><i class=" ti-eye"></i><span>Xem sản phẩm</span></a>
                                                        </div>
                                                        <div class="product-action-2">
                                                            <a title="Add to cart" href="/cart/add?pId=${pTrend.productId}">Thêm vào giỏ hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-content">
                                                    <h3><a href="/products/item?id=${pTrend.productId}">${pTrend.category.categoryName}</a></h3>
                                                    <div class="product-price">
                                                        <span>
                                                            <fmt:formatNumber value="${pTrend.price}" type="currency"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--/ End Single Tab -->

                        <!--/ End Single Tab -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Product Area -->

<!-- Start Shop Services Area -->
<section class="shop-services section home">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service -->
                <div class="single-service">
                    <i class="ti-rocket"></i>
                    <h4>Miễn phí giao hàng</h4>
                    <p>Hóa đơn trên 200,000đ</p>
                </div>
                <!-- End Single Service -->
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service -->
                <div class="single-service">
                    <i class="ti-reload"></i>
                    <h4>Hoàn hàng miễn phí</h4>
                    <p>Đổi trả trong 30ngày</p>
                </div>
                <!-- End Single Service -->
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service -->
                <div class="single-service">
                    <i class="ti-lock"></i>
                    <h4>Thanh toán tiện lợi</h4>
                    <p>Nhiều phương thức thanh toán</p>
                </div>
                <!-- End Single Service -->
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <!-- Start Single Service -->
                <div class="single-service">
                    <i class="ti-tag"></i>
                    <h4>Giá tốt nhất</h4>
                    <p>Có nhiều chương trình ưu đãi</p>
                </div>
                <!-- End Single Service -->
            </div>
        </div>
    </div>
</section>
<!-- End Shop Services Area -->

<!-- Start Shop Newsletter  -->
<section class="shop-newsletter section">
    <div class="container">
        <div class="inner-top">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <!-- Start Newsletter Inner -->
                    <div class="inner">
                        <h4>Quan tâm</h4>
                        <p>Điền thông tin để nhận thông tin khuyến mãi <span>10%</span> với đơn hàng đầu tiên</p>
                        <form method="get" class="newsletter-inner">
                            <input name="EMAIL" placeholder="Your email address" required="" type="email">
                            <button onclick="return false;" class="btn">Đăng ký</button>
                        </form>
                    </div>
                    <!-- End Newsletter Inner -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Shop Newsletter -->

<!-- Start Footer Area -->
<jsp:include page="footer.jsp"/>
<!-- /End Footer Area -->

<!-- Jquery -->
<script src="${link_js}/jquery.min.js"></script>
<script src="${link_js}/jquery-migrate-3.0.0.js"></script>
<script src="${link_js}/jquery-ui.min.js"></script>
<!-- Popper JS -->
<script src="${link_js}/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="${link_js}/bootstrap.min.js"></script>
<!-- Color JS -->
<!-- Slicknav JS -->
<script src="${link_js}/slicknav.min.js"></script>
<!-- Owl Carousel JS -->
<script src="${link_js}/owl-carousel.js"></script>
<!-- Magnific Popup JS -->
<script src="${link_js}/magnific-popup.js"></script>
<!-- Waypoints JS -->
<script src="${link_js}/waypoints.min.js"></script>
<!-- Countdown JS -->
<script src="${link_js}/finalcountdown.min.js"></script>
<!-- Nice Select JS -->
<script src="${link_js}/nicesellect.js"></script>
<!-- Flex Slider JS -->
<script src="${link_js}/flex-slider.js"></script>
<!-- ScrollUp JS -->
<script src="${link_js}/scrollup.js"></script>
<!-- Onepage Nav JS -->
<script src="${link_js}/onepage-nav.min.js"></script>
<!-- Easing JS -->
<script src="${link_js}/easing.js"></script>
<!-- Active JS -->
<script src="${link_js}/active.js"></script>
</body>
</html>