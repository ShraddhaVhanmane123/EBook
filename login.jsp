<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Login</title>
<%@include file="allComponent/allCss.jsp"%>
<script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
						<c:if test="${not empty failedmsg }">
							<h5 class="text-center text-danger">${failedmsg}</h5>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<c:if test="${not empty successmsg }">
							<h5 class="text-center text-success">${successmsg}</h5>
							<c:remove var="successmsg" scope="session" />
						</c:if>
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="forgot_password.jsp">Forgot Password?</a><br>
								<a href="register.jsp">Create Account</a>
							</div>

							<div id="g_id_onload"
								data-client_id="203781837349-1b9h1dvfr8o7f458ivptm3bacpekpa3q.apps.googleusercontent.com"
								data-login_uri="http://localhost:8080/Ebook-Appfinal/googleLogin"
								data-auto_prompt="false"></div>

							<div class="g_id_signin" data-type="standard"
								data-shape="rectangular" data-theme="outline"
								data-text="sign_in_with" data-size="large"
								data-logo_alignment="left"></div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allComponent/footer.jsp"%>
</body>
</html>