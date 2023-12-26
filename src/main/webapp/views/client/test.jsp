<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="link_css" value="/web/css"/>
<c:set var="link_js" value="/web/js"/>
<c:set var="link_img" value="/web/images"/>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="java.text.resources"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${user != null}">
    <h1>Chào mừng ${user.toString()} đến với trang web của chúng tôi</h1>
</c:if>
<c:if test="${cart != null}">
    <h1>Giỏ hàng của bạn có ${cart.toString()} sản phẩm</h1>
</c:if>
<br>
${mess}
</body>
</html>
