<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit College</title>
  <link rel="stylesheet" href="Pages/addCollege.css">
</head>
<body>

  <div class="form-container">
    <h2>Edit College</h2>
    <form action="${pageContext.request.contextPath}/UpdateCollegeServlet" method="post">
      <input type="hidden" name="collegeID" value="${college.collegeID}"/>

      <label for="collegeName">College Name</label>
      <input type="text" id="collegeName" name="collegeName" value="${college.collegeName}" required>

      <label for="location">Location</label>
      <input type="text" id="location" name="location" value="${college.collegeAddress}" required>

      <label for="type">Type</label>
      <input type="text" id="type" name="type" value="${college.collegeType}" required>

      <label for="affiliatedUniversity">Affiliated University</label>
      <input type="text" id="affiliatedUniversity" name="affiliatedUniversity" value="${college.affiliatedUnivercity}" required>

      <button type="submit">Save Changes</button>
    </form>

    <div class="back-link">
      <a href="<c:url value='/DashboardController'/>">← Back to Dashboard</a>
    </div>
  </div>

</body>
</html>
