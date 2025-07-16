<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EBook: Register</title>
    <%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="allComponent/navbar.jsp" %>

    <div class="container p-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <h4 class="text-center mt-2">Registration Page</h4>

                    <!-- Success Message -->
                    <c:if test="${not empty successMsg}">
                        <p class="text-center text-success">${successMsg}</p>
                        <c:remove var="successMsg" scope="session"/>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <!-- Registration Form -->
                    <div class="card-body">
                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="name">Name*</label>
                                <input type="text" class="form-control" id="name"
                                       required name="name">
                            </div>

                            <div class="form-group">
                                <label for="email">Email address*</label>
                                <input type="email" class="form-control" id="email"
                                       required name="email">
                            </div>

                            <div class="form-group">
                                <label for="phno">Phone No*</label>
                                <input type="number" class="form-control" id="phno"
                                       required name="phno">
                            </div>

                            <div class="form-group">
                                <label for="password">Password*</label>
                                <input type="password" class="form-control" id="password"
                                       required name="password">
                            </div>

                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" name="check" id="check">
                                <label class="form-check-label" for="check">
                                    Agree to terms and conditions
                                </label>
                            </div>

                            <button type="submit" class="btn btn-primary pt-1 mt-2">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="allComponent/footer.jsp" %>
</body>
</html>
