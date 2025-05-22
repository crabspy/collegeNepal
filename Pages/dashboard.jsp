<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="Pages/dashboardStyle.css">
  <script>
    function confirmLogout(event) {
      if (!confirm("Are you sure you want to log out?")) {
        event.preventDefault();
      }
    }
  </script>
</head>
<body>

   <div class="top-banner">
    <div class="banner-left">
      <h1>Admin Dashboard</h1>
      <p>Manage Colleges – College Nepal</p>
    </div>
    <form class="logout-form" method="post" action="<c:url value='/LogoutServlet' />" onsubmit="confirmLogout(event)">
      <button type="submit" class="logout-button">Logout</button>
    </form>
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
  
  <div class="top-buttons">
  <div>
    <a href="<c:url value='/userProfile' />">
      <button class="profile-btn">View Profile</button>
    </a>
  </div>
  <div>
    <a href="<c:url value='/Pages/AddCollege.jsp' />">
      <button class="add-btn">Add College</button>
    </a>
  </div>
</div>


  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Location</th>
        <th>Affiliated University</th>
        <th>Type</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="college" items="${collegeList}">
        <tr>
          <td>${college.collegeName}</td>
          <td>${college.collegeAddress}</td>
          <td>${college.affiliatedUnivercity}</td>
          <td>${college.collegeType}</td>
          <td>
            <a href="${pageContext.request.contextPath}/EditCollegeController?collegeID=${college.collegeID}">
  				<button class="btn edit-btn">Edit</button>
			</a>
            <form method="post" action="<c:url value='/deleteCollege' />" onsubmit="return confirm('Are you sure you want to delete this college?');" style="display:inline;">
  				<input type="hidden" name="collegeID" value="${college.collegeID}" />
  				<button type="submit" class="btn delete-btn">Delete</button>
			</form>

          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

</body>
</html>
