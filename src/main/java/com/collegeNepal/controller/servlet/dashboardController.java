package com.collegeNepal.controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegeNepal.model.College;

/**
 * Servlet implementation class dashboardController
 */
@WebServlet("/dashboardController")
public class dashboardController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialize database connection
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegeNepaldb", "root", "");

            // Retrieve admin name
            stmt = conn.prepareStatement("SELECT name FROM users WHERE userID = ?");
            stmt.setInt(1, 114); // Assuming admin ID is 1
            rs = stmt.executeQuery();
            String adminName = "";
            if (rs.next()) {
                adminName = rs.getString("name");
            }
            request.setAttribute("adminName", adminName);
            rs.close();
            stmt.close();

            // Retrieve total colleges
            stmt = conn.prepareStatement("SELECT COUNT(*) AS total FROM colleges");
            rs = stmt.executeQuery();
            int totalColleges = 0;
            if (rs.next()) {
                totalColleges = rs.getInt("total");
            }
            request.setAttribute("totalColleges", totalColleges);
            rs.close();
            stmt.close();

            // Retrieve total users
            stmt = conn.prepareStatement("SELECT COUNT(*) AS total FROM users");
            rs = stmt.executeQuery();
            int totalUsers = 0;
            if (rs.next()) {
                totalUsers = rs.getInt("total");
            }
            request.setAttribute("totalUsers", totalUsers);
            rs.close();
            stmt.close();

            // Retrieve reviews submitted
            stmt = conn.prepareStatement("SELECT COUNT(*) AS total FROM reviews");
            rs = stmt.executeQuery();
            int totalReviews = 0;
            if (rs.next()) {
                totalReviews = rs.getInt("total");
            }
            request.setAttribute("totalReviews", totalReviews);
            rs.close();
            stmt.close();

            // Retrieve list of colleges
            stmt = conn.prepareStatement("SELECT collegeID, collegeName, address, type, affiliatedUniversity FROM colleges");
            rs = stmt.executeQuery();
            List<College> collegeList = new ArrayList<>();
            while (rs.next()) {
                College college = new College();
                college.setCollegeID(rs.getInt("collegeID"));
                college.setCollegeName(rs.getString("collegeName"));
                college.setCollegeAddress(rs.getString("address"));
                college.setCollegeType(rs.getString("type"));
                college.setAffiliatedUnivercity(rs.getString("affiliatedUniversity"));
                collegeList.add(college);
            }
            request.setAttribute("collegeList", collegeList);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/dashboard.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
