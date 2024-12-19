<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>QLDB</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="container">
                <h1>Contact List</h1>
                <a href="/add">Add New Contact</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <c:forEach var="contact" items="${contacts}">
                        <tr>
                            <td>${contact.name}</td>
                            <td>${contact.phone}</td>
                            <td>${contact.email}</td>
                            <td>
                                <a href="/edit/${contact.id}">Edit</a>
                                <a href="/delete/${contact.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                href="/contacts?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                            <li class="page-item"><a
                                    class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                    href="/contacts?page=${loop.index + 1}">${loop.index + 1}</a></li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                href="/contacts?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </body>

        </html>