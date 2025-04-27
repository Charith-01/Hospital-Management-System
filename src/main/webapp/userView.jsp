<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./partials/adminheader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin - All Users</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100">

    <!-- Main content -->
    <main class="flex-1 p-10">
      <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">All Registered Users</h1>

      <!-- Add Button -->
      <div class="flex justify-end mb-4">
        <a href="registration.jsp" class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition">
          <i class="fas fa-user-plus mr-2"></i> Add User
        </a>
      </div>

      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
          <thead class="bg-blue-600 text-white">
            <tr>
              <th class="px-4 py-3">User ID</th>
              <th class="px-4 py-3">Full Name</th>
              <th class="px-4 py-3">Email</th>
              <th class="px-4 py-3">Phone</th>
              <th class="px-4 py-3">Address</th>
              <th class="px-4 py-3">Gender</th>
              <th class="px-4 py-3">DOB</th>
              <th class="px-4 py-3">Role</th>
              <th class="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody class="text-center text-gray-700">
            <c:forEach var="user" items="${user}">
            	<tr>
            		<td>${user.userid}</td>
            		<td>${user.fullname}</td>
            		<td>${user.email}</td>
            		<td>${user.phone}</td>
            		<td>${user.address}</td>
            		<td>${user.gender}</td>
            		<td>${user.dob}</td>
            		<td>${user.role}</td>
					<td>
					  <div class="flex gap-4">
					    <form action="adminedituser.jsp" method="post">
					      <input type="hidden" name="id" value="${user.userid}">
					      <input type="hidden" name="fullname" value="${user.fullname}">
					      <input type="hidden" name="email" value="${user.email}">
					      <input type="hidden" name="phone" value="${user.phone}">
					      <input type="hidden" name="address" value="${user.address}">
					      <input type="hidden" name="gender" value="${user.gender}">
					      <input type="hidden" name="dob" value="${user.dob}">
					      <input type="submit" value="Edit" class="text-blue-600 hover:underline">
					    </form>
					
					    <form action="DeleteUser" method="POST" onsubmit="return confirmDelete();">
					      <input type="hidden" name="id" value="${user.userid}">
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
