
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
.bluewhite-footer {
  background-color: #ffffff;
  color: #1e3a8a;
  padding: 40px 20px 10px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  border-top: 3px solid #2563eb; /* Blue border on top */
}

.footer-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1100px;
  margin: 0 auto;
}

.footer-container > div {
  flex: 1 1 250px;
  margin: 10px;
}

.footer-about h3 {
  font-size: 22px;
  margin-bottom: 10px;
  color: #1e3a8a;
}

.footer-about p {
  color: #475569;
}

.footer-links h4,
.footer-contact h4 {
  font-size: 18px;
  margin-bottom: 10px;
  color: #1e3a8a;
}

.footer-links ul {
  list-style: none;
  padding: 0;
}

.footer-links li {
  margin-bottom: 8px;
}

.footer-links a {
  color: #2563eb;
  text-decoration: none;
}

.footer-links a:hover {
  text-decoration: underline;
}

.footer-contact p {
  margin: 5px 0;
  color: #475569;
}

.footer-bottom {
  text-align: center;
  padding-top: 20px;
  font-size: 14px;
  color: #64748b;
  border-top: 1px solid #e2e8f0;
  margin-top: 20px;
}

</style>
</head>
<body>
<footer class="bluewhite-footer">
  <div class="footer-container">
    <div class="footer-about">
      <h3>College Nepal</h3>
      <p>Your trusted platform to compare and find the best colleges in Nepal.</p>
    </div>
    <div class="footer-links">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="<c:url value='/homeServlet' />">Home</a></li>
        <li> <a href="<c:url value='/AllCollegesController' />">All Colleges</a></li>
        <li><a href="<c:url value='/userProfile' />">Profile</a></li>
        <li><a href="<c:url value='/Pages/watchlistCompare.jsp' />">Compare Colleges</a></li>
      </ul>
    </div>
    <div class="footer-contact">
      <h4>Contact Us</h4>
      <p>Email: info@collegenepal.com</p>
      <p>Phone: +977-1-1234567</p>
    </div>
  </div>
  <div class="footer-bottom">
    <p>&copy; 2025 College Nepal. All rights reserved.</p>
  </div>
</footer>


</body>
</html>