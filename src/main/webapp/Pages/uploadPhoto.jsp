<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Enter your photo</h2>
	<form action ="${pageContext.request.contextPath}/UploadPhotoServlet" method = "post" enctype="multipart/form-data">
		<input type="file" name="image" accept="image/*" required> <br>
		<input type="submit" value="Upload"/>
	</form>
	<h2>Your uploaded photo</h2>
	<img src = "${path}" alt="Uploaded Image"/>
</body>
</html>