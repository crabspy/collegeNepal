<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<link rel="stylesheet" type="text/css" href="Pages/navbarStyle.css">
<script>
  function confirmLogout(event) {
    if (!confirm("Are you sure you want to log out?")) {
      event.preventDefault(); // Cancel form submission if user cancels
    }
  }
</script>
</head>
<body>
<div class="navbar">
  <a href="<c:url value='/homeServlet' />">Home</a>
  <a href="<c:url value='/AllCollegesController' />">All Colleges</a>
  <a href="<c:url value='/userProfile' />">Profile</a>
  <a href="<c:url value='/WatchlistCompare' />">Compare from Watchlist</a>
   <!-- Logout Form -->
  <form class="logout-form" action="<c:url value='/LogoutServlet' />" method="post" onsubmit="confirmLogout(event)">
    <button type="submit" class="logout-button">Logout</button>
  </form>
</div>
</body>
</html>