<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="linkcss" value="/web/css"/>
<c:set var="linkjs" value="/web/js"/>
<c:set var="link_img" value="/web/images"/>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="java.text.resources"/>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta name='copyright' content=''>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Tag  -->
    <title>Giỏ hàng</title>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${link_img}/favicon.png">
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
          rel="stylesheet">
    <!-- StyleSheet -->

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${linkcss}/bootstrap.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="${linkcss}/magnific-popup.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${linkcss}/font-awesome.css">
    <!-- Fancybox -->
    <link rel="stylesheet" href="${linkcss}/jquery.fancybox.min.css">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="${linkcss}/themify-icons.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="${linkcss}/niceselect.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="${linkcss}/animate.css">
    <!-- Flex Slider CSS -->
    <link rel="stylesheet" href="${linkcss}/flex-slider.min.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="${linkcss}/owl-carousel.css">
    <!-- Slicknav -->
    <link rel="stylesheet" href="${linkcss}/slicknav.min.css">

    <!-- Eshop StyleSheet -->
    <link rel="stylesheet" href="${linkcss}/reset.css">
    <link rel="stylesheet" href="${linkcss}/style.css">
    <link rel="stylesheet" href="${linkcss}/responsive.css">
</head>
<body class="js">

<!-- Preloader -->
<jsp:include page="preload.jsp"/>
<!-- End Preloader -->

<!-- Header -->
<jsp:include page="header.jsp"/>
<!--/ End Header -->

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="#.">Cart</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shopping Cart -->
<div class="shopping-cart section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Shopping Summery -->
                <table class="table shopping-summery">
                    <thead>
                    <tr class="main-hading">
                        <th>Sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th class="text-center">Đơn giá</th>
                        <th class="text-center">Số lượng</th>
                        <th class="text-center">Tổng</th>
                        <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${cart}">
                        <tr>
                            <td class="image" data-title="No"><img src="${p.product.imageUrl}" alt="E-Shop">
                            </td>
                            <td class="product-des" data-title="Description">
                                <p class="product-name"><a href="#">${p.product.name}</a></p>
                            </td>
                            <td class="price" data-title="Price">
                                <span>
                                    <fmt:formatNumber value="${p.product.price}" type="currency" currencyCode="VND"/>
                                </span>
                            </td>
                            <td class="qty" data-title="Qty"><!-- Input Order -->
                                <div class="input-group">
                                    <input type="text" name="quant[1]" class="input-number" disabled data-min="1"
                                           data-max="100" value="${p.quantity}">
                                </div>
                                <!--/ End Input Order -->
                            </td>
                            <td class="total-amount" data-title="Total">
                                <span>
                                    <fmt:formatNumber value="${p.totalPrice}" type="currency" currencyCode="VND"/>
                                </span>
                            </td>
                            <td class="action" data-title="Remove"><a href="/cart/delete?id=${p.cartItemId}"><i class="ti-trash remove-icon"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!--/ End Shopping Summery -->
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <!-- Total Amount -->
                <div class="total-amount">
                    <div class="row">
                        <div class="col-lg-8 col-md-5 col-12">
                            <div class="left"></div>
                        </div>
                        <div class="col-lg-4 col-md-7 col-12">
                            <div class="right">
                                <ul>
                                    <li>Tổng tiền<span>
                                        <fmt:formatNumber value="${total}" type="currency" currencyCode="VND"/>
                                    </span></li>
                                    <li>Shipping<span>Free</span></li>
                                    <li class="last">Thành tiền<span>
                                        <fmt:formatNumber value="${total}" type="currency" currencyCode="VND"/>
                                    </span></li>
                                </ul>
                                <div class="button5">
                                    <a href="/cart/checkout" class="btn">Thanh toán</a>
                                    <a href="/" class="btn">Tiếp tục mua sắm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ End Total Amount -->
            </div>
        </div>
    </div>
</div>
<!--/ End Shopping Cart -->


<!-- Start Footer Area -->
<jsp:include page="footer.jsp"/>
<!-- /End Footer Area -->

<!-- Jquery -->
<script src="${linkjs}/jquery.min.js"></script>
<script src="${linkjs}/jquery-migrate-3.0.0.js"></script>
<script src="${linkjs}/jquery-ui.min.js"></script>
<!-- Popper JS -->
<script src="${linkjs}/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="${linkjs}/bootstrap.min.js"></script>
<!-- Color JS -->
<script src="${linkjs}/colors.js"></script>
<!-- Slicknav JS -->
<script src="${linkjs}/slicknav.min.js"></script>
<!-- Owl Carousel JS -->
<script src="${linkjs}/owl-carousel.js"></script>
<!-- Magnific Popup JS -->
<script src="${linkjs}/magnific-popup.js"></script>
<!-- Fancybox JS -->
<script src="${linkjs}/facnybox.min.js"></script>
<!-- Waypoints JS -->
<script src="${linkjs}/waypoints.min.js"></script>
<!-- Countdown JS -->
<script src="${linkjs}/finalcountdown.min.js"></script>
<!-- Nice Select JS -->
<script src="${linkjs}/nicesellect.js"></script>
<!-- Ytplayer JS -->
<script src="${linkjs}/ytplayer.min.js"></script>
<!-- Flex Slider JS -->
<script src="${linkjs}/flex-slider.js"></script>
<!-- ScrollUp JS -->
<script src="${linkjs}/scrollup.js"></script>
<!-- Onepage Nav JS -->
<script src="${linkjs}/onepage-nav.min.js"></script>
<!-- Easing JS -->
<script src="${linkjs}/easing.js"></script>
<!-- Active JS -->
<script src="${linkjs}/active.js"></script>
</body>
</html>