<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./partials/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile</title>

    <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
</head>
<body class="bg-gray-100 font-sans leading-relaxed">

<c:set var="user" value="${user}"/> 
  <!-- Profile Section -->
  <main class="container mx-auto py-12 px-6">
    <div class="bg-white shadow-2xl rounded-3xl p-10 max-w-5xl mx-auto">
      <div class="flex flex-col md:flex-row items-center md:items-start space-y-10 md:space-y-0 md:space-x-12">

        <!-- Avatar and Name -->
        <div class="flex flex-col items-center text-center">
          <div class="w-36 h-36 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center text-6xl shadow-inner">
            <i class="fas fa-user-circle"></i>
          </div>
          <h1 class="mt-4 text-2xl font-semibold text-gray-800"><c:out value="${user.fullname}"/></h1>
          <p class="text-gray-500 text-sm">Patient ID: <c:out value="${user.userid}"/></p>
        </div>

        <!-- Profile Info -->
        <div class="w-full">
          <h2 class="text-xl font-bold text-gray-700 mb-6 border-b pb-2"><i class="fas fa-user-tag mr-2 text-blue-600"></i>Profile Information</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-700 text-base">
            <div><i class="fas fa-envelope mr-2 text-blue-500"></i><strong>Email:</strong><c:out value="${user.email}"/></div>
            <div><i class="fas fa-phone-alt mr-2 text-blue-500"></i><strong>Phone:</strong><c:out value="${user.phone}"/></div>
            <div><i class="fas fa-map-marker-alt mr-2 text-blue-500"></i><strong>Address:</strong><c:out value="${user.address}"/></div>
            <div><i class="fas fa-venus-mars mr-2 text-blue-500"></i><strong>Gender:</strong><c:out value="${user.gender}"/></div>
            <div><i class="fas fa-birthday-cake mr-2 text-blue-500"></i><strong>DOB:</strong><c:out value="${user.dob}"/></div>
            <div><i class="fas fa-tint mr-2 text-blue-500"></i><strong>Blood Group:</strong><c:out value="${user.bloodgroup}"/></div>
            <div><i class="fas fa-notes-medical mr-2 text-blue-500"></i><strong>Medical Condition:</strong><c:out value="${user.medicalcon}"/></div>
          </div>

          <!-- Action Buttons -->
          <div class="mt-10 flex flex-col sm:flex-row gap-4">
            <a href="editprofile.jsp" class="flex items-center justify-center gap-2 px-6 py-2 bg-blue-600 text-white rounded-xl shadow hover:bg-blue-700 transition">
              <i class="fas fa-edit"></i> Edit Profile
            </a>
			<form action="DeleteUser" method="POST" onsubmit="return confirmDelete();">
				<input type="hidden" name="id" value="${user.userid}">
			    <button type="submit" class="flex items-center justify-center gap-2 px-6 py-2 bg-red-600 text-white rounded-xl shadow hover:bg-red-700 transition">
			    <i class="fas fa-trash-alt"></i> Delete Profile
			  </button>
			</form>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!-- Confirmation Script -->
    <script>
      function confirmDelete() {
        return confirm("Are you sure you want to delete this user?");
      }
    </script>

</body>
</html>
<%@ include file="./partials/footer.jsp" %>
