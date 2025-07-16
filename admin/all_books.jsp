<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: All Books</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>

    <div class="container mt-3">
        <h3 class="text-center">Hello Admin</h3>

        <c:if test="${not empty successmsg}">
            <p class="text-center text-success">${successmsg}</p>
            <c:remove var="successmsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedmsg}">
            <p class="text-center text-danger">${failedmsg}</p>
            <c:remove var="failedmsg" scope="session"/>
        </c:if>

        <table class="table table-striped mt-3">
            <thead class="bg-primary text-white">
                <tr>
                    <th>Id</th>
                    <th>Image</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
                    List<BookDetails> list = dao.getAllBooks();

                    if (list != null && !list.isEmpty()) {
                        for (BookDetails b : list) {
                %>
                    <tr>
                        <td><%= b.getBookId() %></td>
                        <td><img src="../book/<%= b.getPhotoName() %>" style="width: 50px; height: 50px;"></td>
                        <td><%= b.getBookName() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td>₹<%= b.getPrice() %></td>
                        <td><%= b.getBookCategory() %></td>
                        <td><%= b.getStatus() %></td>
                        <td>
                            <a href="edit_books.jsp?id=<%= b.getBookId() %>" class="btn btn-primary btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> Edit
                            </a>
                            <a href="../delete?id=<%= b.getBookId() %>" class="btn btn-danger btn-sm">
                                <i class="fa-solid fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="8" class="text-center text-danger">No books found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div style="margin-top: 100px">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
