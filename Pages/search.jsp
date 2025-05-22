<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Search Results - College Nepal</title>
  <link rel="stylesheet" href="Pages/homeStyle.css" />
</head>
<body>

<%@ include file="navbar.jsp" %>

<section class="hero">
  <h1>Search Results</h1>
  <p>Showing results for "<strong>${searchQuery}</strong>"</p>
</section>

<section class="section">
  <c:choose>
    <c:when test="${not empty searchResults}">
      <div class="colleges">
        <c:forEach var="college" items="${searchResults}">
        <a href="${pageContext.request.contextPath}/CollegeDetailsController?collegeID=${college.collegeID}" class="college-card-link">
          <div class="card">
            <img src="${college.photoPath}" alt="${college.collegeName}" />
            <div class="card-content">
              <h3>${college.collegeName}</h3>
              <p>Location: ${college.collegeAddress}</p>
              <p>Type: ${college.collegeType}</p>
              <p>Affiliated to: ${college.affiliatedUnivercity}</p>
            </div>
          </div>
          </a>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <p>No colleges found matching "<strong>${searchQuery}</strong>".</p>
    </c:otherwise>
  </c:choose>
</section>

</body>
</html>
