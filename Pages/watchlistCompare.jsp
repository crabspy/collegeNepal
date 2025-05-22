<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.collegeNepal.model.College" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    List<College> watchlist = (List<College>) request.getAttribute("watchlist");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Compare Colleges</title>
    <link rel="stylesheet" href="allCollegesStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <h2 class="text-center text-primary">Compare Colleges from Watchlist</h2>

    <form method="post" action="${pageContext.request.contextPath}/CompareColleges">
        <div class="row mb-4">
            <div class="col-md-5">
                <label for="college1" class="form-label">Select First College</label>
                <select class="form-select" name="college1" required>
                    <option value="">-- Choose College --</option>
                    <c:forEach var="college" items="${watchlist}">
                        <option value="${college.collegeID}">${college.collegeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-5">
                <label for="college2" class="form-label">Select Second College</label>
                <select class="form-select" name="college2" required>
                    <option value="">-- Choose College --</option>
                    <c:forEach var="college" items="${watchlist}">
                        <option value="${college.collegeID}">${college.collegeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Compare</button>
            </div>
        </div>
    </form>

    <div class="row">
        <c:forEach var="college" items="${watchlist}">
            <div class="col-md-4">
                <div class="college-card p-2">
                    <img src="${college.photoPath}" class="college-image mb-2" style="width:100%; height:200px; alt="Image">
                    <div class="college-info">
                        <div class="college-title">${college.collegeName}</div>
                        <p><strong>Address:</strong> ${college.collegeAddress}</p>
                        <p><strong>Type:</strong> ${college.collegeType}</p>
                        <p><strong>University:</strong> ${college.affiliatedUnivercity}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<%@ include file="footer.jsp" %>
</body>
</html>
