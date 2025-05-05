<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Profile Form</title>
  <link rel="stylesheet" href="editUserprofileStyle.css">
</head>
<body>

  <div class="edit-form">
    <form>
      <label for="name">Name</label>
      <input type="text" id="name" placeholder="Enter your name">

      <label for="email">Email</label>
      <input type="email" id="email" placeholder="Enter your email">

      <label for="phone">Phone</label>
      <input type="tel" id="phone" placeholder="Enter your phone number">

      <label for="address">Address</label>
      <input type="text" id="address" placeholder="Enter your address">

      <button type="submit" class="save-btn">Save Changes</button>
    </form>
    <div class="back-link">
      <a href="userProfile.jsp">Back to User Profile </a>
    </div>
  </div>

</body>
</html>
