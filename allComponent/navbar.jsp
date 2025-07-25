<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Top Header Bar -->
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<!-- Logo | Search | Login/Register or Logout -->
<div class="container-fluid p-3 bg-light">
	<div class="row align-items-center">
		<!-- Logo -->
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> E-book
			</h3>
		</div>

		<!-- Search Form -->
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">

				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<!-- User Buttons -->
		<div class="col-md-3 text-right">


			<a href="checkout.jsp" class="mt-2"><i
				class="fa-solid fa-cart-plus fa-2x"></i></a>
			<c:choose>
				<c:when test="${not empty userobj}">
					<a href="#" class="btn btn-success"> <i
						class="fa-solid fa-user"></i> ${userobj.name}
					</a>
					<a href="logout" class="btn btn-primary text-white"> <i
						class="fas fa-sign-out-alt"></i> Logout
					</a>
				</c:when>
				<c:otherwise>
					<a href="login.jsp" class="btn btn-success"> <i
						class="fa-solid fa-right-to-bracket"></i> Login
					</a>
					<a href="register.jsp" class="btn btn-primary text-white"> <i
						class="fa-solid fa-user-plus"></i> Register
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-house-chimney"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
					New Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>
					Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 m-1"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</button>
		</form>
	</div>
</nav>
