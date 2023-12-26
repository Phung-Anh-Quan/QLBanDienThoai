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
    <title>Thanh toán</title>
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
                        <li class="active"><a href="#.">Thanh toán</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->
<section class="shop checkout section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="checkout-form">
                    <h2>Điền thông tin vào</h2>
                    <p>Vui lòng điền đầy đủ thông tin</p>
                    <!-- Form -->
                    <form class="form" id="checkout-form" method="post" action="/cart/payment">
                        <div class="row">
                            <input type="hidden" name="total_price" value="${total}">
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Họ tên<span>*</span></label>
                                    <input type="text" value="${user.name}" name="fullName" placeholder=""
                                           required="required">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Số điện thoại<span>*</span></label>
                                    <input type="number" value="${user.phone}" name="phone" placeholder=""
                                           required="required"/>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Địa chỉ email<span>*</span></label>
                                    <input type="email" name="email" value="${user.email}" placeholder=""
                                           required="required"/>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-12">
                                <div class="form-group">
                                    <label>Address Line 1<span>*</span></label>
                                    <input type="text" name="address" value="${user.address}" placeholder=""
                                           required="required"/>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--/ End Form -->
                </div>
            </div>
            <div class="col-lg-4 col-12">
                <div class="order-details">
                    <!-- Order Widget -->
                    <div class="single-widget">
                        <h2>Tổng tiền</h2>
                        <div class="content">
                            <ul>
                                <li>Tổng hóa đơn<span><fmt:formatNumber value="${total}" type="currency"
                                                                        currencyCode="VND"/></span></li>
                                <li>(+) Shipping<span>Free</span></li>
                                <li class="last">Thành tiền<span><fmt:formatNumber value="${total}" type="currency"
                                                                                   currencyCode="VND"/></span></li>
                            </ul>
                        </div>
                    </div>
                    <!--/ End Order Widget -->
                    <!-- Order Widget -->
                    <div class="single-widget">
                        <h2>Hình thức thanh toán</h2>
                        <div class="content">
                            <div class="checkbox">
                                <label class="checkbox-inline" for="1"><input name="updates" id="1" type="checkbox">
                                    Eshop pay wallet</label>
                                <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox">
                                    Thanh toán khi nhận hàng</label>
                                <label class="checkbox-inline" for="3"><input name="news" id="3" type="checkbox">
                                    PayPal</label>
                            </div>
                        </div>
                    </div>
                    <!--/ End Order Widget -->
                    <!-- Payment Method Widget -->
                    <div class="single-widget payement">
                        <div class="content">
                            <img src="${link_img}/payment-method.png" alt="#">
                        </div>
                    </div>
                    <!--/ End Payment Method Widget -->
                    <!-- Button Widget -->
                    <div class="single-widget get-button">
                        <div class="content">
                            <div class="button">
                                <button type="submit" form="checkout-form" onclick="payment(event);" class="btn">Tiến hành thanh toán</button>
                            </div>
                        </div>
                    </div>
                    <!--/ End Button Widget -->
                </div>
            </div>
        </div>
    </div>
</section>
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

<script>
    async function payment(event) {
        // Get the input checkboxes
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        // Check if at least one checkbox is checked
        const isAnyChecked = Array.from(checkboxes).some(function (checkbox) {
            return checkbox.checked;
        });
        // Perform actions based on the checked status
        if (!isAnyChecked) {
            alert("Vui lòng chọn hình thức thanh toán");
            event.preventDefault(); // Prevent opening the link
        }
    }
</script>

</body>
</html>