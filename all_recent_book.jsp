<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f5f5d5;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BooksDAOImpl dao2 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getAllRecentBook();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>" class="img-thumblin"
							style="width: 100px; height: 150px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div
							class="row <%=b.getBookCategory().equals("Old") ? "" : "justify-content-center"%>">
							<%
							if (b.getBookCategory().equals("New")) {
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>"
								class="btn btn-danger btn-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details </a> <span
								class="btn btn-danger btn-sm ml-1">₹<%=b.getPrice()%></span>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>



	</div>
</body>
</html>