<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="header shop">
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-12">
                    <!-- Top Left -->
                    <div class="top-left">
                        <ul class="list-main">
                            <li><i class="ti-headphone-alt"></i> +012 3456 789</li>
                            <li><i class="ti-email"></i>eshop@gmail.com</li>
                        </ul>
                    </div>
                    <!--/ End Top Left -->
                </div>
                <div class="col-lg-7 col-md-12 col-12">
                    <!-- Top Right -->
                    <div class="right-content">
                        <ul class="list-main">
                            <li><i class="ti-location-pin"></i>TP HCM</li>
                            <li><i class="ti-alarm-clock"></i>Khuyến mãi</li>
                            <c:if test="${user != null}">
                                <li><i class="ti-user"></i>${user.name}</li>
                                <li><i class="ti-power-off"></i><a href="/logout">Đăng xuất</a></li>
                            </c:if>
                            <c:if test="${user == null}">
                                <li><i class="ti-power-off"></i><a href="/login">Đăng nhập</a></li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- End Top Right -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->
    <div class="middle-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-12">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="/"><img src="/web/images/logo.png" alt="logo"></a>
                    </div>
                    <!--/ End Logo -->
                    <!-- Search Form -->
                    <!--/ End Search Form -->
                    <div class="mobile-nav"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-12">
                    <div class="search-bar-top">
                        <div class="search-bar">
                            <form action="/search/name" method="get">
                                <input name="name" placeholder="Tìm kiếm sản phẩm....." type="search">
                                <button class="btnn"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-12">
                    <div class="right-bar">
                        <!-- Search Form -->
                        <div class="sinlge-bar">
                            <a href="javascript:;" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Tài khoản</a>
                        </div>
                        <div class="sinlge-bar shopping">
                            <a href="/cart/my-cart" class="single-icon"><i class="ti-bag"></i> Giỏ hàng</a>
                            <!-- Shopping Item -->
                            <!--/ End Shopping Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="cat-nav-head">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="all-category">
                            <h3 class="cat-heading"><i class="fa fa-bars" aria-hidden="true"></i>Danh mục</h3>
                            <ul class="main-category">
                                <c:forEach items="${categories}" var="category">
                                    <li><a href="/search/cate?category=${category.categoryId}">${category.categoryName}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9 col-12">
                        <div class="menu-area">
                            <!-- Main Menu -->
                            <nav class="navbar navbar-expand-lg">
                                <div class="navbar-collapse">
                                    <div class="nav-inner">
                                        <ul class="nav main-menu menu navbar-nav" id="navbar-nav">
                                            <li class="active"><a href="/">Trang chủ</a></li>
                                            <li><a href="/products">Sản phẩm</a></li>
                                            <li><a href="/blog">Blog</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!--/ End Main Menu -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Header Inner -->
</header>
