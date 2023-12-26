<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="link_css" value="/web/css"/>
<c:set var="link_js" value="/web/js"/>
<c:set var="link_img" value="/web/images"/>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="java.text.resources"/>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Eshop</title>
    <link rel="icon" type="image/png" href="${link_img}/favicon.png">
    <!-- Google Font -->
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


    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${link_css}/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/nice-select2.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${link_css}/styledetail.css" type="text/css">

    <link href="${link_css}/style2.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${link_css}/responsive2.css" rel="stylesheet"/>

    <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
    <link rel="stylesheet" href="${link_css}/shop-details.css">


</head>

<body>

<jsp:include page="preload.jsp"/>
<jsp:include page="header.jsp"/>


<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="${pTrend.imageUrl}" alt="" />
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${pTrend.name}</h3>
                    <div class="product__details__rating">
                        <div class="stars">
                            <form action="">
                                <input class="star star-5" id="star-5" type="radio" name="star"/>
                                <label class="star star-5" for="star-5"></label>
                                <input class="star star-4" id="star-4" type="radio" name="star"/>
                                <label class="star star-4" for="star-4"></label>
                                <input class="star star-3" id="star-3" type="radio" name="star"/>
                                <label class="star star-3" for="star-3"></label>
                                <input class="star star-2" id="star-2" type="radio" name="star"/>
                                <label class="star star-2" for="star-2"></label>
                                <input class="star star-1" id="star-1" type="radio" name="star"/>
                                <label class="star star-1" for="star-1"></label>
                            </form>
                        </div>
                        <span>(18 reviews)</span>
                    </div>
                    <div class="product__details__price">
                        <fmt:formatNumber value="${pTrend.price}" type="currency"/>
                    </div>
                    <p>${pTrend.description}</p>
                    <div class="product__details__quantity">

                    </div>
                    <a href="/cart/add?pId=${pTrend.productId}" class="primary-btn">Thêm vào giỏ hàng</a>
                    <ul>
                        <li><b>Trạng thái</b> <span>Còn hàng</span></li>
                        <li><b>Shipping</b> <span>10-15 phút. <samp>Miễn phí hôm nay</samp></span></li>
                        <li><b>Khối lượng</b> <span>0.5 kg</span></li>
                        <li><b>Chia sẻ</b>
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
                               aria-selected="true">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Thông tin</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Thông tin sản phẩm</h6>
                                <p>
                                    ${pTrend.description}
                                </p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Thông tin</h6>
                                <p>
                                    - Sản phẩm được sản xuất tại Việt Nam

                                </p>
                                <p>
                                    - Sản phẩm được bảo hành 1 năm
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- footer section -->
<jsp:include page="footer.jsp" />
<!-- footer section -->


<!-- Active JS -->
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
<script src="${link_js}/mixitup.min.js"></script>
<!-- Easing JS -->
<script src="${link_js}/easing.js"></script>
<!-- Active JS -->
<script src="${link_js}/active.js"></script>
<script src="${link_js}/main.js"></script>
</body>

</html>
