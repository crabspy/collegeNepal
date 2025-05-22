<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Home - College Nepal</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="Pages/homeStyle.css">
</head>
<body>
	<%@ include file="navbar.jsp" %>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Discover Colleges & Universities in Nepal</h1>
    <p>Find the best institutions, programs, and student reviews.</p>
    <div class="search-bar">
      <form action="searchServlet" method="get" class="search-bar">
  			<input type="text" name="query" placeholder="Search by college name, location, or program" required />
  			<button type="submit">Search</button>
		</form>

    </div>
  </section>

  <!-- Most Watchlisted Colleges Section -->
<section class="section">
  <h2>Most Watchlisted Colleges</h2>
  <div class="college-list">
    <c:forEach var="college" items="${colleges}" varStatus="status">
  	<a href="CollegeDetailsController?collegeID=${college.collegeID}" class="card-link">
    	<div class="card">
      		<div class="rank-number">#${status.index + 1}</div>
      			<img src="${college.photoPath}" style="width:15%; height:200px;" alt="${college.collegeName}" />
      			<div class="card-content">
        			<h3>${college.collegeName}</h3>
        			<p>Location: ${college.collegeAddress} &nbsp;&nbsp;&nbsp; Affiliated University:${college.affiliatedUnivercity }</p>
      			</div>
    	</div>
 	 </a>
	</c:forEach>

  </div>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>
