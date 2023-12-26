<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="${link_css}/admin-add.css">
    <style>
        .error {
            color: red;
            text-align: left;
            font-weight: bold;
            width: 100%;
        }
    </style>
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
                    <li class="breadcrumb-item active">Tài khoản</li>
                    <li class="breadcrumb-item active">Thêm tài khoản</li>
                </ol>
                <hr/>
                <section id="content" class="container">
                    <%--@elvariable id="user" type=""--%>
                    <form:form method="post" modelAttribute="user" enctype="multipart/form-data">
                        <h1 class="heading">Form nhập thông tin</h1>
                        <hr>
                        <label><b>Tên đăng nhập</b></label>
                        <form:input type="text" path="username" placeholder="Nhập tên đăng nhập" name="username"
                                    required="required"/>
                        <form:errors path="username" class="error"/>

                        <label><b>Mật khẩu</b></label>
                        <form:input type="password" path="password"
                                    placeholder="Nhập mật khẩu"
                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{8,}"
                                    title="Mật khẩu phải từ 8 ký tự trở lên, chứa ít nhất 1 ký tự viết hoa, 1 ký tự số và nằm trong a-z A-z 0-9"
                                    name="password" required="required"/>
                        <form:errors path="password" class="error"/>

                        <label><b>Xác nhận mật khẩu</b></label>
                        <form:input type="password" path="confirmPassword"
                                    name="confirmPassword" required="required"
                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{8,}"
                                    title="Mật khẩu phải từ 8 ký tự trở lên, chứa ít nhất 1 ký tự viết hoa, 1 ký tự số và nằm trong a-z A-z 0-9"
                                    placeholder="Xác nhận mật khẩu"/>
                        <form:errors path="confirmPassword" class="error"/>

                        <label><b>Họ tên</b></label>
                        <form:input type="text" path="name" name="name" placeholder="Nhập họ và tên"
                                    required="required"/>
                        <form:errors path="name" class="error"/>

                        <label><b>Số điện thoại</b></label>
                        <input type="tel" placeholder="Nhập số điện thoại" name="phone"/>

                        <label><b>Email</b></label>
                        <input type="email" placeholder="Nhập email" name="email"/>

                        <label><b>Địa chỉ</b></label>
                        <input type="text" placeholder="Nhập địa chỉ" name="address"/>

                        <div class="clearfix">
                            <input type="submit" name="add" value="Thêm" class="btnAdd"></input>
                        </div>
                    </form:form>
                </section>
            </div>
        </main>
        <%--    Footer--%>
        <jsp:include page="footer.jsp"/>
        <%--    End footer--%>

    </div>
</div>
</body>
</html>
