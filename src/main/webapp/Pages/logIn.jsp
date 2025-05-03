<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="logInStyle.css">
<title>Login - College Nepal</title>
</head>
<body>
	<div class="login-container">
    <h2>Log into your College Nepal Account</h2>
    <!-- Error Message Display -->
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"> Close</button>
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>
    <form action="${pageContext.request.contextPath}/LogInController" method="post">
        <label for="email">e-Mail</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="login">
    </form>
    <a style="width: 20px; margin-left: 135px;">or</a>
    <a class="create-account" href="register.jsp">Create New Account</a>
</div>
</body>
</html>