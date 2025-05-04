<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Home - College Nepal</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link rel = "stylesheet" href = "homeStyle.css">
</head>
<body>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Discover Colleges & Universities in Nepal</h1>
    <p>Find the best institutions, programs, and student reviews.</p>
    <div class="search-bar">
      <input type="text" placeholder="Search by college name, location, or program" />
      <button>Search</button>
    </div>
  </section>

  <!-- Featured Colleges Section -->
  <section class="section">
    <h2>Featured Colleges</h2>
    <div class="colleges">
      <!-- Card Example -->
      <div class="card">
        <img src="/images/Kantipur International College" alt="College 1"/>
        <div class="card-content">
          <h3>College Name 1</h3>
          <p>Location: Kathmandu</p>
        </div>
      </div>
      <div class="card">
        <img src="Informatics College Pokhara" alt="College 2"/>
        <div class="card-content">
          <h3>College Name 2</h3>
          <p>Location: Pokhara</p>
        </div>
      </div>
      <div class="card">
        <img src="Patan Multiple Campus" alt="College 3"/>
        <div class="card-content">
          <h3>College Name 3</h3>
          <p>Location: Lalitpur</p>
        </div>
      </div>
      <!-- Add more cards as needed -->
    </div>
  </section>



</body>
</html>
    