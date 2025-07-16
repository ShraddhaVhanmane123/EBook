<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Index</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("allComponent/img/b1.jpg");
	height: 50vh;
	background-repeat: no-repeat;
	width: 100%;
	background-size: cover;
}
.crd-ho:hover {
	background-color: #f5f5d5;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
<%
	User u = (User) session.getAttribute("userobj");
%>
<%@include file="allComponent/navbar.jsp"%>

<div class="container-fluid back-img">
	<h2 class="text-center text-success">Ebook Management System</h2>
</div>

<!-- Start recent book -->
<div class="container">
	<h3 class="text-center">Recent book</h3>
	<div class="row">
	<%
	BooksDAOImpl dao2 = new BooksDAOImpl(DBConnect.getConn());
	List<BookDetails> list2 = dao2.getRecentBook();
	for (BookDetails book2 : list2) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=book2.getPhotoName()%>" class="img-thumblin" style="width: 150px; height: 200px">
					<p><%=book2.getBookName()%></p>
					<p><%=book2.getAuthor()%></p>
					<p>Categories: <%=book2.getBookCategory()%></p>
					
					<div class="row justify-content-center">
						<%
						String category = book2.getBookCategory().trim();
						if (!category.equalsIgnoreCase("Old")) {
							if (u == null) {
						%>
							<a href="login.jsp?bid=<%=book2.getBookId()%>" class="btn btn-danger btn-sm">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
						<%
							} else {
						%>
							<a href="cart?bid=<%=book2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
						<%
							}
						}
						%>
						<a href="view_books.jsp?bid=<%=book2.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
						<span class="btn btn-danger btn-sm ml-1">₹<%=book2.getPrice()%></span>
					</div>

				</div>
			</div>
		</div>
	<%
	}
	%>
	</div>
	<div class="text-center">
		<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
	</div>
</div>
<!-- End recent book -->

<hr>

<!-- Start new book -->
<div class="container">
	<h3 class="text-center">New book</h3>
	<div class="row">
	<%
	BooksDAOImpl dao4 = new BooksDAOImpl(DBConnect.getConn());
	List<BookDetails> list4 = dao4.getNewBook();
	for (BookDetails book4 : list4) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=book4.getPhotoName()%>" class="img-thumblin" style="width: 150px; height: 200px">
					<p><%=book4.getBookName()%></p>
					<p><%=book4.getAuthor()%></p>
					<p>Categories: <%=book4.getBookCategory()%></p>
					<div class="row justify-content-center">
						<%
						String category = book4.getBookCategory().trim();
						if (!category.equalsIgnoreCase("Old")) {
							if (u == null) {
						%>
							<a href="login.jsp?bid=<%=book4.getBookId()%>" class="btn btn-danger btn-sm">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
						<%
							} else {
						%>
							<a href="cart?bid=<%=book4.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
						<%
							}
						}
						%>
						<a href="view_books.jsp?bid=<%=book4.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
						<span class="btn btn-danger btn-sm ml-1">₹<%=book4.getPrice()%></span>
					</div>
				</div>
			</div>
		</div>
	<%
	}
	%>
	</div>
	<div class="text-center">
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
	</div>
</div>
<!-- End new book -->

<hr>

<!-- Start old book -->
<div class="container">
	<h3 class="text-center">Old book</h3>
	<div class="row">
	<%
	BooksDAOImpl dao3 = new BooksDAOImpl(DBConnect.getConn());
	List<BookDetails> list3 = dao3.getOldBook();
	for (BookDetails book3 : list3) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/<%=book3.getPhotoName()%>" class="img-thumblin" style="width: 150px; height: 200px">
					<p><%=book3.getBookName()%></p>
					<p><%=book3.getAuthor()%></p>
					<p>Categories: <%=book3.getBookCategory()%></p>
					<div class="row">
						<a href="view_books.jsp?bid=<%=book3.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
						<span class="btn btn-danger btn-sm ml-1">₹<%=book3.getPrice()%></span>
					</div>
				</div>
			</div>
		</div>
	<%
	}
	%>
	</div>
	<div class="text-center">
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
	</div>
</div>
<!-- End old book -->

<%@include file="allComponent/footer.jsp"%>
</body>
</html>
