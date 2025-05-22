<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 40px;
            text-align: center;
        }
        .error-box {
            background-color: #fff3f3;
            border: 1px solid #ffcccc;
            padding: 20px;
            border-radius: 8px;
            display: inline-block;
            max-width: 600px;
        }
        h1 {
            color: #cc0000;
        }
        p {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>Oops! Something went wrong.</h1>

        <p><strong>Status Code:</strong> ${requestScope['javax.servlet.error.status_code']}</p>
        <p><strong>Requested URI:</strong> ${requestScope['javax.servlet.error.request_uri']}</p>
        <p><strong>Servlet Name:</strong> ${requestScope['javax.servlet.error.servlet_name']}</p>

        <%
            Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
            if (throwable != null) {
        %>
            <p><strong>Exception:</strong> <%= throwable.getClass().getName() %></p>
            <p><strong>Message:</strong> <%= throwable.getMessage() %></p>
        <%
            }
        %>

        <p>${error}</p>

        <br/>
        <a href="/collegeNepal">Go to Home</a>
    </div>
</body>
</html>
