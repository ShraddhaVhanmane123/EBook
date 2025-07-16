<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>


						<%
						String idStr = request.getParameter("id");
						int id = 0;
						BookDetails b = null;

						if (idStr != null && !idStr.trim().isEmpty()) {
							try {
								id = Integer.parseInt(idStr);
								BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
								b = dao.getBookById(id);
							} catch (NumberFormatException e) {
								out.println("<p class='text-danger text-center'>Invalid book ID format.</p>");
								return;
							}
						} else {
							out.println("<p class='text-danger text-center'>Book ID is missing in URL.</p>");
							return;
						}
						%>

						<form action="../edit_books" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookId() %>">
						
							<div class="form-group">
								<label for="bookName">Book Name*</label>
								<input type="text" class="form-control" id="bookName"
									required name="bname" value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="author">Author Name*</label>
								<input type="text" class="form-control" id="author"
									required name="aname" value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="price">Price</label>
								<input type="number" class="form-control" id="price"
									required name="price" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label>
								<select id="inputState" name="bstatus" class="form-control">
									<option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
									<option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
								</select>
							</div>

							<!-- Optionally add a hidden field for ID if needed -->
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<button type="submit" class="btn btn-primary pt-1 mt-1">Update Book</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
