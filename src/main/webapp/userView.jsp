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

      <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
          <thead class="bg-blue-600 text-white">
            <tr>
              <th class="px-4 py-3">User ID</th>
              <th class="px-4 py-3">Full Name</th>
              <th class="px-4 py-3">Email</th>
              <th class="px-4 py-3">Phone</th>
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
            		<td>${user.gender}</td>
            		<td>${user.dob}</td>
            		<td>${user.role}</td>
            		<td>
					  <a href="#" class="text-blue-600 hover:underline mr-2">Edit</a>
					  <a href="#" class="text-red-600 hover:underline">Delete</a>
					</td>
            	</tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>

</body>
</html>
