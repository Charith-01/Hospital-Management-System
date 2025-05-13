<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./partials/adminheader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin - All Clinics</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100">

    <!-- Main content -->
    <main class="flex-1 p-10">
      <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">All Registered Clinics</h1>

      <!-- Add Button -->
      <div class="flex justify-end mb-4">
        <a href="addClinic.jsp" class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition">
          <i class="fas fa-user-plus mr-2"></i> Add Clinic
        </a>
      </div>

      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
          <thead class="bg-blue-600 text-white">
            <tr>
              <th class="px-4 py-3">Clinic ID</th>
              <th class="px-4 py-3">Clinic Name</th>
              <th class="px-4 py-3">Doctor</th>
              <th class="px-4 py-3">Location</th>
              <th class="px-4 py-3">Contact</th>
              <th class="px-4 py-3">Opening hours</th>
              <th class="px-4 py-3">Clinic Image</th>
              <th class="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody class="text-center text-gray-700">
            <c:forEach var="clinic" items="${clinic}">
            	<tr>
            		<td>${clinic.clinicid}</td>
            		<td>${clinic.clinicName}</td>
            		<td>${clinic.doctorName}</td>
            		<td>${clinic.location}</td>
            		<td>${clinic.contactNumber}</td>
            		<td>${clinic.operningHours}</td>
            		<td>
            		  <img src="ClinicImage?id=${clinic.clinicid}" alt="Clinic Image" class="w-20 h-20 object-cover rounded-md mx-auto" />
            		</td>
            		<td>
            		  <div class="flex justify-center gap-4">
            		    <!-- Future Edit/Delete Clinic Buttons -->
            		    <form action="editClinic.jsp" method="post">
            		      <input type="hidden" name="clinic_id" value="${clinic.clinicid}" />
            		      <input type="submit" value="Edit" class="text-blue-600 hover:underline" />
            		    </form>
            		    <form action="DeleteClinic" method="post" onsubmit="return confirmDelete();">
            		      <input type="hidden" name="clinic_id" value="${clinic.clinicid}" />
            		      <input type="submit" value="Delete" class="text-red-600 hover:underline" />
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
        return confirm("Are you sure you want to delete this clinic?");
      }
    </script>

</body>
</html>
