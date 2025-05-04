<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="dashboardStyle.css">
  
</head>
<body>

  <div class="top-banner">
    <h1>Admin Dashboard</h1>
    <p>Manage Colleges – College Nepal</p>
  </div>

  <div class="welcome-text">
    Welcome, <!-- Admin Name from database -->
  </div>

  <div class="stats">
    <div class="stat-box">
      <h3>Total Colleges</h3>
      <p><!-- Total colleges from database --></p>
    </div>
    <div class="stat-box">
      <h3>Total Users</h3>
      <p><!-- Total Users form database--></p>
    </div>
    <div class="stat-box">
      <h3>Reviews Submitted</h3>
      <p><!-- Review count from database --></p>
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
        <th>Status</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <!-- Repeat this row dynamically for each college from the database -->
      <tr>
        <td><!-- College Name --></td>
        <td><!-- College Location --></td>
        <td><!-- College Status --></td>
        <td>
          <button class="btn edit-btn">Edit</button>
          <button class="btn delete-btn">Delete</button>
        </td>
      </tr>
      <tr>
        <td><!-- College Name --></td>
        <td><!-- College Location --></td>
        <td><!-- College Status --></td>
        <td>
          <button class="btn edit-btn">Edit</button>
          <button class="btn delete-btn">Delete</button>
        </td>
      </tr>
      <tr>
        <td><!-- College Name --></td>
        <td><!-- College Location --></td>
        <td><!-- College Status --></td>
        <td>
          <button class="btn edit-btn">Edit</button>
          <button class="btn delete-btn">Delete</button>
        </td>
      </tr>
      <!-- End of repeated rows -->
    </tbody>
  </table>

</body>
</html>
