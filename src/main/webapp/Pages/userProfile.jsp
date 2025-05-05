<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <link rel="stylesheet" href="userProfileStyle.css">
</head>
<body>

  <div class="top-banner">
    <h1>User Profile</h1>
    <p>Manage Your Profile – College Nepal</p>
  </div>

  <div class="welcome-text">
    Welcome, <!-- User Name from database -->
  </div>

  <div class="profile-container">
    <div class="profile-info">
      <h3>Personal Information</h3>
      <p><strong>Name:</strong> <!-- User Name from database --></p>
      <p><strong>Email:</strong> <!-- User Email from database --></p>
      <p><strong>Phone:</strong> <!-- User Phone Number from database --></p>
      <p><strong>Address:</strong> <!-- User Address from database --></p>
    </div>

    <div class="profile-info">
      <h3>Account Details</h3>
      <p><strong>Username:</strong> <!-- User Username from database --></p>
      <p><strong>Member Since:</strong> <!-- Member Since Date from database --></p>
    </div>

    <div class="edit-btn-container">
      <a href="editUserprofile.jsp">
        <button class="edit-btn">Edit Profile</button>
      </a>
    </div>
    
  </div>

</body>
</html>
