<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="registerStyle.css">
<title>Register - College Nepal</title>
</head>
<body>
	<div class="register-container">
    <h2>Create new College Nepal Account</h2>
    <!-- Error Message Display -->
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">Close</button>
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>
    <form action="${pageContext.request.contextPath}/RegisterController" method="post">
    	<label for="email">e-Mail Adress</label>
        <input type="email" name="studentEmail" id="email" required>        
        
        <label for="username">Username</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>
        
        <label for="passwordConfirm">Confirm Password</label>
        <input type="password" name="passwordConfirm" id="passwordConfirm" required>

        <input type="submit" value="Create Account">
    </form>
    <a style="width: 20px; margin-left: 135px;">or</a>
    <a class="logIn" href="logIn.jsp">Login to Existing Account</a>
	</div>
	
</body>
</html>