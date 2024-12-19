<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Edit-Contact</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container">
                    <h1>Edit Contact</h1>
                    <form:form action="/edit" method="post" modelAttribute="newContact">
                        <div class="mb-3" style="display: none;">
                            <label class="form-label">Id:</label>
                            <form:input type="text" class="form-control" path="id" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <form:input type="text" class="form-control" path="name" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <form:input type="text" class="form-control" path="phone" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input type="email" class="form-control" path="email" />
                        </div>
                        <button type="submit">Edit</button>
                    </form:form>
                </div>
            </body>

            </html>