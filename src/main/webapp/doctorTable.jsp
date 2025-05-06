<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./partials/adminheader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin - All Doctors</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100">

    <!-- Main content -->
    <main class="flex-1 p-10">
      <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">All Registered Doctors</h1>

      <!-- Add Button -->
      <div class="flex justify-end mb-4">
        <a href="doctorRegistration.jsp" class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition">
          <i class="fas fa-user-plus mr-2"></i> Add Doctor
        </a>
      </div>

      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
          <thead class="bg-blue-600 text-white">
            <tr>
              <th class="px-4 py-3">Doctor ID</th>
              <th class="px-4 py-3">Full Name</th>
              <th class="px-4 py-3">Email</th>
              <th class="px-4 py-3">Phone</th>
              <th class="px-4 py-3">Address</th>
              <th class="px-4 py-3">Gender</th>
              <th class="px-4 py-3">Specialization</th>
              <th class="px-4 py-3">Department</th>
              <th class="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody class="text-center text-gray-700">
            <c:forEach var="doctor" items="${doctor}">
            	<tr>
            		<td>${doctor.doctorid}</td>
            		<td>${doctor.fullname}</td>
            		<td>${doctor.email}</td>
            		<td>${doctor.phone}</td>
            		<td>${doctor.address}</td>
            		<td>${doctor.gender}</td>
            		<td>${doctor.specialization}</td>
            		<td>${doctor.department}</td>
					<td>
					  <div class="flex gap-4">
					    <form action="adminEditDoctor.jsp" method="post">
					      <input type="hidden" name="doctorid" value="${doctor.doctorid}">
					      <input type="hidden" name="full_name" value="${doctor.fullname}">
					      <input type="hidden" name="email" value="${doctor.email}">
					      <input type="hidden" name="phone" value="${doctor.phone}">
					      <input type="hidden" name="address" value="${doctor.address}">
					      <input type="hidden" name="gender" value="${doctor.gender}">
					      <input type="hidden" name="specialization" value="${doctor.specialization}">
					      <input type="hidden" name="department" value="${doctor.department}">
					      <input type="submit" value="Edit" class="text-blue-600 hover:underline">
					    </form>
					
					    <form action="AdminDeleteDoctor" method="POST" onsubmit="return confirmDelete();">
					      <input type="hidden" name="doctor_id" value="${doctor.doctorid}">
					      <input type="submit" value="Delete" class="text-red-600 hover:underline">
					    </form>
					  </div>
					</td>
            	</tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>

    <script>
      function confirmDelete() {
        return confirm("Are you sure you want to delete this user?");
      }
    </script>

</body>
</html>
