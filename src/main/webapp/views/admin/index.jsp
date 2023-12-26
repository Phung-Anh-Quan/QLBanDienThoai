<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="link_css" value="/web/css"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name='copyright' content=''>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ADMIN - EShop</title>
    <script
            src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
            crossorigin="anonymous"
    ></script>
    <link rel="icon"
          type="image/x-icon"
          href="https://inkythuatso.com/uploads/images/2021/12/logo-truong-dai-hoc-nong-lam-thai-nguyen-inkythuatso-01-24-16-11-04.jpg"/>
    <link href="${link_css}/ad.css" rel="stylesheet"/>
</head>
<body class="sb-nav-fixed">
<%--Navv--%>
<jsp:include page="nav.jsp"/>
<%--End Nav--%>

<div id="layoutSidenav">

    <%--    Slide nav--%>
    <jsp:include page="slideNav.jsp"/>
    <%--    End slide nav--%>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Trang chủ</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Trang chủ</li>
                </ol>
                <hr/>
            </div>
            <div class="row mx-5">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Sản phẩm</div>
                        <div
                                class="card-footer d-flex align-items-center justify-content-between"
                        >
                            <div class="small text-white">Số lượng: 10</div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Tài khoản</div>
                        <div
                                class="card-footer d-flex align-items-center justify-content-between"
                        >
                            <div class="small text-white">Số lượng: 10</div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Thể loại</div>
                        <div
                                class="card-footer d-flex align-items-center justify-content-between"
                        >
                            <div class="small text-white">Số lượng: 10</div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Hình ảnh</div>
                        <div
                                class="card-footer d-flex align-items-center justify-content-between"
                        >
                            <div class="small text-white">Số lượng: 10</div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Doanh thu</div>
                        <div
                                class="card-footer d-flex align-items-center justify-content-between"
                        >
                            <div class="small text-white">Tổng: 10</div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%--    Footer--%>
        <jsp:include page="footer.jsp"/>
        <%--    End footer--%>

    </div>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"
></script>
</body>
</html>
