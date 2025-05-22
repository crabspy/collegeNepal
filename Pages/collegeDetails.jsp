<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.collegeNepal.model.College" %>
<%@ page import="com.collegeNepal.model.Course" %>
<%@ page import="com.collegeNepal.model.Review" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>College Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="collegeDetailsStyle.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <%
        College college = (College) request.getAttribute("college");
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    %>

    <h2 class="mb-4 text-primary"><%= college.getCollegeName() %></h2>
    <p><strong>Address:</strong> <%= college.getCollegeAddress() %></p>
    <p><strong>Type:</strong> <%= college.getCollegeType() %></p>
    <p><strong>Affiliated University:</strong> <%= college.getAffiliatedUnivercity() %></p>
    <img src="<%= college.getPhotoPath() %>" alt="College Image" class="img-fluid mb-4" style="max-height: 250px;">

    <h4>Courses Offered</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Duration</th>
                <th>Fee</th>
            </tr>
        </thead>
        <tbody>
            <% for (Course course : courses) { %>
            <tr>
                <td><%= course.getCourseName() %></td>
                <td><%= course.getDuration() %></td>
                <td>Rs. <%= course.getFee() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<!-- Separate form for "Add to Watchlist" -->
<form method="post" action="${pageContext.request.contextPath}/AddToWatchlist" class="mt-2">
	<input type="hidden" name="returnUrl" value="${pageContext.request.requestURI}" />
	<input type="hidden" name="collegeID" value="<%= college.getCollegeID() %>">
    <button type="submit" class="btn btn-outline-primary btn-sm watchlist-btn">Add to Watchlist</button>
</form>

<!-- Reviews Section -->
    <div class="mt-5">
        <h4 class="text-secondary">Reviews</h4>
        <%
            if (reviews != null && !reviews.isEmpty()) {
        %>
            <div class="list-group">
                <% for (Review review : reviews) { %>
                    <div class="list-group-item mb-2">
                        <p><strong>Rating:</strong> <%= review.getRating() %>/5</p>
                        <p><strong>Comment:</strong> <%= review.getComment() %></p>
                    </div>
                <% } %>
            </div>
        <%
            } else {
        %>
            <p>No reviews available for this college.</p>
        <%
            }
        %>
    </div>

<%@ include file="footer.jsp" %>
</body>
</html>