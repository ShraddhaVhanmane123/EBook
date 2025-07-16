<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body>
<%@include file="allComponent/navbar.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="form-container">
            <h3>Forgot Password</h3>
            <form action="forgotPassword" method="post">
                <div class="form-group">
                    <input type="email" name="email" placeholder="Enter your email" required class="form-control">
                </div>
                <button type="submit" class="btn btn-primary mt-2">Send OTP</button>
            </form>

            <c:if test="${not empty failedMsg}">
                <div class="message error">${failedMsg}</div>
                <c:remove var="failedMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty successMsg}">
                <div class="message success">${successMsg}</div>
                <c:remove var="successMsg" scope="session"/>
            </c:if>
        </div>
    </div>
</div>
<div class="container-fluid mt-5">
<%@include file="allComponent/footer.jsp" %>
</div>
</body>
</html>