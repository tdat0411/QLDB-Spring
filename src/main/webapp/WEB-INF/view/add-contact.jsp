<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Add-Contact</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container">
                    <h1>Add New Contact</h1>
                    <form:form action="/add" method="post" modelAttribute="newContact">
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingInput" path="name" />
                            <label for="floatingInput">Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingPassword" path="phone" />
                            <label for="floatingPassword">Phone</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="email" class="form-control" id="floatingInput" path="email" />
                            <label for="floatingInput">Email</label>
                        </div>
                        <button type="submit">Save</button>
                    </form:form>
                </div>
            </body>

            </html>