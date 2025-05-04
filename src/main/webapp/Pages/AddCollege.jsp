<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add College</title>
  <link rel="stylesheet" href="addCollege.css">
  
</head>
<body>

  <div class="form-container">
    <h2>Add College</h2>
    <form action="AddCollege.jsp" method="post" enctype="multipart/form-data">
      <label for="collegeName">College Name</label>
      <input type="text" id="collegeName" name="collegeName" required>

      <label for="location">Location</label>
      <input type="text" id="location" name="location" required>

      <label for="collegePhoto">College Photo</label>
      <input type="file" id="collegePhoto" name="collegePhoto" accept="image/*" required>

      <button type="submit">Add College</button>
    </form>

    <div class="back-link">
      <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>
  </div>

</body>
</html>
