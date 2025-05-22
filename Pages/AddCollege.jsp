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
    <form action="${pageContext.request.contextPath}/AddCollegeServlet" method="post" enctype="multipart/form-data">
      <label for="collegeName">College Name</label>
      <input type="text" id="collegeName" name="collegeName" required>

      <label for="location">Location</label>
      <input type="text" id="location" name="location" required>
      
      <label for="type">Type</label>
      <input type="text" id="type" name="type" required>
      
      <label for="affiliatedUniversity">Affiliated University</label>
      <input type="text" id="affiliatedUniversity" name="affiliatedUniversity" required>


      <button type="submit">Add College</button>
    </form>

    <div class="back-link">
      <a href="../DashboardController">← Back to Dashboard</a>
    </div>
  </div>

</body>
</html>
