<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.collegeNepal.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.collegeNepal.model.College" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("logIn.jsp");
        return;
    }
    List<College> watchlist = (List<College>) request.getAttribute("watchlist");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <link rel="stylesheet" href="Pages/userProfileStyle.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<% if ("student".equalsIgnoreCase(user.getRole())) { %>
  <%@ include file="navbar.jsp" %>
<% } %>

<div class="top-banner">
  <h1>User Profile</h1>
  <p>Manage Your Profile – College Nepal</p>
</div>

<div class="welcome-bar">
  <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
    <a href="<c:url value='/DashboardController' />" class="back-button">Back to Dashboard</a>
  <% } %>
  <div class="welcome-text">
    Welcome, <%= user.getName() %>
  </div>
</div>

<div class="profile-container">
  <div class="profile-info">
    <h3>Personal Information</h3>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Role:</strong> <%= user.getRole() %></p>
  </div>

  <div class="profile-info">
    <h3>Account Details</h3>
    <p><strong>Username:</strong> <%= user.getEmail().split("@")[0] %></p>
    <p><strong>Member Since:</strong> <%= user.getCreatedAt() %></p>
  </div>

  <!-- Watchlist Section -->
  <div class="profile-info mt-4">
    <h3>Watchlist</h3>
    <% if (watchlist != null && !watchlist.isEmpty()) { %>
      <div class="row">
        <% for (College college : watchlist) { %>
          <div class="col-md-4 mb-3">
            <div class="card h-100">
              <img src="<%= college.getPhotoPath() %>" class="card-img-top" alt="College Image" style="height: 180px; object-fit: cover;">
              <div class="card-body">
                <h5 class="card-title"><%= college.getCollegeName() %></h5>
                <p class="card-text"><strong>Address:</strong> <%= college.getCollegeAddress() %></p>
                <p class="card-text"><strong>Type:</strong> <%= college.getCollegeType() %></p>
                <p class="card-text"><strong>University:</strong> <%= college.getAffiliatedUnivercity() %></p>
                <form method="post" action="<c:url value='/DeleteFromWatchlistServlet' />" onsubmit="return confirm('Are you sure you want to remove this college from your watchlist?');">
                  <input type="hidden" name="collegeID" value="<%= college.getCollegeID() %>" />
                  <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
              </div>
            </div>
          </div>
        <% } %>
      </div>
    <% } else { %>
      <p>You have no colleges in your watchlist.</p>
    <% } %>
  </div>
</div>


<%@ include file="footer.jsp" %>
</body>
</html>
