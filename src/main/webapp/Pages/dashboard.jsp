<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="Pages/dashboardStyle.css">
</head>
<body>

  <div class="top-banner">
    <h1>Admin Dashboard</h1>
    <p>Manage Colleges – College Nepal</p>
  </div>

  <div class="welcome-text">
    Welcome, ${adminName}
  </div>

  <div class="stats">
    <div class="stat-box">
      <h3>Total Colleges</h3>
      <p>${totalColleges}</p>
    </div>
    <div class="stat-box">
      <h3>Total Users</h3>
      <p>${totalUsers}</p>
    </div>
    <div class="stat-box">
      <h3>Reviews Submitted</h3>
      <p>${totalReviews}</p>
    </div>
  </div>

  <div class="section-title">Manage College Listings </div>

  <div class="add-btn-container">
    <a href="AddCollege.jsp">
      <button class="add-btn">Add College</button>
    </a>
  </div>

  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Location</th>
        <th>Type</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="college" items="${collegeList}">
        <tr>
          <td>${college.collegeName}</td>
          <td>${college.collegeAddress}</td>
          <td>${college.collegeType}</td>
          <td>
            <button class="btn edit-btn">Edit</button>
            <button class="btn delete-btn">Delete</button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

</body>
</html>
