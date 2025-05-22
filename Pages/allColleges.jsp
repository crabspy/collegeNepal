<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.collegeNepal.model.College" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Colleges</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="allCollegesStyle.css">

</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <h2 class="text-center mb-4 text-primary">All Colleges</h2>

    <c:if test="${not empty sessionScope.watchlistMessage}">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            ${sessionScope.watchlistMessage}
            <%
                session.removeAttribute("watchlistMessage"); // clear after showing
            %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Filter Form -->
    <form method="get" action="${pageContext.request.contextPath}/AllCollegesController" class="mb-4">
        <div class="row g-2 align-items-center">
            <div class="col-auto">
                <select name="type" class="form-select">
                    <option value="">-- All Types --</option>
                    <option value="Public" <%= "Public".equals(request.getParameter("type")) ? "selected" : "" %>>Public colleges</option>
                    <option value="Private" <%= "Private".equals(request.getParameter("type")) ? "selected" : "" %>>Private college</option>
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Filter</button>
                <a href="${pageContext.request.contextPath}/AllCollegesController" class="btn btn-secondary">Clear</a>
            </div>
        </div>
    </form>

    <div class="row g-4">
        <%
            List<College> colleges = (List<College>) request.getAttribute("colleges");
            for (College college : colleges) {
        %>
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/CollegeDetailsController?collegeID=<%= college.getCollegeID() %>" class="college-card-link">
                <div class="college-card border rounded p-2">
                    <img src="<%= college.getPhotoPath() %>" alt="College Image" style="width:100%; height:200px;" class="college-image mb-2">
                    <div class="college-info">
                        <div class="college-title fs-5 fw-bold"><%= college.getCollegeName() %></div>
                        <p class="text-muted mb-1"><strong>Address:</strong> <%= college.getCollegeAddress() %></p>
                        <p class="text-muted mb-1"><strong>Type:</strong> <%= college.getCollegeType() %></p>
                        <p class="text-muted mb-2"><strong>University:</strong> <%= college.getAffiliatedUnivercity() %></p>
                    </div>
                </div>
            </a>

            <!-- Separate form for "Add to Watchlist" -->
            <form method="post" action="${pageContext.request.contextPath}/AddToWatchlist" class="mt-2">
            	<input type="hidden" name="returnUrl" value="${pageContext.request.requestURI}" />
                <input type="hidden" name="collegeID" value="<%= college.getCollegeID() %>">
                <button type="submit" class="btn btn-outline-primary btn-sm watchlist-btn">Add to Watchlist</button>
            </form>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>
</body>
</html>
