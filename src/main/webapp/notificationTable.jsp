<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./partials/adminheader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin - All Notifications</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c61dc916f0.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100">

  <!-- Main content -->
  <main class="flex-1 p-10">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">All Notifications</h1>

    <div class="overflow-x-auto">
      <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-blue-600 text-white">
          <tr>
            <th class="px-4 py-3">Notification ID</th>
            <th class="px-4 py-3">User Email</th>
            <th class="px-4 py-3">Message</th>
            <th class="px-4 py-3">Created At</th>
          </tr>
        </thead>
        <tbody class="text-center text-gray-700">
          <c:forEach var="notification" items="${notifications}">
            <tr>
              <td>${notification.id}</td>
              <td>${notification.userEmail}</td>
              <td class="whitespace-normal max-w-xs">${notification.message}</td>
              <td>${notification.createdAt}</td>
              <td>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty notifications}">
            <tr>
              <td colspan="5" class="text-gray-500 italic py-4">No notifications found.</td>
            </tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </main>

</body>
</html>
