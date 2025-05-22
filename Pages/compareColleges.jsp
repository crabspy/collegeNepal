<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.collegeNepal.model.College" %>
<%@ page import="com.collegeNepal.model.Course" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Compare Colleges</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="navbar.jsp" %>

<%
    College college1 = (College) request.getAttribute("college1");
    College college2 = (College) request.getAttribute("college2");
    List<Course> courses1 = (List<Course>) request.getAttribute("courses1");
    List<Course> courses2 = (List<Course>) request.getAttribute("courses2");
%>

<div class="container mt-5">
    <h2 class="text-primary mb-4">Compare Colleges</h2>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Details</th>
                <th><%= college1.getCollegeName() %></th>
                <th><%= college2.getCollegeName() %></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Address</strong></td>
                <td><%= college1.getCollegeAddress() %></td>
                <td><%= college2.getCollegeAddress() %></td>
            </tr>
            <tr>
                <td><strong>Type</strong></td>
                <td><%= college1.getCollegeType() %></td>
                <td><%= college2.getCollegeType() %></td>
            </tr>
            <tr>
                <td><strong>Affiliated University</strong></td>
                <td><%= college1.getAffiliatedUnivercity() %></td>
                <td><%= college2.getAffiliatedUnivercity() %></td>
            </tr>
            <tr>
                <td><strong>Photo</strong></td>
                <td><img src="<%= college1.getPhotoPath() %>" alt="College 1" style="max-height: 200px;" class="img-fluid"></td>
                <td><img src="<%= college2.getPhotoPath() %>" alt="College 2" style="max-height: 200px;" class="img-fluid"></td>
            </tr>
        </tbody>
    </table>

    <h4 class="mt-4 text-secondary">Courses Comparison</h4>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Course Details</th>
                <th><%= college1.getCollegeName() %></th>
                <th><%= college2.getCollegeName() %></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Course Name</strong></td>
                <td>
                    <ul>
                        <% for (Course c : courses1) { %>
                            <li><%= c.getCourseName() %></li>
                        <% } %>
                    </ul>
                </td>
                <td>
                    <ul>
                        <% for (Course c : courses2) { %>
                            <li><%= c.getCourseName() %></li>
                        <% } %>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><strong>Duration</strong></td>
                <td>
                    <ul>
                        <% for (Course c : courses1) { %>
                            <li><%= c.getDuration() %></li>
                        <% } %>
                    </ul>
                </td>
                <td>
                    <ul>
                        <% for (Course c : courses2) { %>
                            <li><%= c.getDuration() %></li>
                        <% } %>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><strong>Fee</strong></td>
                <td>
                    <ul>
                        <% for (Course c : courses1) { %>
                            <li>Rs. <%= c.getFee() %></li>
                        <% } %>
                    </ul>
                </td>
                <td>
                    <ul>
                        <% for (Course c : courses2) { %>
                            <li>Rs. <%= c.getFee() %></li>
                        <% } %>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
